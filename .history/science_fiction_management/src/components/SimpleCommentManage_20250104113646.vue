<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-select v-model="value" filterable placeholder="请选择书籍" style="width: 240px">
          <el-option v-for="item in book_options" :key="item.Book_ID" :label="item.Book_Name" :value="item.Book_ID" />
        </el-select>
      </el-header>
      <el-main>
        <el-table :data="filterUserList" style="width: 100%">
        <el-table-column type="index" />
        <el-table-column label="用户名" prop="User_Name" />
        <el-table-column label="密码" prop="PassWord" />
        <el-table-column label="昵称" prop="NickName" />
        <el-table-column label="邮箱" prop="Email" />
        <el-table-column align="right">
          <template #header>
            <!-- <el-input v-model="search" size="small" placeholder="Type to search" /> -->
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
      {{ value }}
    </el-container>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { getBooks } from '@/api/getBooks';
import { getSimpleComment } from '@/api/getSimpleComment';

const value = ref('')
const book_options = ref([])
const comment_options = ref([])
onMounted(async () => {
  let res1 = await getBooks()
  let res2 = await getSimpleComment()
  console.log(res2);
  book_options.value=res1
})
</script>
<style lang="scss" scoped>
.el-header,
.el-footer {
  // background-color: #b3c0d1;
  height: 20px;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 20px;

  span {
    font-size: 25px;
  }
}
</style>
