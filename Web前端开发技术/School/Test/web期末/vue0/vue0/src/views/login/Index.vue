<template>
	<div class="body">
		<el-form :rules="rules" ref="loginForm" :model="loginForm" class="loginContainer">
			<h3 class="loginTitle">
			欢迎登录
			</h3>
			<el-form-item prop="username">
				<el-input type="text" v-model="loginForm.username" placeholder="亲，请输入用户名" >
				</el-input>
			</el-form-item>
			<el-form-item prop="password">
				<el-input type="password" v-model="loginForm.password" placeholder="亲，请输入密码" >
				</el-input>
			</el-form-item>
			
			<el-checkbox v-model="checked" class="loginRemember">记住我</el-checkbox>
			<el-button type="primary" style="width:100%" @click="submitLogin" >登录</el-button>
		</el-form>
	</div>
  </template>
  
  <script>
  export default {
  name: "Login",
	data(){
	  return{
		  captchaUrl: "",
		  loginForm:{
			  username:"",
			  password:"",
			  
		  },
		  checked: true,
		  rules:{
			  username:[{required:true,message:"请输入用户名",trigger:"blur"},{ min: 5, max: 14, message: '长度在 5 到 14 个字符', trigger: 'blur' }
			  ],
			  password:[{required:true,message:"请输入密码",trigger:"blur"},,{ min: 6,  message: '密码长度要大于6', trigger: 'blur' }],
			  
		  }
  
	  }
  },
	methods:{
	  submitLogin(){
		  this.$refs.loginForm.validate((valid) => {
			  if (valid) {
				  alert('登录成功');
				  this.$router.push('/');
			  } else {
				  this.$message.error('登录出错请重新输入');
				  return false;
			  }
		  });
	  }
	}
  };
  </script>
  
  <style lang="less" scoped>
	.loginContainer{
		border-radius: 15px;
		background-clip: padding-box;
		text-align: left;
		margin: auto;
		margin-top: 180px;
		width: 350px;
		padding: 15px 35px 15px 35px;
		background: rgb(194, 212, 227);
	}
	.loginTitle{
		margin: 0px auto 48px auto;
		text-align: center;
		font-size: 40px;
	}
	.loginRemember{
		text-align: left;
		margin: 0px 0px 15px 0px;
	}
	.body{
		width: 100vw;
		height: 100vh;
		
		background-size:100%;
	    overflow: hidden;
	}
  </style>
  
  
  