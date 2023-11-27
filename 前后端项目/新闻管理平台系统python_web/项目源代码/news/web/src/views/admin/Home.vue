<template>
  <div>
    <div class="panel">
      <el-col :span="6" v-if="userInfo.role_type==='超级管理员'">
        <div class="grid-content bg-purple">
          用户总计：{{ panel.userCount }}人
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple">
          新闻发布总量：{{ panel.goodsCount }}条
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple">
          评论总数：{{ panel.commentCount }}条
        </div>
      </el-col>
    </div>

    <div class="statistic">
      <div id="bar" style="width: 800px; height: 400px"></div>
      <div id="bar2" style="width: 500px; height: 400px"></div>
    </div>

  </div>

</template>
<script>
import * as echarts from 'echarts'
import utils from "@/utils/utils";


let barOption = {
  title: {
    text: '近七天发布数量统计',
    subtext: '',
    left: 'center'
  },
  legend: {
    top: 'top'
  },
  tooltip: {
    trigger: 'axis'
  },
  xAxis: {
    type: 'category',
    data: []
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '',
      data: [],
      type: 'bar'
    }
  ]
};

let barOption2 = {
  title: {
    text: '近七天评论数据统计',
    subtext: '',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '近七天反馈数据统计',
      type: 'pie',
      radius: '50%',
      // data: this.result.statistics,
      data: [
        // {value: 1048, name: '饮料'},
        // {value: 735, name: '啤酒'},
        // {value: 580, name: '矿泉水'},
        // {value: 484, name: '羽绒服'},
        // {value: 300, name: '衬衫'}
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
}


export default {
  data() {
    return {
      result: {},
      panel: {},
      userInfo: {}

    }
  },
  created() {
    this.userInfo = JSON.parse(utils.getUserInfo())
  },
  methods: {
    getEcharts() {
      this.$axios.get("/sysUser/echarts").then(res => {
        this.result = res.data
        this.panel = res.data.panel
        var barChart = echarts.init(document.getElementById('bar'));
        barOption.xAxis.data = this.result.x
        barOption.series[0].data = this.result.y
        barChart.setOption(barOption)

        var barChart2 = echarts.init(document.getElementById('bar2'));
        console.log(barOption2.series)
        barOption2.series[0].data = this.result.statistic
        barChart2.setOption(barOption2)
        console.log(barOption2.series.data)
      })
    }
  },
  mounted() {
    this.getEcharts()
      //请求到数据后在加载
      this.getEcharts()
  }
}

</script>
<style>
.panel {
  display: flex;
  justify-content: space-around;
  font-size: 23px;
  font-weight: bold;
}

.grid-content {
  height: 100px;
  line-height: 100px;
  text-align: center;
}

.statistic {
  display: flex;
  justify-content: space-around;
  margin: 30px auto;
}

.el-col {
  border-radius: 4px;
}

.bg-purple-dark {
  background: #99a9bf;
}

.bg-purple {
  background: #d3dce6;
}

.bg-purple-light {
  background: #e5e9f2;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}


</style>
