<template>
  <div class="common-layout">
    <el-container>
      <el-header>

        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" :ellipsis="false"
          @select="handleSelect">
          <span> <el-button  type="primary" size="default" @click="push_list">
            <el-icon><HomeFilled /></el-icon>
          </el-button>
          </span>
          <span>《{{ Book_Name }}》</span>

          <el-menu-item index="0">
            <!-- <img style="width: 100px" src="/images/element-plus-logo.svg" alt="Element logo" /> -->
          </el-menu-item>
          <el-menu-item index="1" @click="to_charactersManage">人物管理</el-menu-item>
          <el-menu-item index="2" @click="to_relationshipManage">关系管理</el-menu-item>
          <el-menu-item index="3">事件管理</el-menu-item>
          <el-menu-item index="4">世界观管理</el-menu-item>
          <el-menu-item index="5">科技观管理</el-menu-item>
          <el-menu-item index="5">科技观管理</el-menu-item>



        </el-menu>
      </el-header>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </div>

</template>
<script setup lang="ts">
import { ref } from 'vue'
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
let $router = useRouter();
const props = defineProps(["Illustrated_ID", "Book_Name"])
console.log(props.Illustrated_ID);

const activeIndex = ref('1')
const handleSelect = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}
function push_(){
  $router.back()
}
function to_charactersManage() {
  $router.push({
    path: "/illustratedDetail/charactersManage",
    query: {
      Illustrated_ID: props.Illustrated_ID,
      Book_Name: props.Book_Name
    }
  })
}
function to_relationshipManage() {
  $router.push({
    path: "/illustratedDetail/relationshipManage",
    query: {
      Illustrated_ID: props.Illustrated_ID,
      Book_Name: props.Book_Name
    }
  })
}
</script>
<style lang="scss" scoped>
.el-menu {
  background-color: 0;
}

.el-menu--horizontal>.el-menu-item:nth-child(1) {
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
