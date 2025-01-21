<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="20">
          <el-col :span="21">
            <div class="grid-content ep-bg-purple" />
          </el-col>
          <el-col :span="3">
            <el-button @click="drawer2 = true" type="primary">
              添加图书<el-icon class="el-icon--right">
                <Upload />
              </el-icon>
            </el-button>
          </el-col>
        </el-row>

      </el-header>
      <el-main>
        <el-table :data="filterTableData" style="width: 100%">
          <el-table-column type="index" />
          <el-table-column>
            <template #default="{ row }">
              <!-- {{ row }} -->

              <img :src="row.Img_Url" style="width: 50px;" alt="">
              <!-- <img :src="../../static/" alt=""> -->
              <!-- {{ }} -->
            </template>
          </el-table-column>
          <el-table-column label="书名" prop="Book_Name" />
          <el-table-column label="标签" prop="Tag" />
          <el-table-column label="主题" prop="Topic" />
          <el-table-column label="作者" prop="Author" />
          <el-table-column label="评分" prop="Rating" />
          <el-table-column #default="{ row }" label="简介">
            {{ row.Book_Introduce.slice(0, 30) }}...
          </el-table-column>
          <el-table-column align="right">
            <template #header>
              <el-input v-model="search" size="small" placeholder="Type to search" />
            </template>
            <template #default="scope">
              <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                编辑
              </el-button>
              <el-popconfirm title="你确定要删除吗?" @confirm="handleDelete(scope.$index, scope.row)">
                <template #reference>
                  <el-button size="small" type="danger">
                    删除
                  </el-button>
                </template>
              </el-popconfirm>

            </template>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
    <!-- 抽屉 -->
    <el-drawer v-model="drawer2" :direction="direction">
      <template #default>
        <el-form :model="form" style="max-width: 600px">
          <!-- 图书名 -->
          <el-form-item label="书籍名称:">
            <el-input v-model="form.Book_Name" />
          </el-form-item>
          <!-- 标签 -->
          <el-form-item label="书籍标签:">
            <el-checkbox-group v-model="form.TagArr">
              <el-checkbox value="classic" name="type">
                经典
              </el-checkbox>
              <el-checkbox value="hot" name="type">
                热门
              </el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <!-- 主题 -->
          <el-form-item label="书籍主题：">
            <el-input-tag v-model="form.TopicArr" placeholder="Please input"
              aria-label="Please click the Enter key after input" />
            <!-- {{ form }} -->

          </el-form-item>
          <!-- 作者 -->
          <el-form-item label="作者名称:">
            <el-input v-model="form.Author" />
          </el-form-item>
          <el-form-item label="书籍评分:">
            <div class="demo-rate-block">
              <el-rate v-model="form.Rating" :colors="colors" />
            </div>
          </el-form-item>
          <el-form-item label="书籍简介:">
            <el-input v-model="form.Book_Introduce" type="textarea" />
          </el-form-item>
          <el-form-item label="书籍图片:">
            <el-upload class="avatar-uploader" action="http://127.0.0.1:3000/api/upload_bookimg" :show-file-list="false"
              :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
              <img style="width: 100px;" v-if="imageUrl" :src="imageUrl" class="avatar" />
              <el-icon v-else class="avatar-uploader-icon">
                <Plus />
              </el-icon>
            </el-upload>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">提交</el-button>
            <el-button @click="cancelClick">取消</el-button>
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <div style="flex: auto">
          <!-- <el-button @click="cancelClick">cancel</el-button>
          <el-button type="primary" @click="confirmClick">confirm</el-button> -->
        </div>
      </template>
    </el-drawer>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { getBooks } from '@/api/getBooks';
import { addBooks } from '@/api/addBooks';
import { delBooks } from '@/api/deleteBooks';
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
import { fa } from 'element-plus/es/locale';



// 定义一个函数用于刷新图书列表
const refreshBooksList = async () => {
  let res = await getBooks();
  tableData.value = res;
}


//书籍图片
const imageUrl = ref('')

//上传图片
const handleAvatarSuccess: UploadProps['onSuccess'] = (
  response,
  uploadFile
) => {
  imageUrl.value = URL.createObjectURL(uploadFile.raw!)
}

const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
  if (rawFile.type !== 'image/jpeg') {
    ElMessage.error('Avatar picture must be JPG format!');
    return false;
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('Avatar picture size can not exceed 2MB!');
    return false;
  }

  // 创建一个新的文件对象，使用 form.Book_Name 作为文件名
  const newFile = new File([rawFile], `${form.Book_Name}.jpg`, { type: rawFile.type });

  // 更新 imageUrl 为新的文件对象创建的对象 URL（仅用于预览）
  imageUrl.value = URL.createObjectURL(newFile);

  // 输出日志以检查文件名是否已正确设置
  console.log('Setting file name to:', newFile.name);
  form.Img_Url = `../../static/books_img/${form.Book_Name}.jpg`
  // 返回新的文件对象，以便上传时使用
  return newFile;
};

//评分颜色
const colors = ref(['#99A9BF', '#F7BA2A', '#FF9900'])

//主题输入
// const input_Topic = ref<string[]>()

//图书列表
const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.Book_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  // 将当前行的数据赋值给form
  console.log(index, row)
  Object.assign(form, { ...row });
  form.TagArr = row.Tag.split(" ")
  form.TopicArr = row.Topic.split(" ")
  // 如果有图片URL，则更新imageUrl以预览图片
  if (row.Img_Url) {
    imageUrl.value = row.Img_Url;
  }
  // 打开抽屉
  drawer2.value = true;
};
const handleDelete = async (index: number, row) => {
  console.log(index, row)
  let res = await delBooks(row)
  if (res.success) {
    ElMessage({
      message: '删除成功',
      type: 'success',
    })
    await refreshBooksList()
  }
  // console.log(res);

}

//获取数据
const tableData = ref([])
onMounted(async () => {
  // console.log(1);
  let res = await getBooks()
  tableData.value = res
  console.log(res);
})

//抽屉
const drawer2 = ref(false)
const direction = ref<DrawerProps['direction']>('rtl')
const radio1 = ref('Option 1')
//监视抽屉的展开情况
watch(drawer2,(newval,oldval)=>{
  if(newval==false){
    cancelClick()
  }
})
function cancelClick() {
  // 清除表单数据
  Object.assign(form, {
    Book_Name: '',
    TagArr: [],
    Tag: '',
    TopicArr: [],
    Topic: "",
    Author: '',
    Rating: 0,
    Book_introduce: "",
    Img_Url: ''
  });
  imageUrl.value = '';
  drawer2.value = false;
}
function confirmClick() {
  ElMessageBox.confirm(`Are you confirm to chose ${radio1.value} ?`)
    .then(() => {
      drawer2.value = false
    })
    .catch(() => {
      // catch error
    })
}

//表单
const form = reactive({
  Book_Name: '',
  TagArr: [],
  Tag: '',
  TopicArr: [],
  Topic: "",
  Author: '',
  Rating: 0,
  Book_Introduce: "",
  Img_Url: ``
})

const onSubmit = async () => {
  form.Tag = form.TagArr.join(" ")
  form.Topic = form.TopicArr.join(" ")
  let res = await addBooks(JSON.stringify(form))
  if (res.success) {
    ElMessage({
      message: '添加成功',
      type: 'success',
    })
    drawer2.value = false
    await refreshBooksList()
  }
  // console.log(res);
}
</script>
<style lang="scss" scoped>
.el-header,
.el-footer {
  // background-color: #b3c0d1;
  height: 20px;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 20px;

  span {
    font-size: 25px;
  }
}

.el-aside {
  height: 730px;
  background-color: #d3dce6;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 200px;
}

.el-main {
  background-color: #e9eef3;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 160px;
}

body>.el-container {
  margin-bottom: 40px;
}

.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}

//上传按钮
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
