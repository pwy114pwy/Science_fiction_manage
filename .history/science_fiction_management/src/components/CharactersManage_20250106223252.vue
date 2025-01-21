<template>
  人物管理
</template>
<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getCharacters } from "@/api/getCharacters"
const props = defineProps(["Illustrated_ID"])
onMounted(async () => {
  let response=await getCharacters({props.Illustrated_ID:})
  console.log(response);
  
})
</script>
<style lang="scss" scoped></style>
