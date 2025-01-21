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
              添加科技观<el-icon class="el-icon--right">
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

              <img :src="row.Science_Image" style="width: 50px;" alt="">
              <!-- <img :src="../../static/" alt=""> -->
              <!-- {{ }} -->
            </template>
          </el-table-column>
          <el-table-column label="图鉴名称" prop="Illustrated_Name" />
          <el-table-column label="科技名称" prop="Science_Name" />
          <el-table-column #default="{ row }" label="科技简介">
            {{ row.Science_description.slice(0, 30) }}...
          </el-table-column>
          <el-table-column label="科技属性" prop="Rating_List" />
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
          <!-- 图鉴名称 -->
          <el-form-item label="图鉴名称:">
            <el-input v-model="form.Illustrated_Name" />
          </el-form-item>
          <!-- 科技名称 -->
          <el-form-item label="科技名称:">
            <el-input v-model="form.Science_Name" />
          </el-form-item>
          <!-- 科技简介 -->
          <el-form-item label="科技简介:">
            <el-input v-model="form.Science_description" type="textarea" />
          </el-form-item>
          <el-form-item label="科技图片:">
            <el-upload class="avatar-uploader" action="http://127.0.0.1:3000/api/upload_bookimg" :show-file-list="false"
              :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
              <img style="width: 100px;" v-if="Science_Image" :src="Science_Image" class="avatar" />
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
import { getScience } from '@/api/getScience';
import { addBooks } from '@/api/addBooks';
import { delBooks } from '@/api/deleteBooks';
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
const props = defineProps(["Illustrated_ID", "Book_Name"])


// 定义一个函数用于刷新科技列表
const refreshBooksList = async () => {
  let res = await getScience({ Illustrated_ID: props.Illustrated_ID });
  tableData.value = res;
}


//科技图片
const Science_Image = ref('')

//上传图片
const handleAvatarSuccess: UploadProps['onSuccess'] = (
  response,
  uploadFile
) => {
  Science_Image.value = URL.createObjectURL(uploadFile.raw!)
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
  const newFile = new File([rawFile], `${form.Science_Name}.jpg`, { type: rawFile.type });

  // 更新 imageUrl 为新的文件对象创建的对象 URL（仅用于预览）
  Science_Image.value = URL.createObjectURL(newFile);

  // 输出日志以检查文件名是否已正确设置
  // console.log('Setting file name to:', newFile.name);
  form.Science_Image = `../../static/science_img/${form.Science_Image}.jpg`
  // 返回新的文件对象，以便上传时使用
  return newFile;
};

//评分颜色
const colors = ref(['#99A9BF', '#F7BA2A', '#FF9900'])


//科技列表
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
  Object.assign(form, { ...row });
  // 如果有图片URL，则更新imageUrl以预览图片
  if (row.Science_Image) {
    Science_Image.value = row.Science_Image;
  }
  // 确保ID也被复制过来
  form.Science_ID = row.Science_ID; // 假设你的图书对象有一个id属性标识它是否是一个已有记录
  // 打开抽屉
  drawer2.value = true;
};
const handleDelete = async (index: number, row) => {
  // console.log(index, row)
  let res = await delBooks(row)
  if (res.success) {
    ElMessage({
      message: res.message,
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
  let res = await getScience({ Illustrated_ID: props.Illustrated_ID })
  tableData.value = res
  for (const element of tableData.value) {
    console.log(element);
    let arr = []
    for (const key in element) {
      if (key.includes("Rating")) {
        switch (key) {
          case "Science_Rating_Strength":
            arr.push({ "key": "力量", "value": element[key] })
            break;
          case "Science_Rating_Speed":
            arr.push({ "key": "速度", "value": element[key] })
            break;
          case "Science_Rating_Intelligence":
            arr.push({ "key": "智能", "value": element[key] })
            break;
          case "Science_Rating_Durability":
            arr.push({ "key": "耐久", "value": element[key] })
            break;

          default:
            break;
        }

      }
    }
    element['Rating_List'] = arr


  }
  console.log(tableData.value);
})

//抽屉
const drawer2 = ref(false)
const direction = ref<DrawerProps['direction']>('rtl')
const radio1 = ref('Option 1')
//监视抽屉的展开情况
watch(drawer2, (newval, oldval) => {
  if (newval == false) {
    cancelClick()
  }
})
function cancelClick() {
  // 清除表单数据
  Object.assign(form, {
    Science_ID: "",
    Illustrated_ID: "",
    Illustrated_Name: '',
    Science_Name: "",
    Science_Image: "",
    Science_description: "",
    Science_Rating_Strength: "",
    Science_Rating_Speed: "",
    Science_Rating_Intelligence: "",
    Science_Rating_Durability: "",
    Rating_List: []
  });
  Science_Image.value = '';
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
  Science_ID: "",
  Illustrated_ID: "",
  Illustrated_Name: '',
  Science_Name: "",
  Science_Image: "",
  Science_description: "",
  Science_Rating_Strength: "",
  Science_Rating_Speed: "",
  Science_Rating_Intelligence: "",
  Science_Rating_Durability: "",
  Rating_List: []
})

const onSubmit = async () => {
  // form.Tag = form.TagArr.join(" ")

  let res = await addBooks(form)
  // console.log(res);

  if (res.success) {
    ElMessage({
      message: res.message,
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
