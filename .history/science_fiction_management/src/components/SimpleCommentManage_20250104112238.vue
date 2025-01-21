<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-select v-model="value" filterable placeholder="Select" style="width: 240px">
          <el-option v-for="item in options" :key="item.Book_Name" :label="item.Book_Name" :value="item.Book_Name" />
        </el-select>
      </el-header>
      <el-main>Main</el-main>
    </el-container>
  </div>

</template>
<script setup lang="ts">
import { onMounted, ref, computed, reactive, watch } from 'vue';
import { getBooks } from '@/api/getBooks';

const value = ref('')
const options = ref([])
onMounted(async () => {
  let res = await getBooks()
  console.log(res);
  options.value=res
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
