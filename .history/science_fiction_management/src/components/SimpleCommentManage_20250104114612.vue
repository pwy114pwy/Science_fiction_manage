<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-select v-model="value" filterable placeholder="请选择书籍" style="width: 240px">
          <el-option label="全部" value="All" />
          <el-option v-for="item in book_options" :key="item.Book_ID" :label="item.Book_Name" :value="item.Book_ID" />
        </el-select>
      </el-header>
      <el-main>
        <el-table :data="show_comment_options" style="width: 100%">
        <el-table-column type="index" />
        <el-table-column label="书籍号" prop="Book_ID" />
        <el-table-column label="书籍名" prop="Book_Name" />
        <el-table-column label="评论内容" prop="Comment_Content" />
        <el-table-column label="评论时间" prop="Comment_Time" />
        <el-table-column label="评论用户名" prop="Comment_User_Name" />
        <el-table-column label="评论用户昵称" prop="Comment_User_NickName" />
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

let value = ref('')
let book_options = ref([])
let show_comment_options = ref([])
let comment_options = ref([])
watch(value,(newval,oldval)=>{
  console.log(newval);
  if(newval=="")
  show_comment_options.value=comment_options.value.filter((item)=>{
    return item.Book_ID==newval
  })
})
onMounted(async () => {
  let res1 = await getBooks()
  let res2 = await getSimpleComment()
  console.log(res2);
  book_options.value=res1
  comment_options.value=res2
  show_comment_options.value=res2
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
