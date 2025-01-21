<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" :ellipsis="false"
          @select="handleSelect">
          <el-menu-item index="0">
            <!-- <img style="width: 100px" src="/images/element-plus-logo.svg" alt="Element logo" /> -->
          </el-menu-item>
          <el-menu-item index="1">人物管理</el-menu-item>
          <el-menu-item index="2">关系管理</el-menu-item>
          <el-menu-item index="3">世界观管理</el-menu-item>
          <el-menu-item index="4">事件管理</el-menu-item>
          <el-menu-item index="4">事件管理</el-menu-item>
        </el-menu>
      </el-header>
      <el-main>Main
      </el-main>
    </el-container>
  </div>

</template>
<script setup lang="ts">
import { ref } from 'vue'
const props = defineProps(["Illustrated_ID"])
const activeIndex = ref('1')
const handleSelect = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
</script>
<style lang="scss" scoped>
.el-menu{
  background-color: 0;
}
.el-menu--horizontal > .el-menu-item:nth-child(1) {
  margin-right: auto;
  
}
.el-header,
.el-footer {
  // background-color: #b3c0d1;
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
