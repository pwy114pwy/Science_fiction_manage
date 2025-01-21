<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-select v-model="value" filterable placeholder="请选择书籍" style="width: 240px">
          <el-option v-for="item in options" :key="item.Book_ID" :label="item.Book_Name" :value="item.Book_ID" />
        </el-select>
      </el-header>
      <el-main>
        
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
const options = ref([])
onMounted(async () => {
  let res1 = await getBooks()
  let res2 = await getSimpleComment()
  console.log(res2);
  options.value=res1
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
