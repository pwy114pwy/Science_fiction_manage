<template>
  <div class="content">
    <div class="hotbook">
      <div class="common-layout">
        <el-container>
          <el-header>
            <h2>热门图书</h2>
          </el-header>
          <el-main>
            <div id="main1" style="width: 400px;height:280px;"></div>
          </el-main>
        </el-container>
      </div>
    </div>
    <div class="browser">
      <div class="common-layout">
        <el-container>
          <el-header>
            <h2>点击量排名</h2>
          </el-header>
          <el-main>
            <div id="main2" style="width: 400px;height:290px;"></div>
          </el-main>
        </el-container>
      </div>
    </div>
    <div class="bookRating">
      <div class="common-layout">
        <el-container>
          <el-header>
            <h2>书籍评分</h2>
          </el-header>
          <el-main>
            <div id="main3" style="width: 400px;height:280px;"></div>
          </el-main>
        </el-container>
      </div>
    </div>
  </div>



</template>

<script setup lang="ts">
import * as echarts from 'echarts';
import { onMounted, ref } from 'vue';
import { getEChartsOption1 } from '@/echartsConfig';
import { getEChartsOption2 } from '@/echartsConfig';
// import { getEChartsOption3 } from '@/echartsConfig';
import { getAllCollectBook } from '@/api/getAllCollectBook';
import { getAllBrowse } from '@/api/getAllBrowse';
let chartDom1 = ref<HTMLElement | null>(null);
let chartDom2 = ref<HTMLElement | null>(null);
let chartDom3 = ref<HTMLElement | null>(null);
let myChart1: echarts.ECharts | null = null;
let myChart2: echarts.ECharts | null = null;
let myChart3: echarts.ECharts | null = null;
let collect_data = ref([])
let browser_data_x = ref([])
let browser_data_y = ref([])
let rating_data = ref([])
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
function getbrowserdata(browsers) {

  const bookCounts = browsers.reduce((acc, curr) => {
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
  // return result
  result.sort((a,b)=>{
    return b.value-a.value
  })
  console.log(result);
  for (const element of result) {
    browser_data_x.value.push(element.name)
    browser_data_y.value.push(element.value)
  }
  
}
function getRatingdata(collections) {
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
  let res1 = await getAllCollectBook()
  let res2 = await getAllBrowse()
  let res3 = await getAllBrowse()
  collect_data.value = getcollectdata(res1)
  getbrowserdata(res2)
  rating_data.value = getRatingdata(res3)



  chartDom1.value = document.getElementById('main1');
  chartDom2.value = document.getElementById('main2');
  chartDom3.value = document.getElementById('main3');
  if (chartDom1.value) {
    myChart1 = echarts.init(chartDom1.value);
    const option1 = getEChartsOption1(collect_data.value)
    if (myChart1) {
      myChart1.setOption(option1);
    }
  }
  if (chartDom2.value) {
    myChart2 = echarts.init(chartDom2.value);
    const option2 = getEChartsOption2(browser_data_x.value,browser_data_y.value)
    if (myChart2) {
      myChart2.setOption(option2);
    }
  }
  if (chartDom3.value) {
    myChart3 = echarts.init(chartDom3.value);
    const option3 = getEChartsOption2(collect_data.value)
    if (myChart3) {
      myChart3.setOption(option3);
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

.content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}

.hotbook {
  width: 450px;
  height: 320px;
  position: relative;
  background-color: aqua;

  h1 {
    font-size: 20px;
  }
}

.browser {
  width: 450px;
  height: 320px;
  position: relative;
  background-color: aqua;

  h1 {
    font-size: 20px;
  }
}
</style>