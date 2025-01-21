<template>
  <div class="login-container">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span>科幻小说后台管理系统登录</span>
        </div>
      </template>
      <el-form :model="credentials" status-icon :rules="rules" ref="loginForm" label-width="100px"
        class="demo-ruleForm">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="credentials.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="credentials.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('loginForm')">提交</el-button>
          <el-button @click="resetForm('loginForm')">重置</el-button>
        </el-form-item>
      </el-form>
      <p v-if="error" style="color:red">{{ error }}</p>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { login } from '@/api/login';


const router = useRouter();
const loginForm = ref(null);
const credentials = reactive({
  username: '',
  password: ''
});
const error = ref('');

const rules = reactive({
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
  ],
});

const submitForm = async () => {
  try {
    await loginForm.value.validate((valid) => {
      if (!valid) return false;
    });

    const response = await login(credentials)
    // fetch('http://localhost:3000/api/user/login', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json'
    //   },
    //   body: JSON.stringify(credentials)
    // });
    console.log(response);
    if(response.success){
      localStorage.setItem('token', response.token);
      localStorage.setItem('user', JSON.stringify(response.user));
    }
    // const data = await response.json();


    ElMessage({
      message: '登录成功',
      type: 'success',
    });
    router.push('/Index'); // 假设有 dashboard 路由

  } catch (err) {
    console.error('Error logging in:', err);
    error.value = err.message || '服务器错误';
  }
};

const resetForm = (formName) => {
  loginForm.value.resetFields();
};

</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.box-card {
  width: 480px;
}
</style>