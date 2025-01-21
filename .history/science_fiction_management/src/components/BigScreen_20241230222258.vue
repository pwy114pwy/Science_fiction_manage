<template>
  数据大屏
</template>
<script setup lang="ts">
import 
onMounted(() => {
  // console.log(1);
  fetch('http://127.0.0.1:3000/api/getAllBooks')
    .then(response => {
      return response.json(); // 将响应解析为 JSON
    })
    .then((data) => {
      console.log(data);
      bookList.value = data
    })
    .catch(error => console.error(error));


})
</script>
<style lang="scss" scoped>

</style>
