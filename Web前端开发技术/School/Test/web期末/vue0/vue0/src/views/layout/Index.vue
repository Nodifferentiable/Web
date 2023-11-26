<template>
	<div class = "layout">
		<!--菜单-->
	    <div class = "menu">
			<Menu></Menu>
		</div>
		<!--内容-->
		<div class = "content">
			<Content></Content>
		</div>
	</div>
</template>

<script>
import Menu from './menu/Index.vue'
import Content from './content/Index.vue'

export default{
	components:
	{
		Menu,
		Content
	}
}
</script>

<style lang = "less" scoped>
    .layout{
		.menu{
			width:200px;
			background:#888 ;
			position: fixed;
			left:0px;
			top:0px;
			bottom:0px;
		}
		.content{
			padding-left: 200px;
		}
	}
</style>