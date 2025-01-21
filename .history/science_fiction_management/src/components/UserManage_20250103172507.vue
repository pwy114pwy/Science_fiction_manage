<template>

  <el-container>
      <el-header>
        <el-row :gutter="20">
          <el-col :span="21">
            <div class="grid-content ep-bg-purple" />
          </el-col>
          <el-col :span="3">
            <el-button @click="drawer2 = true" type="primary">
              添加图书<el-icon class="el-icon--right">
                <Upload />
              </el-icon>
            </el-button>
          </el-col>
        </el-row>

      </el-header>
      <el-main>
        <el-table :data="filterTableData" style="width: 100%">
          <el-table-column type="index" />
          <el-table-column>
            <template #default="{ row }">
              <!-- {{ row }} -->

              <img :src="row.Img_Url" style="width: 50px;" alt="">
              <!-- <img :src="../../static/" alt=""> -->
              <!-- {{ }} -->
            </template>
          </el-table-column>
          <el-table-column label="书名" prop="Book_Name" />
          <el-table-column label="标签" prop="Tag" />
          <el-table-column label="主题" prop="Topic" />
          <el-table-column label="作者" prop="Author" />
          <el-table-column label="评分" prop="Rating" />
          <el-table-column #default="{ row }" label="简介">
            {{ row.Book_Introduce.slice(0, 30) }}...
          </el-table-column>
          <el-table-column align="right">
            <template #header>
              <el-input v-model="search" size="small" placeholder="Type to search" />
            </template>
            <template #default="scope">
              <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                编辑
              </el-button>
              <el-popconfirm title="你确定要删除吗?" @confirm="handleDelete(scope.$index, scope.row)">
                <template #reference>
                  <el-button size="small" type="danger">
                    删除
                  </el-button>
                </template>
              </el-popconfirm>

            </template>
          </el-table-column>
        </el-table>
      </el-main>
    </el-container>
</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';

fetch('http://127.0.0.1:3000/api/user/getAllUser', {
  method: 'GEt', // 指定请求方法
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${localStorage.getItem('token')}` // 在这里添加授权令牌
  }
})
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('Error:', error));
</script>
<style lang="scss" scoped></style>
