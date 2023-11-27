<template>
  <div>
    <!--  <button @click="handled">You clicked me {{count}} times.</button>-->
    <el-button type="primary" @click="handled">You clicked me {{ count }} times.</el-button>
    <!--  <el-button type="primary">主要按钮</el-button>-->
  </div>
</template>

<script>
export default {
  name: "TestComponent",
  data() {
    return {
      numbers: 0
    }
  },
  props: {
    count: {
      type: Number,
      default: 1000
    }
  },
  methods: {
    handled() {
      this.numbers = this.count
      this.$emit("on-submit", ++this.numbers)

    }
  }
}
</script>

<style scoped>

</style>
