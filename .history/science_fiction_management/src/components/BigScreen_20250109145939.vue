<template>
  <div class="hotbook">
    
    <!-- <div id="main" style="width: 200px;height:200px;">
      
    </div> -->
  </div>
  
</template>

<script setup lang="ts">
import * as echarts from 'echarts';
import { onMounted, ref } from 'vue';
// import { getBooks } from '@/api/getBooks';

let chartDom = ref<HTMLElement | null>(null);
let myChart: echarts.ECharts | null = null;

onMounted(() => {
  chartDom.value = document.getElementById('main');
  if (chartDom) {
    myChart = echarts.init(chartDom.value);
    const option = {
      tooltip: {
        trigger: 'item'
      },

      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 10,
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
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

    // Uncomment the following lines when you want to fetch data and update the chart
    /*
    getBooks().then(res => {
      // Assuming res is an array of objects with `value` and `name` properties
      if (myChart && Array.isArray(res)) {
        myChart.setOption({
          series: [{
            // Update the data field with the fetched data
            data: res
          }]
        });
      }
    });
    */
  }
});
</script>

<style lang="scss" scoped>

</style>