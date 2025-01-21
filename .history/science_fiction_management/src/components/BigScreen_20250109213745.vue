<template>
  <div class="content">
    <!-- 热门图书 -->
    <div class="chart-container hotbook">
      <el-card shadow="hover">
        <template #header>
          <div class="chart-title"><i class="el-icon-tickets"></i>热门图书</div>
        </template>
        <div id="main1" class="chart"></div>
      </el-card>
    </div>

    <!-- 点击量排行 -->
    <div class="chart-container browser">
      <el-card shadow="hover">
        <template #header>
          <div class="chart-title"><i class="el-icon-data-line"></i>点击量排行</div>
        </template>
        <div id="main2" class="chart"></div>
      </el-card>
    </div>

    <!-- 评分排行 -->
    <div class="chart-container bookRating">
      <el-card shadow="hover">
        <template #header>
          <div class="chart-title"><i class="el-icon-star-on"></i>评分排行</div>
        </template>
        <div id="main3" class="chart"></div>
      </el-card>
    </div>

    <!-- 热门主题 -->
    <div class="chart-container bookTopic">
      <el-card shadow="hover">
        <template #header>
          <div class="chart-title"><i class="el-icon-chat-dot-round"></i>热门主题</div>
        </template>
        <div id="main4" class="chart"></div>
      </el-card>
    </div>

    <!-- 词云 -->
    <div class="chart-container wordCloud">
      <el-card shadow="hover">
        <template #header>
          <div class="chart-title"><i class="el-icon-picture-outline"></i>词云</div>
        </template>
        <div id="main5" class="chart"></div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
// ... (你的脚本逻辑保持不变)
</script>

<style lang="scss" scoped>
$primary-color: #409EFF;
$background-color: #F5F7FA;
$card-background-color: #FFFFFF;
$border-radius: 8px;

.content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  padding: 20px;
  background-color: $background-color;
}

.chart-container {
  width: calc(50% - 20px); // 占据一半宽度并减去边距
  margin-bottom: 20px;
}

.el-card {
  width: 100%;
  border-radius: $border-radius;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;

  &:hover {
    transform: translateY(-4px);
  }

  .chart-title {
    display: flex;
    align-items: center;
    font-size: 18px;
    color: $primary-color;
    i {
      margin-right: 8px;
      font-size: 24px;
    }
  }

  .chart {
    width: 100%;
    height: 280px;
  }
}
</style>