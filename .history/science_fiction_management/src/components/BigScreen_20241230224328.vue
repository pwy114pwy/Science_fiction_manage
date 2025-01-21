<template>
  数据大屏
  <div v-for="(item,index) in bookList">
    <span>书名：{{ item.Book_Name }}</span>
  </div>
</template>
<script setup lang="ts">
import { onMounted,ref } from 'vue';
import { Get_Books } from '@/base_api';
let bookList = ref([])
onMounted(() => {
  // console.log(1);
  Get_Books


})
</script>
<style lang="scss" scoped></style>
