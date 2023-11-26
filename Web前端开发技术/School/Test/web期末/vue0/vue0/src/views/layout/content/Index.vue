<template>
	<div>
        <Header></Header>	
        <router-view> </router-view>
	</div>
	
</template>

<script>
import Header from './Header.vue'

export default{
	components:
	{
		Header
	}
}
  methods:
  {
	
  }
</script>

<style>

</style>