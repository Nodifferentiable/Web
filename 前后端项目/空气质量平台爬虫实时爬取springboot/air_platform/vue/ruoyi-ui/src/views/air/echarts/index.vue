<template>
  <div class="app-container">
    <el-row v-show="!isEmpty">
      <el-col style="text-align: center;">
        <div style="color: #409EFF;font-size: 48px;">最新市级空气质量数据</div>
      </el-col>
    </el-row>
    <el-row v-show="!isEmpty">
      <el-col style="text-align: center;">
        <div style="color: #909399;font-size: 24px;">最新爬取数据时间为：{{ newestTime }}</div>
      </el-col>
    </el-row>
    <el-row v-show="isEmpty">
      <el-col style="text-align: center;">
        <div style="color: #F56C6C;font-size: 36px;">未检索到当前省份数据</div>
      </el-col>
    </el-row>
    <el-row>
      <el-col style="margin-left: 90px;margin-top: 24px;">
        <el-select v-model="province" placeholder="请选择省" @change="provinceChanged">
          <el-option
            v-for="dict in dict.type.air_province"
            :key="dict.value"
            :label="dict.label"
            :value="dict.label"
          />
        </el-select>
        <el-button type="primary" style="margin-left: 24px;" :loading="buttonLoading" @click="getNewestData()">点击爬取最新数据
        </el-button>
      </el-col>
    </el-row>
    <div id="bar" style="width:100%; height:350px;"></div>
    <div style="text-align: center;color: #E6A23C">市级空气数据柱状图</div>
    <div id="line" style="width:100%; height:350px;"></div>
    <div style="text-align: center;color: #E6A23C">市级空气数折线图</div>
    <div id="pictorialBar" style="width:100%; height:350px;"></div>
    <div style="text-align: center;color: #E6A23C">市级空气数据象形柱状图</div>
    <div id="pie" style="width:100%; height:350px;"></div>
    <div style="text-align: center;color: #E6A23C">市级空气质量饼图</div>
    <el-row v-show="!isEmpty">
      <el-col style="text-align: center;">
        <div style="color: #409EFF;font-size: 48px;">市级所有监测点空气质量分布状况</div>
      </el-col>
    </el-row>
    <div v-if="pointQuality" v-for="data in pointQuality">
      <div style="width:30%; float: left">
        <div :id="data.city" style=" height:350px;"></div>
        <div style="text-align: center;color: #E6A23C">{{ data.city }}站点级空气质量饼图</div>
      </div>
    </div>
  </div>

</template>


<script>
import {
  getCityDataByProvinceName,
  getNewestDataByProvinceName,
  getCityQualityByProvinceName,
  getPointQualityByProvinceName
} from "@/api/air/air";
import * as echarts from 'echarts';

export default {
  name: "Echarts",
  dicts: ['air_province'],
  data() {
    return {
      // 版本号
      version: "3.8.2",
      newestTime: '',
      province: '河南省',
      isEmpty: false,
      buttonLoading: false,
      timer: null,
      pointQuality: []
    };
  },
  mounted() {
    this.provinceChanged()
    getPointQualityByProvinceName(this.province).then(res => {
      this.pointQuality = res.data
      this.initPointEcharts()
    });
  },
  watch: {
    buttonLoading() {
      if (this.buttonLoading) {
        this.timer = setInterval(() => {
          this.provinceChanged();
        }, 3000);
      }
    }

  },
  methods: {
    provinceChanged() {
      this.initEcharts('bar');
      this.initEcharts('line');
      this.initEcharts('pictorialBar');
      this.initCityEcharts('pie');
      getPointQualityByProvinceName(this.province).then(res => {
        this.pointQuality = res.data
        this.initPointEcharts()
      });
    },
    initEcharts(type) {
      var chartDom = document.getElementById(type);
      var myChart = echarts.init(chartDom);
      var option;
      option = {
        legend: {
          // Try 'horizontal,vertical'
          orient: 'vertical',
          right: 10,
          top: 'center'
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
            data: [],
            type: 'bar',
            label: {
              normal: {
                show: true,
                position: 'top',
              }
            }
          }
        ],
      };
      option.xAxis.data = ['AQI指数', 'PM2.5', 'PM10', 'Co', 'No2', 'So2', 'O3']
      getCityDataByProvinceName(this.province).then(res => {
        myChart.clear()
        if (res.data.length === 0) {
          this.isEmpty = true
        } else {
          this.isEmpty = false
        }
        var dataList = []
        for (let i = 0; i < res.data.length; i++) {
          dataList.push({
            'data': res.data[i].data,
            'type': type,
            'name': res.data[i].cityName,
            'label': {
              'normal': {
                'show': true,
                'position': 'top',
              }
            }
          })
          this.newestTime = res.data[i].newestTime
        }
        option.series = dataList
        myChart.setOption(option);
      })

    },
    initCityEcharts(type) {
      var chartDom = document.getElementById(type);
      var myChart = echarts.init(chartDom);
      var option;
      option = {
        legend: {
          // Try 'horizontal,vertical'
          orient: 'vertical',
          right: 10,
          top: 'center'
        },
        series: [],
      };
      getCityQualityByProvinceName(this.province).then(res => {
        myChart.clear()
        if (res.data.length === 0) {
          this.isEmpty = true
        } else {
          this.isEmpty = false
        }
        var dataList = []
        dataList.push({
          'data': res.data,
          'type': type,
          'label': {
            'normal': {
              'show': true,
              'position': 'top',
            }
          }
        })
        // }
        option.series = dataList
        myChart.setOption(option);
      })

    },
    initPointEcharts() {
      setTimeout(() => {
        this.pointQuality.forEach(i => {
          var chartDom = document.getElementById(i.city);
          var myChart = echarts.init(chartDom);
          var option;
          option = {
            legend: {
              // Try 'horizontal,vertical'
              orient: 'vertical',
              right: 10,
              top: 'center'
            },
            series: [],
          };

          myChart.clear()

          var dataList = []
          dataList.push({
            'data': i.data,
            'type': 'pie',
            // 'name': res.data[i].cityName,
            'label': {
              'normal': {
                'show': true,
                'position': 'top',
              }
            }
          })

          option.series = dataList
          myChart.setOption(option);
        })
      }, 500);

    },
    getNewestData() {
      this.buttonLoading = true
      this.$message('正在爬取数据...');
      getNewestDataByProvinceName(this.province).then(res => {
        this.$message({
          message: '数据爬取完成',
          type: 'success'
        });
        this.buttonLoading = false
        clearTimeout(this.timer)
        this.provinceChanged();
      })
    }
  },
  beforeDestory() {
    clearTimeout(this.timer)
    this.timer = null;
  }

};
</script>
