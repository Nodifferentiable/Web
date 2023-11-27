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
    >
      <div slot="content">
        <el-form-item label="内容" prop="title">
          <el-input v-model="formData.title" placeholder="请输入标题"></el-input>
        </el-form-item>
      </div>
    </custom-drawer>
    <!--自定义抽屉组件-->
  </div>
</template>

<script>

//引入混入
import create from "@/mixins/create"

export default {
  data() {
    //页面格式化 ctrl+alt+l
    return {
      api: {
        pageUrl: "/category/findPage",
        saveUrl: "/category/save",
        delUrl: "/category/delBatch"
      },
      ruleForm: {
        title: [
          {required: true, message: '请输入内容', trigger: 'blur'},
        ],
      },

      formData: {
        id: null,
        title: "", //新增的内容
      },
      searchForm: {
        title: ""
      }
    }
  },
  mixins: [create],
  created() {
  },
  methods: {}
};
</script>

<style scoped>

</style>
