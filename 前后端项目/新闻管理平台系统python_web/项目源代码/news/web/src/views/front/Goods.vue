<template>
  <div class="container">

    <div class="container">

      <div style="width:35%;margin:20px auto 0px auto;display:flex">
        <el-input placeholder="请输入新闻标题"
                  @input="handleSearch"
                  v-model.trim="searchForm.title">
        </el-input>
        <el-button style="margin-left:20px"
                   type="success"
                   @click="handleSearch()">搜索
        </el-button>
      </div>

    </div>
    <CustomCard :data-list="tableData"></CustomCard>

    <!--自定义分页组件-->
    <div class="pages">
          <custom-pages
        @current-change="currentChange"
        @size-change="sizeChange"
        :total="pageInfo.total"
        :page-size="pageInfo.pageSize"
        :current-page="pageInfo.pageNum"
    >
    </custom-pages>
    </div>
    <!--自定义分页组件-->
  </div>

</template>
<script>
import create from "@/mixins/create";

export default {
  data() {
    return {
      api: {
        pageUrl: "/goods/uPage"
      },
      title: "",
    };
  },
  mixins: [create],
  methods: {

    toDetail(e) {
      //跳转到详情页并且携带id参数
      this.$router.push({
        path: "detail", query: {
          id: e
        }
      })
    }
  },
  filters: {
    delHtmlTag(str) {
      //去掉所有的html标记
      return str.replace(/<[^>]+>/g, "").slice(0, 200)
    }
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
.pages {
  margin-top: 20px;
  display: flex;
  justify-content: center;
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
</style>
