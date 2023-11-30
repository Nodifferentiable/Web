<template>
  <div class="app-container">

    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="省" prop="province">
        <el-select v-model="queryParams.province" placeholder="请选择省" clearable>
          <el-option
            v-for="dict in dict.type.air_province"
            :key="dict.value"
            :label="dict.label"
            :value="dict.label"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="市" prop="city">
        <el-select v-model="queryParams.city" placeholder="请选择市" clearable>
          <el-option
            v-for="dict in dict.type.air_province"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['air:air:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['air:air:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['air:air:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['air:air:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="airList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="省" align="center" prop="province">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.air_province" :value="scope.row.province"/>
        </template>
      </el-table-column>
      <el-table-column label="市" align="center" prop="city">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.air_province" :value="scope.row.city"/>
        </template>
      </el-table-column>
      <el-table-column label="监测点" align="center" prop="point" />
      <el-table-column label="AQI指数" align="center" prop="aqi" />
      <el-table-column label="空气质量状况" align="center" prop="quality" />
      <el-table-column label="PM2.5" align="center" prop="pm25" />
      <el-table-column label="PM10" align="center" prop="pm10" />
      <el-table-column label="Co" align="center" prop="co" />
      <el-table-column label="No2" align="center" prop="no2" />
      <el-table-column label="So2" align="center" prop="so2" />
      <el-table-column label="O3" align="center" prop="o3" />
      <el-table-column label="数据更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d} {h}:{m}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据更新时间段" align="center" prop="updateSlot" />
<!--      <el-table-column label="${comment}" align="center" prop="id" />-->
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['air:air:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['air:air:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改空气质量数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="省" prop="province">
          <el-select v-model="form.province" placeholder="请选择省">
            <el-option
              v-for="dict in dict.type.air_province"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="市" prop="city">
          <el-select v-model="form.city" placeholder="请选择市">
            <el-option
              v-for="dict in dict.type.air_province"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="监测点" prop="point">
          <el-input v-model="form.point" placeholder="请输入监测点" />
        </el-form-item>
        <el-form-item label="AQI指数" prop="aqi">
          <el-input v-model="form.aqi" placeholder="请输入AQI指数" />
        </el-form-item>
        <el-form-item label="空气质量状况" prop="quality">
          <el-input v-model="form.quality" placeholder="请输入空气质量状况" />
        </el-form-item>
        <el-form-item label="PM2.5" prop="pm25">
          <el-input v-model="form.pm25" placeholder="请输入PM2.5" />
        </el-form-item>
        <el-form-item label="PM10" prop="pm10">
          <el-input v-model="form.pm10" placeholder="请输入PM10" />
        </el-form-item>
        <el-form-item label="Co" prop="co">
          <el-input v-model="form.co" placeholder="请输入Co" />
        </el-form-item>
        <el-form-item label="No2" prop="no2">
          <el-input v-model="form.no2" placeholder="请输入No2" />
        </el-form-item>
        <el-form-item label="So2" prop="so2">
          <el-input v-model="form.so2" placeholder="请输入So2" />
        </el-form-item>
        <el-form-item label="O3" prop="o3">
          <el-input v-model="form.o3" placeholder="请输入O3" />
        </el-form-item>
        <el-form-item label="数据更新时间段" prop="updateSlot">
          <el-input v-model="form.updateSlot" placeholder="请输入数据更新时间段" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAir, getAir, delAir, addAir, updateAir } from "@/api/air/air";

export default {
  name: "Air",
  dicts: ['air_province'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 空气质量数据表格数据
      airList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        province: null,
        city: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询空气质量数据列表 */
    getList() {
      this.loading = true;
      listAir(this.queryParams).then(response => {
        this.airList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        province: null,
        city: null,
        point: null,
        aqi: null,
        quality: null,
        pm25: null,
        pm10: null,
        co: null,
        no2: null,
        so2: null,
        o3: null,
        updateTime: null,
        updateSlot: null,
        id: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加空气质量数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAir(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改空气质量数据";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAir(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAir(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除空气质量数据编号为"' + ids + '"的数据项？').then(function() {
        return delAir(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('air/air/export', {
        ...this.queryParams
      }, `air_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
