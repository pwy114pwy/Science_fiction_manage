<template>
      <div class="hotbook">
        <div class="common-layout">
          <el-container>
            <el-header>
              <h1>热门图书</h1>
            </el-header>
            <el-main>
              <div id="main" style="width: 400px;height:200px;"></div>
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

onMounted(() => {
  let res= 
  chartDom.value = document.getElementById('main');
  if (chartDom) {
    myChart = echarts.init(chartDom.value);
    const option =getEChartsOption()

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
  height: 250px;
  position: relative;
  background-color: aqua;
  h1{
    font-size: 20px;
  }
}
</style>