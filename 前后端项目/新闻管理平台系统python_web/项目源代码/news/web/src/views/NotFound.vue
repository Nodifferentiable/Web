<template>
  <div class="not-found-container">
    <el-row type="flex" class="not-found-row" justify="center" align="middle">
      <el-col :span="12">
        <h1 class="title">404</h1>
        <p class="description">抱歉，找不到该页面！</p>
        <router-link to="/" class="back-link">返回首页</router-link>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'NotFound'
};
</script>

<style scoped>
.not-found-container {
  height: 100vh;
}

.not-found-row {
  height: 100%;
}

.title {
  font-size: 5em;
  margin-bottom: 0.3em;
}

.description {
  font-size: 1.5em;
  color: #888;
  margin-bottom: 2em;
}

.back-link {
  font-size: 1.2em;
  text-decoration: underline;
  color: blue;
}
</style>
