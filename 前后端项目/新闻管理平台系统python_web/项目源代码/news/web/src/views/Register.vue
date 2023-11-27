<template>
  <div class="box">
    <h1>后台管理系统</h1>
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="用户名称" prop="username">
        <el-input v-model="ruleForm.username"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="password" v-model="ruleForm.password"></el-input>
      </el-form-item>
      <el-form-item label="年龄段" prop="age_group">
        <el-input type="number" v-model="ruleForm.age_group" placeholder="年龄段，例如90后，95后，00后"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select v-model="ruleForm.gender" placeholder="请选择性别">
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
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">立即注册</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
        <router-link tag="div" :to="{path:'login'}">
          <el-button style="margin-top: 10px">跳转到登录</el-button>
        </router-link>
      </el-form-item>
    </el-form>
  </div>

</template>
<script>
export default {
  data() {
    return {
      ruleForm: {
        username: "",
        password: "",
        age_group: "",
        gender: ""
      },
      rules: {
        username: [
          {required: true, message: '请输入用户名称', trigger: 'blur'},
          // { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
        ],
        age_group: [
          {required: true, message: '请输入年龄段', trigger: 'blur'},
        ],
        gender: [
          {required: true, message: '请输入性别', trigger: 'blur'},
        ],


      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log(this.ruleForm)

          this.$axios.post("/sysUser/register", this.ruleForm).then(res => {
            console.log(res)
            if (res.code === 200) {
              this.$message({
                message: "注册成功，正在跳转",
                type: "success"
              })

              setTimeout(() => {
                this.$router.push({path: "login"})
              }, 3000)

            }


          })


        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}
</script>

<style scoped>
h1 {
  text-align: center;
  margin: 15px auto;
}

.box {
  width: 450px;
  position: relative;
  left: 50%;
  top: 50%;
  margin: -111.5px 0 0 -225px;
  /*background-color: #ccc;*/
  /*border-radius: 5px;*/
}


</style>
