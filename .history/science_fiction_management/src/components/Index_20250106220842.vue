<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row :gutter="24">
          <el-col :span="22">
            <span>科幻小说图鉴后台管理系统</span>
          </el-col>
          <el-col :span="1">
            <el-button type="primary" size="default" @click="logout">退出登录</el-button>
          </el-col>
        </el-row>
        
        
      </el-header>
      <el-container>
        <el-aside width="200px">
          <Aside></Aside>
        </el-aside>
        <el-container>
          <el-main>
            <RouterView></RouterView>
          </el-main>
          <el-footer>Footer</el-footer>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import Aside from '../components/Aside.vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
let $router = useRouter();
function logout(){

  $router.push({
    path:'/login'
  })
  localStorage.removeItem(use)
}
</script>
<style lang="scss" scoped>
.el-header,
.el-footer {
  background-color: #b3c0d1;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 60px;

  span {
    font-size: 25px;
  }
}

.el-aside {
  // height:730px;
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
</style>
