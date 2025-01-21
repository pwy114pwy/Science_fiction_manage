<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <!-- <div style="margin-bottom: 8px;">选择书籍以查看相关评论：</div> -->
        <!-- <el-tooltip content="选择书籍以查看相关评论" placement="top"> -->
        <div>
          <span style="font-size: 17px;">书籍名称：</span>
          <el-select v-model="value1" filterable placeholder="请选择书籍" style="width: 240px">
            <el-option label="全部" value="All" />
            <el-option v-for="item in book_options" :key="item.Book_ID" :label="item.Book_Name" :value="item.Book_ID" />
          </el-select>
        </div>

        <!-- </el-tooltip> -->
        <!-- <el-tooltip content="选择用户以筛选特定用户的评论" placement="top"> -->
        <div> <span style="font-size: 17px;">用户名称：</span>
          <el-select v-model="value2" filterable placeholder="请选择用户" style="width: 240px">
            <el-option label="全部" value="All" />
            <el-option v-for="item in user_list" :key="item.User_ID" :label="item.User_Name" :value="item.User_Name" />
          </el-select>
        </div>

        <!-- </el-tooltip> -->
      </el-header>
      <el-main>
        <el-table :data="show_comment_list" style="width: 100%">
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
              <!-- <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                编辑
              </el-button> -->
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
      {{ }}
    </el-container>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, watch } from 'vue';
import { getBooks } from '@/api/getBooks';
import { getSimpleComment } from '@/api/getSimpleComment';
import { getUsers } from "@/api/getUsers";
import { delComment } from "@/api/getUsers";

let value1 = ref('All'); // 默认值为 "全部"
let value2 = ref('All'); // 默认值为 "全部"

let book_options = ref([]);
let comment_list = ref([]);
let user_list = ref([]);

// 双重过滤的计算属性
const show_comment_list = computed(() => {
  let filteredComments = [...comment_list.value]; // 复制原始评论列表

  if (value1.value !== 'All') {
    filteredComments = filteredComments.filter(comment => comment.Book_ID == value1.value);
  }

  if (value2.value !== 'All') {
    filteredComments = filteredComments.filter(comment => comment.Comment_User_Name == value2.value);
  }

  return filteredComments;
});

onMounted(async () => {
  try {
    const res1 = await getBooks();
    const res2 = await getSimpleComment();
    const res3 = await getUsers(localStorage.getItem('token'));

    book_options.value = res1;
    comment_list.value = res2;
    user_list.value = res3.users;

    console.log(res2);
  } catch (error) {
    console.error('Failed to fetch data:', error);
  }
});

const handleDelete = async (index: number, row) => {
  console.log(index, row);
  // 实现删除功能...
};
</script>
<style lang="scss" scoped>
.el-header,
.el-footer {
  display: flex;
  justify-content:space-evenly;
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
