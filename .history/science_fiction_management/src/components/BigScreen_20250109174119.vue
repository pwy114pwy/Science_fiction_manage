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
            <h2>点击量排行</h2>
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
            <h2>评分排行</h2>
          </el-header>
          <el-main>
            <div id="main3" style="width: 400px;height:280px;"></div>
          </el-main>
        </el-container>
      </div>
    </div>
    <div class="bookTopic">
      <div class="common-layout">
        <el-container>
          <el-header>
            <h2>热门主题</h2>
          </el-header>
          <el-main>
            <div id="main4" style="width: 400px;height:280px;"></div>
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
import { getAllRating } from '@/api/getRating';
import { getbookTopic } from '@/api/getbookTopic';
let chartDom1 = ref<HTMLElement | null>(null);
let chartDom2 = ref<HTMLElement | null>(null);
let chartDom3 = ref<HTMLElement | null>(null);
let chartDom4 = ref<HTMLElement | null>(null);
let myChart1: echarts.ECharts | null = null;
let myChart2: echarts.ECharts | null = null;
let myChart3: echarts.ECharts | null = null;
let myChart4: echarts.ECharts | null = null;
let collect_data = ref([])
let browser_data_x = ref([])
let browser_data_y = ref([])
let rating_data_x = ref([])
let rating_data_y = ref([])
let topic_data = ref([])
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
  // console.log(result);
  for (const element of result) {
    browser_data_x.value.push(element.name)
    browser_data_y.value.push(element.value)
  }
  
}
function getTopicdata(topic) {
    console.log(topic);
    let bookarr=[]
    for (const element of topic) {
      bookarr.push(element.Topic.sp;ir)
    }
    console.log(bookarr);
    
    return []

}
function getRatingdata(ratings) {
    // console.log(ratings);
    ratings.sort((a,b)=>{
      return b.Rating-a.Rating
    })
    for (const element of ratings) {
      rating_data_x.value.push(element.Book_Name)
      rating_data_y.value.push(element.Rating)
    }

}
onMounted(async () => {
  let res1 = await getAllCollectBook()
  let res2 = await getAllBrowse()
  let res3 = await getAllRating()
  let res4 = await getbookTopic()
  // console.log(res4);
  
  collect_data.value = getcollectdata(res1)
  getbrowserdata(res2)
  getRatingdata(res3)
  topic_data.value=getTopicdata(res4)
  


  chartDom1.value = document.getElementById('main1');
  chartDom2.value = document.getElementById('main2');
  chartDom3.value = document.getElementById('main3');
  chartDom4.value = document.getElementById('main4');
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
    const option3 = getEChartsOption2(rating_data_x.value,rating_data_y.value)
    if (myChart3) {
      myChart3.setOption(option3);
    }
  }
  if (chartDom4.value) {
    myChart4 = echarts.init(chartDom4.value);
    const option4 = getEChartsOption2(topic_data.value)
    if (myChart4) {
      myChart4.setOption(option4);
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
.bookRating {
  width: 450px;
  height: 320px;
  position: relative;
  background-color: aqua;

  h1 {
    font-size: 20px;
  }
}
.bookTopic {
  width: 450px;
  height: 320px;
  position: relative;
  background-color: aqua;

  h1 {
    font-size: 20px;
  }
}
</style>