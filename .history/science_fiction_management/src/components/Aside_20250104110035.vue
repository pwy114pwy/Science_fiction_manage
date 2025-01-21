<template>
  <el-row class="tac">
    <el-col :span="24">

      <el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose">
        <el-menu-item index="1" @click="to_bigScreen">
          <el-icon>
            <View />
          </el-icon>
          <span>热门书籍数据可视化</span>
        </el-menu-item>
        <el-menu-item index="2" @click="to_bookManage">
          <el-icon>
            <Notebook />
          </el-icon>
          <span>书籍管理</span>
        </el-menu-item>
        <el-menu-item index="3" @click="to_userManage">
          <el-icon>
            <User />
          </el-icon>
          <span>用户管理</span>
        </el-menu-item>
        <el-sub-menu index="4">
          <template #title>
            <el-icon>
              <location />
            </el-icon>
            <span>评论管理</span>
          </template>
          <el-menu-item-group title="">
            <el-menu-item index="1-1">简评管理</el-menu-item>
            <el-menu-item index="1-2"></el-menu-item>
          </el-menu-item-group>
        </el-sub-menu>
        <el-menu-item index="5">
          <el-icon><icon-menu /></el-icon>
          <span>Navigator Two</span>
        </el-menu-item>
        <el-menu-item index="6" disabled>
          <el-icon>
            <document />
          </el-icon>
          <span>Navigator Three</span>
        </el-menu-item>
        <el-menu-item index="7">
          <el-icon>
            <setting />
          </el-icon>
          <span>Navigator Four</span>
        </el-menu-item>
      </el-menu>
    </el-col>
  </el-row>
</template>

<script lang="ts" setup>
import {
  Document,
  Menu as IconMenu,
  Location,
  Setting,
} from '@element-plus/icons-vue'
import { onMounted, ref } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
let $router = useRouter();
const handleOpen = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath)
}
const handleClose = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath)
}
function to_bigScreen() {
  $router.push({
    path: '/bigScreen'
  })
}
function to_bookManage() {
  $router.push({
    path: '/bookManage'
  })
}
function to_userManage() {
  $router.push({
    path: '/userManage'
  })
}
let bookList = ref([])
// onMounted(() => {
//   // console.log(1);
//   fetch('http://127.0.0.1:3000/api/getAllBooks')
//     .then(response => {
//       return response.json(); // 将响应解析为 JSON
//     })
//     .then((data) => {
//       console.log(data);
//       bookList.value = data
//     })
//     .catch(error => console.error(error));


// })
</script>
<style lang="scss" scoped></style>