<template>
	<!--内容-->
	<div class="header">
        <div class = "right">
			<el-form :inline="true" :model="formInline" class="demo-form-inline">
			    <el-form-item>
					<el-button type="primary" @click="login">登录</el-button>
                    <el-button type="primary" @click="loginOut">退出</el-button>
                </el-form-item>
		    </el-form>
		</div>
	</div>
</template>

<script>
export default{
	methods:{
		//登录-事件
		login(){
			this.$router.push('/login');
		},
		//退出登录-事件
		loginOut(){
		this.$router.push('/login');
	    }
	}
		
}
</script>

<style>
.header{
	height:50px;
	background:rgb(52, 106, 129);
	line-height: 50px;

	.right{
		float:right;
	    width:200px;
	    font-size: 20px;
    }
}

</style>