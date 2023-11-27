<template>
  <div>
    <div class="pb10px">

      <el-input v-model="searchForm.title" @input="handleSearch" class="input" clearable placeholder="请输入标题"
                size="small"></el-input>

      <el-button type="primary" icon="el-icon-search" size="small" class="mr10px" @click="handleSearch">搜索</el-button>
    </div>

    <div>
      <el-button type="primary" @click="handleAdd" size="small">新增</el-button>
      <el-button type="danger" size="small" @click="batchDelete" :disabled="ids.length>0?false:true">批量删除
      </el-button>
    </div>

    <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          prop="id"
          label="ID"
          width="50">
      </el-table-column>

      <el-table-column
          prop="title"
          label="标题"
          :show-overflow-tooltip="true"
      >
      </el-table-column>

<!--      <el-table-column-->
<!--          prop="picture"-->
<!--          label="封面图"-->
<!--          width="130"-->
<!--      >-->
<!--        <template slot-scope="scope">-->
<!--          <img :src="scope.row.picture" alt="" width="100" height="100">-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column
          prop="category_title"
          label="所属分类"
      >
      </el-table-column>
      <!--      <el-table-column-->
      <!--          prop="createUsername"-->
      <!--          label="发布用户"-->
      <!--          >-->
      <!--      </el-table-column>-->

      <!--      <el-table-column-->
      <!--          prop="updateUsername"-->
      <!--          label="更新用户"-->
      <!--      >-->

      <!--      </el-table-column>-->
      <el-table-column
          prop="content"
          label="内容"
          :show-overflow-tooltip="true"
      >
      </el-table-column>

      <el-table-column
          prop="create_time"
          label="创建时间"
      >
      </el-table-column>
      <el-table-column
          prop="update_time"
          label="更新时间"
      >
      </el-table-column>

      <el-table-column
          prop="views"
          label="浏览量"
      >
      </el-table-column>

      <!--      fixed="right"-->
      <el-table-column label="操作"
                       width="150"
      >
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="handleEdit(scope.$index, scope.row)">编辑
          </el-button>
          <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">删除
          </el-button>
        </template>
      </el-table-column>

    </el-table>
    <!--自定义分页组件-->

    <custom-pages
        @current-change="currentChange"
        @size-change="sizeChange"
        :total="pageInfo.total"
        :page-size="pageInfo.pageSize"
        :current-page="pageInfo.pageNum"
    >
    </custom-pages>
    <!--自定义分页组件-->

    <!--自定义抽屉组件-->
    <custom-drawer
        :form-data="formData"
        :rules-form="ruleForm"
        @close-drawer="closeDrawer"
        @submit-drawer="submitDrawer"
        :is-drawer-dialog="isDrawerDialog"
        :size="size"
    >
      <div slot="content">
        <el-form-item label="标题" prop="title">
          <el-input v-model="formData.title"></el-input>
        </el-form-item>

        <el-form-item label="所属分类" prop="category_id">
          <el-select v-model="formData.category_id" clearable placeholder="请选择">
            <el-option
                v-for="item in categoryList"
                :key="item.id"
                :label="item.title"
                :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <CustomEditor :content="formData.content" @content-change="contentChange"></CustomEditor>
        </el-form-item>
      </div>
    </custom-drawer>

  </div>
</template>

<script>
import create from "@/mixins/create";
import utils from "@/utils/utils";

export default {
  data() {
    //页面格式化 ctrl+alt+l
    return {
      api: {
        pageUrl: "/goods/findPage",
        saveUrl: "/goods/save",
        delUrl: "/goods/delBatch"
      },

      ruleForm: {
        title: [
          {required: true, message: '不能为空', trigger: 'blur'},
        ],
        // picture: [
        //   {required: true, message: '不能为空', trigger: 'blur'},
        // ],
        views: [
          {required: true, message: '不能为空', trigger: 'blur'},
        ],
        category_id: [
          {required: true, message: '不能为空', trigger: 'blur'},
        ],
        status: [
          {required: true, message: '不能为空', trigger: 'blur'},
        ],
      },
      formData: {
        id: null,
        title: "", //新增的内容
        // status: "启用"
      },
      searchForm: {
        title: ""
      },
      categoryList: [],
      imageUrl: '',
      server: process.env.VUE_APP_SERVER + "/uploads",//上传接口地址
      headers: {
        "token": localStorage.getItem("token")
      },
      size: '100%',
      userInfo: {}
    }
  },
  created() {
    this.getCategoryList()
    this.userInfo = JSON.parse(utils.getUserInfo())
  },
  mixins: [create],
  methods: {
    getCategoryList() {
      this.$axios.get("/category/list").then(res => {
        this.categoryList = res.data
      })
    },
    handleAvatarSuccess(res, file) {
      this.formData.picture = res.data.url
      console.log(res.data.url)
      console.log(file)
      console.log(this.formData)
      this.imageUrl = URL.createObjectURL(file.raw)
    },
    beforeAvatarUpload(file) {
      const typeArr = ["image/png", "image/jpeg", "image/jpg"]
      if (!typeArr.includes(file.type)) {
        this.$message.error("上传头像图片只支持jpg，png，jpeg格式")
        return false
      }

      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
      }
      return isLt2M
    },
    contentChange(e) {
      console.log(e)
      this.formData.content = e
    },
    closeDrawer(e) {
      this.isDrawerDialog = e
      this.$router.go(0)
    },
    submitDrawer(e) {
      console.log("获取提交的数据", e)
      this.formData = Object.assign({}, e)
      this.categoryList.forEach((item) => {
        if (item.id === this.formData.category_id) {
          this.formData.category_title = item.title
        }
      })

      this.$axios.post("/goods/save", this.formData).then(res => {
        console.log(res)
        if (res.code === 200) {
          this.$router.go(0)
          // this.isDrawerDialog = false
          // this.$message({
          //   message: res.msg,
          //   type: 'success'
          // });
          // this.getList()
        }
      })

    },
    //添加数据
    handleAdd() {
      this.isDrawerDialog = true
      // this.formData = {
      //   status: "启用"
      // }
    },
    //编辑
    handleEdit(index, row) {
      this.isDrawerDialog = true
      console.log(index, row);
      //https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign
      this.formData = Object.assign({}, row)
      this.imageUrl = this.formData.picture
    },

  }
};
</script>

<style scoped>
.avatar {
  width: 150px;
  height: 150px;
}
</style>
