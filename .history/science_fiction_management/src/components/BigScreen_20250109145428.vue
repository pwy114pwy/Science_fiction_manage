<template>
  数据大屏
  <div v-for="(item,index) in bookList">
    <span>书名：{{ item.Book_Name }}</span>
  </div>
</template>
<script setup lang="ts">
import { onMounted,ref } from 'vue';
import { getBooks } from '@/api/getBooks';
import * as echarts from 'echarts';
let bookList = ref([])



var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

option = {
  tooltip: {
    trigger: 'item'
  },
  legend: {
    top: '5%',
    left: 'center'
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
          fontSize: 40,
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

option && myChart.setOption(option);
onMounted(async () => {
  // console.log(1);
  let res=await getBooks()
  bookList.value=res
  // console.log(res);
  


})
</script>
<style lang="scss" scoped></style>
