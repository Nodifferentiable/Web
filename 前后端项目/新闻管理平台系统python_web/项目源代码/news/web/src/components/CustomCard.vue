<template>
  <div>

    <el-empty description="列表为空"
              v-if="!dataList.length"></el-empty>

    <el-row :gutter="20">
      <el-col :span="colNum"
              v-for="item in dataList"
              :key="item.id">
        <router-link tag="div"
                     class="grid-content"
                     style="margin-top:20px;cursor:pointer"
                     :to="{ path: '/detail?id=' +item.id}">

          <el-card :body-style="{ padding: '0px'  }">
            <!-- <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                 class="image"
                 style="width:100%;display:block"> -->
            <!-- @/assets/show.png -->
<!--            <img :src="item.picture"-->
<!--                 class="image"-->
<!--                 style="width:100%;display:block;height:150px;">-->
            <div style="padding: 14px;">
              <!-- '编号：' + item.id + ' - '+  -->
              <span :title="item.title"
                    v-html="item.title"
                    class="truncate-text "></span>
              <div class="bottom clearfix">
                <time class="time mb20px">{{ item.categroy_title }}</time>
                <!-- <router-link tag="span"
                             :to="'/detail/'+item.id">
                </router-link> -->


                <!--                <div class="control">-->

                <!--                    <router-link  :to="{ path: '/detail/?id=' +item.id}">-->
                <!--                        <el-button type="success" >-->
                <!--                            新闻查看-->
                <!--                        </el-button>-->
                <!--                    </router-link>-->

                <!--                    <el-button type="primary"> 购买 </el-button>-->
                <!--                </div>-->

              </div>
            </div>
          </el-card>
        </router-link>

      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  data() {
    return {
      currentDate: "SpringBoot管理系统"
    }
  },
  props: {
    colNum: {
      type: Number,
      // 对象或数组默认值必须从一个工厂函数获取
      default: 6
    },
    dataList: {
      type: Array,
      // 对象或数组默认值必须从一个工厂函数获取
      default: function () {
        return []
      }
    },

  },
  methods: {}
}
</script>
<style scoped>
.control {
  display: flex;
  justify-content: space-around;
}

.mb20px {
  display: block;
  margin-bottom: 20px;
}

.truncate-text {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  width: 100%;
  display: block;
}
</style>
