<template>
  <div class="login-container">
    <el-form :model="formData" :rules="rulesList"
             status-icon
             ref="formData"
             label-position="left"
             label-width="0px"
             class="demo-ruleForm login-page">
      <h3 class="title">用户信息修改</h3>

      <el-form-item prop="username">
        <el-input type="text"
                  v-model="formData.username"
                  auto-complete="off"
                  placeholder="用户名"
                  :disabled="true"
        ></el-input>
      </el-form-item>

      <el-form-item prop="email">
        <el-input type="text"
                  v-model="formData.email"
                  auto-complete="off"
                  placeholder="邮箱"
        ></el-input>
      </el-form-item>

      <el-form-item prop="mobile">
        <el-input type="text"
                  v-model="formData.mobile"
                  auto-complete="off"
                  placeholder="手机号"
        ></el-input>
      </el-form-item>

      <el-form-item prop="age_group">
        <el-input v-model="formData.age_group" placeholder="年龄段，例如90后，95后，00后"></el-input>
      </el-form-item>

      <el-form-item prop="gender">
        <el-select v-model="formData.gender" placeholder="请选择性别">
          <el-option
              label="男"
              value="1">
          </el-option>
          <el-option
              label="女"
              value="0">
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item prop="motto">
        <el-input
            type="textarea"
            :rows="3"
            v-model="formData.motto"
            auto-complete="off"
            placeholder="座右铭"
        ></el-input>
      </el-form-item>

      <el-form-item style="width:100%;">
        <el-button type="primary" style="width:100%;" @click="handleSubmit">修改</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import utils from "@/utils/utils";
// import utils from "../../utils/utils";
export default {
  data() {
    return {
      formData: {
        id: "",
        username: '',
        email: '',
        mobile: '',
        address: '',
        motto: '',
        age_group: "",
        gender: ""
      },
      rulesList: {
        username: [{required: true, message: '用户名不能为空', trigger: 'blur'}],
        email: [{required: true, message: '邮箱不能为空', trigger: 'blur'}],
        mobile: [{required: true, message: '手机号不能为空', trigger: 'blur'}],
        address: [{required: true, message: '地址不能为空', trigger: 'blur'}],

      },
      checked: false
    }
  },
  created() {
    console.log(utils.getUserInfo())
    this.formData = JSON.parse(utils.getUserInfo())
  },
  methods: {
    handleSubmit() {
      this.$axios.post('/sysUser/save', this.formData).then(res => {
        console.log(res)
        localStorage.setItem("userInfo", JSON.stringify(this.formData))
        this.$message({
          message: '修改成功',
          type: 'success'
        });
      })
    }
  }
};
</script>

<style scoped>

.login-container {

}

.login-page {
  -webkit-border-radius: 5px;
  border-radius: 5px;
  margin: 180px auto;
  width: 350px;
  padding: 35px 35px 15px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}

label.el-checkbox.rememberme {
  margin: 0px 0px 15px;
  text-align: left;
}

.title {
  text-align: center;
  margin-bottom: 35px;
}
</style>
