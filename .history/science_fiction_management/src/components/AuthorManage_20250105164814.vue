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
              <img :src="row.Img_Url" style="width: 50px;" alt="">
            </template>
          </el-table-column>
          <el-table-column label="作者名" prop="Author_Name" />
          <el-table-column #default="{ row }" label="作者简介">
            {{ row.Author_Introduction.slice(0, 30) }}...
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
          <el-form-item label="作者简介:">
            <el-input v-model="form.Author_Introduce" type="textarea" />
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
import { getAuthors } from '@/api/getAuthors';
import { addBooks } from '@/api/addBooks';
import { delBooks } from '@/api/deleteBooks';
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'



// 定义一个函数用于刷新图书列表
const refreshAuthorsList = async () => {
  let res = await getAuthors();
  tableData.value = res;
}

//图书列表
const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.Author_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  // 将当前行的数据赋值给form
  Object.assign(form, { ...row });

  form.Boo_ID = row.Book_ID; // 假设你的图书对象有一个id属性标识它是否是一个已有记录
  // 打开抽屉
  drawer2.value = true;
};
const handleDelete = async (index: number, row) => {
  console.log(index, row)
  let res = await delBooks(row)
  if (res.success) {
    ElMessage({
      message: res.message,
      type: 'success',
    })
    await refreshAuthorsList()
  }
  // console.log(res);

}

//获取数据
const tableData = ref([])
onMounted(async () => {
  // console.log(1);
  let res = await getAuthors()
  tableData.value = res
  console.log(res);
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
    Author_Name: '',
    Author_Introduction: ""
  });
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
  Author_Name: '',
  Author_Introduction: ""
})

const onSubmit = async () => {
  let res = await addBooks(form)
  console.log(res);

  if (res.success) {
    ElMessage({
      message: res.message,
      type: 'success',
    })
    drawer2.value = false
    await refreshAuthorsList()
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
