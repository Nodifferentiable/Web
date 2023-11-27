<template>
  <div>
    <div class="pb10px">

      <el-input v-model="searchForm.username" @input="handleSearch" class="input" clearable placeholder="请输入用户名称"
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
          prop="username"
          label="用户名称"
          width="150"
      >
      </el-table-column>
      <el-table-column
          prop="motto"
          label="座右铭"
          width="150"
          :show-overflow-tooltip="true"
      >
      </el-table-column>
      <el-table-column
          prop="email"
          label="邮箱"
          width="150"
          
      >
      </el-table-column>
      <el-table-column
          prop="mobile"
          label="电话"
          width="150"
          
      >
      </el-table-column>
      <el-table-column
          prop="address"
          label="地址"
          width="150"
          :show-overflow-tooltip="true"
      >
      </el-table-column>

      <el-table-column
          prop="role_type"
          label="角色类型"
          width="150"
      >
      </el-table-column>
           <el-table-column
          prop="gender"
          label="性别"
      >
             <template  slot-scope="scope">
               <div>{{scope.row.gender===1?"男":scope.row.gender===0?"女":""}}</div>
             </template>
      </el-table-column>
           <el-table-column
          prop="age_group"
          label="年龄段"
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
      <el-table-column label="操作"
                       width="150"
                       fixed="right"
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
        <el-form-item label="用户名称" prop="username">
          <el-input v-model="formData.username" placeholder="用户名称"></el-input>
        </el-form-item>
        <el-form-item label="座右铭" prop="motto">
          <el-input v-model="formData.motto" placeholder="座右铭"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="formData.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item label="电话" prop="mobile">
          <el-input v-model="formData.mobile" placeholder="电话"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="formData.address" placeholder="地址"></el-input>
        </el-form-item>
        <el-form-item label="年龄段" prop="age_group">
          <el-input v-model="formData.age_group" placeholder="年龄段，例如90后，95后，00后"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-select v-model="formData.gender" placeholder="请选择性别">
            <el-option v-for="item in genderList" :key="item.value"
                       :label="item.label"
                       :value="item.value">
            </el-option>
            <el-option
                label="女"
                value="0">
            </el-option>
          </el-select>
        </el-form-item>


        <el-form-item label="角色类型" prop="role_type">
          <el-select v-model="formData.role_type" placeholder="请选择">
            <el-option
                v-for="item in roleList"
                :key="item.role"
                :label="item.title"
                :value="item.role">
            </el-option>
          </el-select>
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
        pageUrl: "/sysUser/findPage",
        saveUrl: "/sysUser/save",
        delUrl: "/sysUser/delBatch"
      },
      ruleForm: {
        username: [
          {required: true, message: '请输入', trigger: 'blur'},
        ],
        password: [
          {required: true, message: '请输入', trigger: 'blur'},
          {min: 8, max: 100, message: '长度在 8 到 100 个字符', trigger: 'blur'}

        ],
        age_group: [
          {required: true, message: '请输入年龄段', trigger: 'blur'},
        ],
        gender: [
          {required: true, message: '请输入性别', trigger: 'blur'},
        ],
      },

      formData: {
        id: null,
        //新增的用户名称
        username: "",
      },
      searchForm: {
        username: ""
      },
      roleList: [{
        role: 'ROLE_ADMIN',
        title: '超级管理员'
      },
        {
          role: 'ROLE_USER',
          title: '普通用户'
        }
      ],
      genderList: [
        {
          value: 0,
          label: "女"
        },
        {
          value: 1,
          label: "男"
        }
      ]
    }
  },
  mixins: [create],
  created() {
    this.getRoleList()
  },
  methods: {

    getRoleList() {
      this.$axios.get("/sysRole/list").then(res => {
        this.roleList = res.data
      })
    }

  }
};
</script>

<style scoped>

</style>
