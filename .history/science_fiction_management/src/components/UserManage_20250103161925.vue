<template>
  用户管理
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';

onMounted(() => {
  fetch("http://127.0.0.1:3000/api/user")
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
    }
    );

})
</script>
<style lang="scss" scoped></style>
