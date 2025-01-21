<template>
  简评
  <el-select
    v-model="value"
    filterable
    placeholder="Select"
    style="width: 240px"
  >
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    />
  </el-select>
</template>
<script setup lang="ts">

</script>
<style lang="scss" scoped>

</style>
