<template>
  <el-table :data="filterTableData" style="width: 100%">
    <el-table-column type="index" />
    <el-table-column >
      <template #default="img">
        {{  }}
      </template>
    </el-table-column>
    <el-table-column label="书名" prop="Book_Name" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search" />
      </template>
      <template #default="scope">
        <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
          Edit
        </el-button>
        <el-button
          size="small"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)"
        >
          Delete
        </el-button>
      </template>
    </el-table-column>
  </el-table>
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
