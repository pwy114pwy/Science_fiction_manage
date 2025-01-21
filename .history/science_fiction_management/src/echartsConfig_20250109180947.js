
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
        name: '收藏数',
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
  return {
    xAxis: {
      type: 'category',
      data: data_x,
      axisLabel: {
        rotate: 45, // 设置 X 轴标签的旋转角度，默认为 45 度
        interval: 0,         // 强制显示所有标签，避免自动隐藏某些标签
      }
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
export function getEChartsOption3(data_x,data_y) {
  return {
    xAxis: {
      type: 'category',
      data: data_x,
      axisLabel: {
        rotate: 45, // 设置 X 轴标签的旋转角度，默认为 45 度
        interval: 0,         // 强制显示所有标签，避免自动隐藏某些标签
      }
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
export function getEChartsOption4(data) {
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
        name: '书籍数',
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

