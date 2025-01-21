<template>
  <div class="hotbook">
    <h1 class="title">热门图书</h1>
    <div id="main" class="chart"></div>
  </div>
</template>

<script setup lang="ts">
import * as echarts from 'echarts';
import { onMounted, ref } from 'vue';

let chartDom = ref<HTMLElement | null>(null);
let myChart: echarts.ECharts | null = null;

onMounted(() => {
  chartDom.value = document.getElementById('main');
  if (chartDom.value) {
    myChart = echarts.init(chartDom.value);
    const option = {
      tooltip: {
        trigger: 'item',
        backgroundColor: 'rgba(0,0,0,0.75)', // Tooltip background color
        textStyle: {
          color: '#fff'
        }
      },
      legend: {
        orient: 'vertical',
        left: 'left',
        top: 'center',
        textStyle: {
          color: '#999'
        }
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['45%', '65%'],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: true,
            position: 'outside',
            formatter: '{b}: {c} ({d}%)', // Display value and percentage
            color: '#666'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: '14',
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: true,
            lineStyle: {
              color: '#aaa'
            }
          },
          data: [
            { value: 1048, name: 'Search Engine' },
            { value: 735, name: 'Direct' },
            { value: 580, name: 'Email' },
            { value: 484, name: 'Union Ads' },
            { value: 300, name: 'Video Ads' }
          ]
        }
      ]
    };

    if (myChart) {
      myChart.setOption(option);
    }
  }
});
</script>

<style lang="scss" scoped>
.hotbook {
  width: 300px;
  height: 300px;
  padding: 20px;
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.title {
  font-size: 1.2em;
  margin-bottom: 10px;
  color: #333;
  font-weight: bold;
}

.chart {
  width: 100%;
  height: 100%;
}
</style>