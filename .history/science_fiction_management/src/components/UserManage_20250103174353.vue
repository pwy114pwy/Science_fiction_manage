<template>
  <el-container>
    <el-header>
      <el-row :gutter="20">
        <el-col :span="21">
          <div class="grid-content ep-bg-purple" />
        </el-col>
        <el-col :span="3">
          <el-button @click="drawer2 = true" type="primary">
            添加用户<el-icon class="el-icon--right">
              <Upload />
            </el-icon>
          </el-button>
        </el-col>
      </el-row>

    </el-header>
    <el-main>
      <el-table :data="filterUserList" style="width: 100%">
        <el-table-column type="index" />
        <el-table-column>
          <!-- <template #default="{ row }"> -->
          <!-- {{ row }} -->

          <!-- <img :src="row.Img_Url" style="width: 50px;" alt=""> -->
          <!-- <img :src="../../static/" alt=""> -->
          <!-- {{ }} -->
          <!-- </template> -->
        </el-table-column>
        <el-table-column label="用户名" prop="User_Name" />
        <el-table-column label="密码" prop="PassWord" />
        <el-table-column label="昵称" prop="NickName" />
        <el-table-column label="邮箱" prop="Email" />
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
              <el-rate v-model.number="form.Rating" :colors="colors" />
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
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { getUsers } from "@/api/getUsers"
let drawer2 = ref(false)
let search = ref("")
let userList = ref([])
const filterUserList = computed(() =>
userList.value.filter(
    (data) =>
      !search.value ||
      data.User_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {


};
const handleDelete = async (index: number, row) => {
  console.log(index, row)


}
onMounted(async () => {
  const response = await getUsers(localStorage.getItem('token'))
  userList.value = response.users
  console.log(response);

})

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
