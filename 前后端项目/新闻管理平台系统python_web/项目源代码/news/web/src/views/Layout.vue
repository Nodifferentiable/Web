<template>
  <el-container style="height: 100%; border: 1px solid #eee">
    <el-aside width="200px" style="background-color: #000000;overflow-x:hidden">
      <h3 class="title">新闻管理系统</h3>
      <el-menu :default-openeds="['0','1','2','3','4','5','6']"
               background-color="#000000"
               text-color="#fff"
               style="border-right: none;"

      >
        <el-submenu index="0">
          <template slot="title"><i class="el-icon-message">首页</i></template>
          <el-menu-item index="9-1">
            <router-link tag="div" to="/" replace>首页</router-link>
          </el-menu-item>
        </el-submenu>
        <el-submenu :index="i+1+''" v-for="(item,i) in menuList" :key="i+1+''" @click="active"
                    :default-active="isActive('i'+i)">
          <template slot="title"><i class="el-icon-message">&nbsp;{{ item.title }}</i></template>
          <el-menu-item :index="i+1+'-'+index+1" v-for="(val,index) in item.children" :key="i+1+'-'+index+1"
                        :data-path="val.path">
            <router-link tag="div" :to="val.path" replace>{{ val.title }}</router-link>
          </el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header style="text-align: right; font-size: 12px">
        <span class="mr10px"><a target="_blank" href="/#/front">跳转到新闻首页</a></span>
        <el-dropdown>
  <span class="el-dropdown-link">
    {{ userInfo.username }}<i class="el-icon-arrow-down el-icon--right"></i>
  </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item><span @click="editUserInfo">个人信息</span></el-dropdown-item>
            <el-dropdown-item divided><span @click="logout">退出登录</span></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-header>

      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {

    return {
      text: "",
      tableData: [],
      multipleSelection: [],
      menuList: [],
      userInfo: {}
    }
  },
  created() {
    this.getMenuList()
  },
  computed: {
    isActive() {
      return function (routePath) {
        return this.$route.path === routePath;
      };
    },
  },
  methods: {
    active() {
      alert(123)
    },
    // toRoute(e){
    //   this.$router.push({path:e})
    // },
    //获取当前用户可以访问的菜单
    getMenuList() {
      if (localStorage.getItem("userInfo") !== null) {
        let user = JSON.parse(localStorage.getItem("userInfo"))
        this.userInfo = user
        this.menuList = user.menuList

        this.menuList.forEach((item, i) => {
          this.menuList[i].isShow = true
        })

      }
    },


    logout() {
      this.$message({
        message: "退出登录成功，正在跳转",
        type: "success"
      })
      localStorage.clear()
      setTimeout(() => {
        this.$router.push({path: "/login"})
      }, 3000)
    },
    editUserInfo() {
      this.$router.push({path: "/editUserInfo"})
    },
    recharge() {
      this.$router.push({path: "/recharge"})
    },
  }
};
</script>

<style>
.mr10px {
  margin-right: 10px;
}

.el-header {
  background-color: #B3C0D1;
  /*color: #333;*/
  line-height: 60px;
}

.el-aside {
  /*color: #333;*/
}

/*更改下拉框的样式*/
.el-dropdown-link {
  cursor: pointer;
  color: #409EFF;
}

.el-icon-arrow-down {
  font-size: 12px;
}

.title {
  text-align: center;
  color: #fff;
  height: 30px;
  line-height: 30px;
  margin-top: 11px;
}

.input {
  width: 200px !important;
  margin-right: 10px
}

.mr10px {
  margin-right: 10px;
}

.pb10px {
  padding-bottom: 10px;
}
</style>

