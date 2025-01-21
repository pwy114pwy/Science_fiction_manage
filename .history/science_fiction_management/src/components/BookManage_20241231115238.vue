<template>
  书籍列表
</template>
<script setup lang="ts">
import { onMounted,ref } from 'vue';
import { getBooks } from '@/api/getBooks';
let bookList = ref([])
onMounted(async () => {
  // console.log(1);
  let res=await getBooks()
  bookList.value=res
  console.log(res);
  


})
</script>
<style lang="scss" scoped>

</style>
