<template>
  <div class="container">

    <div style="margin:20px 0">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{ detailShop.category_title }}
        </el-breadcrumb-item>
        <el-breadcrumb-item><a href="javascript:;">{{ detailShop.title }}</a></el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <el-row>
      <el-col :span="24"
              style="padding-left:10px;box-sizing:border-box">
        <div class="grid-content-light shop-info">
          <h1 class="title">{{ detailShop.title }}</h1>
          <div class="desc p">
            <span>发布时间：{{ detailShop.create_time }}</span>
            <span>浏览量：{{ detailShop.views }}人查看</span>
          </div>

          <div v-html="detailShop.content">


          </div>

        </div>
      </el-col>
    </el-row>
      <el-divider></el-divider>
      <el-tabs type="border-card" v-model="test">
        <el-tab-pane label="相关评论">

          <el-divider></el-divider>
          <div class="comment">
            <el-input type="textarea"
                      v-model="comment.content"
                      :rows="3"
                      placeholder="请输入内容"
                      maxlength="10000"
                      show-word-limit>
            </el-input>
            <el-button style="margin-top: 20px;text-align: right"
                       type="primary"
                       @click="commentSave"
            >立即评论
            </el-button>

            <div class="comment-list">
              <el-alert v-for="(item,index) in commentList"
                        :key="index"
                        style="margin-top: 15px"
                        :title="item.desc"
                        type="success"
                        :closable="false">
              </el-alert>
            </div>
          </div>
        </el-tab-pane>

      </el-tabs>


  </div>

</template>

<script>
export default {
  data() {
    return {
      test: "",
      token: "",
      size: '',
      isDisabled: false,
      num: 1,
      url: window.location.href,
      detailShop: {},
      dialogVisible: false,
      textarea: "",
      commentList: [],
      imagesArray: [],
      goods: {},
      comment: {
        content: "",
        goods_id: ""
      },

    };
  },
  created() {
    this.getCommentList()
    this.getDetail(this.$route.query.id)
  },
  methods: {
    parseImages() {
      const imgRegex = /<img.*?src="(.*?)"/g;
      let match;

      while ((match = imgRegex.exec(this.detailShop.content)) !== null) {
        const src = match[1];
        this.imagesArray.push(src);
      }
    },
    getDetail(e) {
      this.$axios.get("/goods/uDetail?id=" + e).then(res => {
        this.detailShop = res.data
      })
    },
    commentSave() {
      if (this.comment.content === "" || this.comment.content == null) {
        this.$message({
          showClose: true,
          message: "请输入内容后提交",
          type: 'error',
          onClose: () => {
          }
        });
        return false
      }
      this.comment.goods_id = this.$route.query.id
      this.comment.create_user_id = this.$utils.getParseUserInfo().id
      this.comment.username = this.$utils.getParseUserInfo().username
      // this.comment.user_id = this.
      this.$axios.post('/comment/save', this.comment).then(res => {
        this.comment = {}
        this.$message({
          showClose: true,
          message: res.msg,
          type: 'success',
          onClose: () => {
            this.getCommentList()
          }
        });
      })
    },
    getCommentList() {
      console.log(this.$route)

      //路由发送this.$route.params.id
      //地址栏 this.$route.query.id

      this.$axios.get('/comment/list?goods_id=' + this.$route.query.id).then(res => {
        this.commentList = res.data

        this.commentList.forEach((item, i) => {
          let time = item.create_time
          let username = item.username === undefined ? '游客' : item.username
          this.commentList[i].desc = `评论时间：【${time}】-----用户昵称为【${username}】的用户评论：${item.content}`

        })

      })
    }

  },
  mounted() {

    console.log(this.$utils.getParseUserInfo())

  }
};
</script>
<style lang="less">
.p {
  text-indent: 2em;

  img {
    display: block !important;
  }
}
</style>
<style lang="less" scoped>
.desc {
  span {
    margin-right: 20px;
  }
}

.p {
  font-size: 12px;
  color: rgb(102, 102, 102);
  line-height: 22px;
}

.title {
  font: 700 16px Arial, "microsoft yahei";
  color: #666;
  padding-top: 10px;
  line-height: 28px;
  margin-bottom: 5px;
}

.fix {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background: #fff;
  z-index: 999;
}

.shop-info {
  div {
    margin: 10px 0;
  }
}

.tag {
  span {
    margin-right: 10px;
  }
}

.cart {
  height: 100px;
  position: fixed;
  right: 0px;
  bottom: 150px;
  border-radius: 5px;
  // border: 1px solid #ccc;
}

.pay {
  text-align: center;
  // margin: 0 auto;
  .visit-scan {
    overflow: hidden;
  }

  .weipay {
    margin-right: 20px;
  }

  span {
    font-weight: bold;
    margin: 5px auto;
  }

  .weipay {
    // float: left;
  }

  .alipay {
    // float: right;
  }

  .weipay,
  .alipay {
    display: inline-block;

    text-align: center;
    width: 100px;
    height: auto;

    img {
      width: 100px;
      height: 100px;
    }
  }

  .money {
    margin: 10px auto;
  }
}
</style>

<style lang="less">
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

.comment {
}
</style>

