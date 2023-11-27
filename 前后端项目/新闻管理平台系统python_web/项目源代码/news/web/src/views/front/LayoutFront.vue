<template>
  <div class="box">
    <div class="container-fluid padding15">
      <div class="container">
        <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b">
          <el-menu-item index="999">
            <router-link tag="div"
                         to="front">
              <img src="../../assets/logo.png" alt="" height="55">
            </router-link>
          </el-menu-item>

          <el-menu-item index="1">
            <router-link tag="div"
                         to="front">
              首页
            </router-link>
          </el-menu-item>

          <el-menu-item index="4"><a href="/" target="_blank">后台管理</a></el-menu-item>

        </el-menu>
      </div>
    </div>
    <div class="container" style="padding-bottom: 110px">
      <router-view/>
    </div>

    <div class="footer">
      <p>版权所有，翻版必究</p>
      <p>©2023 </p>
    </div>

  </div>

</template>
<script>

export default {
  data() {
    return {
      activeIndex: '1',
      activeIndex2: '1',
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
  }

}
</script>
<style scoped>

.container {
  width: 1200px;
  margin: 0 auto;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>
<style>
.box {
            min-height: 100%;
            position: relative;
        }

.el-menu.el-menu--horizontal {
    border-bottom: solid 0px #e6e6e6!important;
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
</style>
<style scoped>
.title {
  position: relative;
  left: 50px;
  bottom: 100px;
  font-size: 25px;
}

.el-row {
  margin-bottom: 20px;
  /*&:last-child {*/
  /*    margin-bottom: 0;*/
  /*}*/
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

.footer {
  padding: 15px 0;
  text-align: center;
  line-height: 30px;
  background: #606266;
  color: #fff;
}

.container-fluid {
  background-color: rgb(84, 92, 100);
}
.padding15 {
  padding: 15px;
}
 .footer {
            background: #333;
           position: absolute;
            bottom: 0;
            width: 100%;
        }
</style>
