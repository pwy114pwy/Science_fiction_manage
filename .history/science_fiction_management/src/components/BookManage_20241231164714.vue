<template>
   <div class="common-layout">
    <el-container>
      <el-header>Header</el-header>
      <el-main>Main</el-main>
    </el-container>
  </div>
  
</template>
<script setup lang="ts">
import { onMounted,ref,computed } from 'vue';
import { getBooks } from '@/api/getBooks';


const search = ref('')
const filterTableData = computed(() =>
  tableData.value.filter(
    (data) =>
      !search.value ||
      data.Book_Name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number, row) => {
  console.log(index, row)
}
const handleDelete = (index: number, row) => {
  console.log(index, row)
}

const tableData =ref([])
onMounted(async () => {
  // console.log(1);
  let res=await getBooks()
  tableData.value=res
  console.log(res);
  


})
</script>
<style lang="scss" scoped>

</style>
