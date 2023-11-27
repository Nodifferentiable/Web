<template>
  <div>
    <!--  抽屉组件  -->
    <el-drawer
        :title="formData.id==null?'新增':'编辑'"
        :visible.sync="isDrawerDialog"
        :size="size"
        direction="rtl"
        :wrapper-closable="false"
        :before-close="handleClose"
    >

      <div class="demo-drawer_content">
        <el-form :model="formData" :rules="rulesForm" ref="formData" label-width="100px" class="demo-ruleForm">
          <slot name="content">
            这里是中间
          </slot>
        </el-form>
      </div>

      <div class="demo-drawer_footer footer">
        <el-button @click="cancelForm('formData')">取消</el-button>
        <el-button type="primary" @click="submitForm('formData')">提交</el-button>
      </div>

    </el-drawer>
    <!--  抽屉组件  -->

  </div>
</template>

<script>
export default {
  name: "CustomDrawer",
  props: {
    formData: {
      type: Object,
      default: function () {
        return {}
      }
    },
    isDrawerDialog: {
      type: Boolean,
      default: false
    },
    rulesForm: {
      type: Object,
      default: function () {
        return {}
      }
    },
    size: {
      type: [Number, String],
      default: '30%'
    }
  },
  methods: {
    //提交数据
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$emit("submit-drawer", this.formData)
        } else {
          this.$message.error("请填写符合条件的数据")
          return false;
        }
      });
    },
    //取消
    cancelForm(formName) {
      this.$refs[formName].resetFields();
      this.$emit("close-drawer", false)
    },
    handleClose() {
      //自定义事件
      this.$emit("close-drawer", false)
    },

  }
}
</script>

<style scoped>
.footer {
  display: flex;
  justify-content: space-around;
}
</style>
