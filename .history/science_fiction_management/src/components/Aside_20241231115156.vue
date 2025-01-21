<template>
  <el-row class="tac">
    <el-col :span="24">

      <el-menu default-active="2" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose">
        <el-menu-item index="1" @click="to_bigScreen">
          <el-icon>
            <View />
          </el-icon>
          <span>热门书籍数据可视化</span>
        </el-menu-item>
        <el-menu-item index="2" @click="to_bookManage">
          <el-icon><Notebook /></el-icon>
          <span>书籍管理</span>
        </el-menu-item>
        <el-sub-menu index="3">
          <template #title>
            <el-icon>
              <location />
            </el-icon>
            <span>Navigator One</span>
          </template>
          <el-menu-item-group title="Group One">
            <el-menu-item index="1-1">item one</el-menu-item>
            <el-menu-item index="1-2">item two</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="Group Two">
            <el-menu-item index="1-3">item three</el-menu-item>
          </el-menu-item-group>
          <el-sub-menu index="1-4">
            <template #title>item four</template>
            <el-menu-item index="1-4-1">item one</el-menu-item>
          </el-sub-menu>
        </el-sub-menu>
        <el-menu-item index="4">
          <el-icon><icon-menu /></el-icon>
          <span>Navigator Two</span>
        </el-menu-item>
        <el-menu-item index="5" disabled>
          <el-icon>
            <document />
          </el-icon>
          <span>Navigator Three</span>
        </el-menu-item>
        <el-menu-item index="6">
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
// import {
//   Document,
//   Menu as IconMenu,
//   Location,
//   Setting,
// } from '@element-plus/icons-vue'
import { onMounted, ref } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
let $router = useRouter();
const handleOpen = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
const handleClose = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
function to_bigScreen() {
  $router.push({
    path: '/bigScreen'
  })
}
function to_bookManage() {
  $router.push({
    path: '/bigScreen'
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