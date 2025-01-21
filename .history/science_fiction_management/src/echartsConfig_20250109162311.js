
export function getEChartsOption1(data) {
  return {
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
            fontSize: 10,
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: false
        },
        data: data,
        top:"30"
      }
    ]
  };
}

export function getEChartsOption2(data_x,data_y) {
  // console.log(data_x,data_y)
  return {
    xAxis: {
      type: 'category',
      data: data_x.value
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: data_y,
        type: 'bar'
      }
    ]
  };
}