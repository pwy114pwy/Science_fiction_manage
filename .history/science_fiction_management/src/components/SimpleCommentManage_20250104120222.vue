<script setup lang="ts">
import { onMounted, ref, computed, watch } from 'vue';
import { getBooks } from '@/api/getBooks';
import { getSimpleComment } from '@/api/getSimpleComment';
import { getUsers } from "@/api/getUsers";

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
    filteredComments = filteredComments.filter(comment => comment.User_ID == value2.value);
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

    console.log(res3);
  } catch (error) {
    console.error('Failed to fetch data:', error);
  }
});

const handleDelete = async (index: number, row) => {
  console.log(index, row);
  // 实现删除功能...
};
</script>