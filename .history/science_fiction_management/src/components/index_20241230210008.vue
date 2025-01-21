<template>

  <div>
      <router-view></router-view>
      <el-button>Default</el-button>
      <el-button type="primary" plain>Primary plain</el-button>
      <el-button type="success">Success</el-button>
      <el-button type="info">Info</el-button>
      <el-button type="warning" round>Warning round</el-button>
      <el-button type="danger" :icon="Delete" circle> 危险</el-button>
  </div>
</template>
<script setup lang="ts">

</script>
<style lang="scss" scoped>

</style>
