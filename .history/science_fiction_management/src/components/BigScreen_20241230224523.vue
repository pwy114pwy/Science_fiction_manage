<template>
  数据大屏
  <div v-for="(item,index) in bookList">
    <span>书名：{{ item.Book_Name }}</span>
  </div>
</template>
<script setup lang="ts">
import { onMounted,ref } from 'vue';
import { getBooks } from '@/api/getBooks';
let bookList = ref([])
onMounted(async () => {
  // console.log(1);
  let res=await getBooks()
  boo
  console.log(res);
  


})
</script>
<style lang="scss" scoped></style>
