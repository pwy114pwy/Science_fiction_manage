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
  <el-drawer v-model="drawer2" :direction="direction" title="">
    <el-form :model="newUserForm" :rules="rules" ref="userFormRef" label-width="100px" class="demo-ruleForm">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="newUserForm.username"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="newUserForm.password" type="password"></el-input>
      </el-form-item>
      <el-form-item label="昵称" prop="nickname">
        <el-input v-model="newUserForm.nickname"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="newUserForm.email"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm(userFormRef)">提交</el-button>
        <el-button @click="resetForm(userFormRef)">重置</el-button>
      </el-form-item>
    </el-form>
  </el-drawer>
</template>

<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { ElMessage, FormInstance, FormRules } from 'element-plus';
import { getUsers } from "@/api/getUsers"
import { addUser } from "@/api/addUser"
import { delUser } from "@/api/delUser"


let drawer2 = ref(false);
let search = ref("");
let userList = ref([]);

const direction = ref('rtl');

const newUserForm = reactive({
  username: '',
  password: '',
  nickname: '',
  email: ''
});
watch(drawer2, (newval, oldval) => {
  if (newval == false) {
    Object.assign(newUserForm, {
      username: '',
      password: '',
      nickname: '',
      email: ''
    })
  }
})

const rules = reactive<FormRules>({
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
  nickname: [{ required: true, message: '请输入昵称', trigger: 'blur' }],
  email: [{ required: true, message: '请输入邮箱', trigger: 'blur' }, { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }]
});

const userFormRef = ref<FormInstance>();

const filterUserList = computed(() =>
  userList.value.filter(
    (data) =>
      !search.value ||
      data.User_Name.toLowerCase().includes(search.value.toLowerCase())
  )
);

const handleEdit = (index: number, row) => {
  // Implement edit functionality here...
};

const handleDelete = async (index: number, row) => {
  console.log(index, {row.User_ID);
  // const response = await delUser({ row.User_ID })
  // console.log(response);

  // Implement delete functionality here...
};

onMounted(async () => {
  const response = await getUsers(localStorage.getItem('token'));
  userList.value = response.users;
});

const submitForm = async (formEl: FormInstance | undefined) => {
  if (!formEl) return;
  await formEl.validate(async (valid, fields) => {
    if (valid) {
      try {
        await addUser(JSON.stringify(newUserForm));
        ElMessage.success('用户添加成功');
        drawer2.value = false;
        await refreshUserList();
      } catch (error) {
        ElMessage.error('用户添加失败');
      }
    } else {
      console.log('error submit!', fields);
    }
  });
};

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return;
  formEl.resetFields();
};

const refreshUserList = async () => {
  const response = await getUsers(localStorage.getItem('token'));
  userList.value = response.users;
};
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
