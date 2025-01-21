<template>
  <router-view></router-view>
  <div>
      <el-button>Default</el-button>
      <el-button type="primary" plain>Primary plain</el-button>
      <el-button type="success">Success</el-button>
      <el-button type="info">Info</el-button>
      <el-button type="warning" round>Warning round</el-button>
      <el-button type="danger" :icon="Delete" circle> 危险</el-button>
  </div>
</template>

————————————————

                          版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
                      
原文链接：https://blog.csdn.net/qq_40930841/article/details/143999809

<script setup lang="ts">

</script>
<style lang="scss" scoped>

</style>
