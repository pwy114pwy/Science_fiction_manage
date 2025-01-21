<template>
  <div class="hotbook">
    <div class="common-layout">
      <el-container>
        <el-header>
          <h2>热门图书</h2>
        </el-header>
        <el-main>
          <div id="main" style="width: 400px;height:220px;"></div>
        </el-main>
      </el-container>
    </div>
  </div>


</template>

<script setup lang="ts">
import * as echarts from 'echarts';
import { onMounted, ref } from 'vue';
import { getEChartsOption } from '@/echartsConfig';
import { getAllCollectBook } from '@/api/getAllCollectBook';

let chartDom = ref<HTMLElement | null>(null);
let myChart: echarts.ECharts | null = null;
let collect_data = ref([])
function getcollectdata(collections) {
  // 使用 reduce 统计每本书籍的出现次数
  const bookCounts = collections.reduce((acc, curr) => {
    if (!acc[curr.Book_Name]) {
      acc[curr.Book_Name] = 0;
    }
    acc[curr.Book_Name] += 1;
    return acc;
  }, {});

  // 将统计结果转换为 [{Book_Name:"", value:"}] 格式的数组
  const result = Object.keys(bookCounts).map(key => ({
    name: key,
    value: bookCounts[key]
  }));
  return result
}
onMounted(async () => {
  let res = await getAllCollectBook()
  collect_data.value=getcollectdata(res)

  console.log(collect_data.value);

  chartDom.value = document.getElementById('main');
  if (chartDom) {
    myChart = echarts.init(chartDom.value);
    const option = getEChartsOption(collect_data.value)

    if (myChart) {
      myChart.setOption(option);
    }
  }
});
</script>

<style lang="scss" scoped>
.el-header,
.el-footer {
  display: flex;
  justify-content: space-evenly;
  // background-color: #b3c0d1;
  height: 20px;
  color: var(--el-text-color-primary);
  text-align: center;
  line-height: 20px;

  span {
    font-size: 25px;
  }
}

.hotbook {
  width: 450px;
  height: 300px;
  position: relative;
  background-color: aqua;

  h1 {
    font-size: 20px;
  }
}
</style>