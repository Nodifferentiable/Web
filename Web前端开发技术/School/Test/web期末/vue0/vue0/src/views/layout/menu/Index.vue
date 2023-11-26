<template>
	<div>
		<el-menu
      default-active=""
      class="el-menu-vertical-demo"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b" router>
     
	  <el-menu-item>
        <span slot="title">图书资源管理系统</span>
      </el-menu-item>

	  <el-menu-item index="/">
        <i class="el-icon-menu"></i>
        <span slot="title">首页</span>
      </el-menu-item>

      <el-submenu index="1">
        <template slot="title">
			<i class="el-icon-menu"></i>
            <span slot="title">导航</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/product/list">图书列表</el-menu-item>
          <el-menu-item index="/product/category">图书分类</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
    </el-menu>
	</div>
</template>

<script>
export default{

}
</script>

<style>

</style>