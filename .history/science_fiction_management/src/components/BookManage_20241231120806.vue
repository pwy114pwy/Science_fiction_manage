<template>
  <el-table :data="filterTableData" style="width: 100%">
    <el-table-column label="Date" prop="date" />
    <el-table-column label="Name" prop="name" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search" />
      </template>
      <template #default="scope">
        <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
          Edit
        </el-button>
        <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">
          Delete
        </el-button>
      </template>
    </el-table-column>
  </el-table>
</template>
<script setup lang="ts">
import { onMounted, ref, computed } from 'vue';
import { getBooks } from '@/api/getBooks';
let bookList = ref([])



const search = ref('')
const filterTableData = computed(() =>
  tableData.filter(
    (data) =>
      !search.value ||
      data.name.toLowerCase().includes(search.value.toLowerCase())
  )
)
const handleEdit = (index: number) => {
  console.log(index)
}
const handleDelete = (index: number) => {
  console.log(index)
}

const tableData = []
onMounted(async () => {
  // console.log(1);
  let res = await getBooks()
  tableData.value = res
  console.log(res);



})
</script>
<style lang="scss" scoped></style>
