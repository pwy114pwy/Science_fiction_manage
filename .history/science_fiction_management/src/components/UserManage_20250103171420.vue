<template>
  用户管理
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';

fetch('https:127.0.0.1:3000/api/user/getAllUser', {
  method: 'POST', // 指定请求方法
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token');}` // 在这里添加授权令牌
  },
  body: JSON.stringify({
    key: 'value'
  })
})
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('Error:', error));
</script>
<style lang="scss" scoped></style>
