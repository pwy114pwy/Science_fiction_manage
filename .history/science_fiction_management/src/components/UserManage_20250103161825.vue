<template>
  用户管理
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';

onMounted(() => {
  fetch("http://example.com/movies.json")
    .then((response) => response.json())
    .then((data) =>{}
     );

})
</script>
<style lang="scss" scoped></style>
