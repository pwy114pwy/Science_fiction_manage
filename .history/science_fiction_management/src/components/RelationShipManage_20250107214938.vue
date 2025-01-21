<template>
  关系管理
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { useRouter, useRoute, RouterView, RouterLink } from "vue-router";
import { getCharacters } from "@/api/getCharacters"
import { addCharacter } from "@/api/addCharacter"
import { delCharacter } from "@/api/deleteCharacter"
import { ElMessageBox, DrawerProps, UploadProps, ElMessage } from 'element-plus'
let $router=useRouter()
const props = defineProps(["Illustrated_ID", "Book_Name"])
</script>
<style lang="scss" scoped>

</style>
