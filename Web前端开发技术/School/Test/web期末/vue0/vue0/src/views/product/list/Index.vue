<template>
	<div>
		<!-- 书籍搜索 -->
		<div class="header">
			<div class="form">
				<el-form :inline="true" :model="formInline" class="demo-form-inline">
					<el-form-item label="书籍名称">
						<el-input v-model="selectName" placeholder="书籍名称"></el-input>
					</el-form-item>

					<el-form-item>
						<el-button type="primary" @click="onSubmit">查询</el-button>
					</el-form-item>
					<br>
					<el-form-item label="添加书籍名称">
						<el-input v-model="dui.name" placeholder="书籍名称："></el-input>
					</el-form-item>
					<el-form-item label="添加书籍类别">
						<el-input v-model="dui.lei" placeholder="书籍类别"></el-input>
					</el-form-item>
					<el-form-item label="添加书籍数量">
						<el-input v-model="dui.num" placeholder="书籍数量"></el-input>
					</el-form-item>
					<el-button type="primary" icon="el-icon-edit" @click="add">添加书籍</el-button>
				</el-form>

			</div>
		</div>
		<!-- 书籍列表 -->
		<div class="content">
			<el-table :data="tableData" stripe style="width: 100%">
				<el-table-column type="selection" width="60">
				</el-table-column>
				<el-table-column prop="name" label="书籍名称" width="150px">
				</el-table-column>
				<el-table-column prop="lei" label="书籍类别" width="num150px">
				</el-table-column>
				<el-table-column prop="num" label="储藏量" width="150px">
				</el-table-column>
				<el-table-column label="操作">
					<template slot-scope="scope">
						<!--<el-button size="mini" type="primary"  icon="el-icon-edit">编辑</el-button>-->
						<el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)"
							icon="el-icon-delete">删除</el-button>
					</template>
				</el-table-column>
			</el-table>

		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			formInline: {
				name: '',
			},
			selectName:'',
			dui: {
				name: '',
				lei: '',
				num:''
			},
			tableData: [{
				name: '小王子',
				lei: '故事',
				num:'30'
			}, {
				name: '汤姆索亚历险记',
				lei: '冒险',
				num:'40'
			}, {
				name: '鲁滨逊漂流记',
				lei: '冒险',
				num:'20'
			}, {
				name: '三体',
				lei: '科幻',
				num:'100'
			}],
			Data:[{
				name: '小王子',
				lei: '故事',
				num:'30'
			}, {
				name: '汤姆索亚历险记',
				lei: '冒险',
				num:'40'
			}, {
				name: '鲁滨逊漂流记',
				lei: '冒险',
				num:'20'
			}, {
				name: '三体',
				lei: '科幻',
				num:'100'
			}],
			selectParam: ''
		}
	},

	methods: {
		add() {
			console.log(this.dui)
			this.Data.push(this.dui)
			this.onSubmit()
			this.dui={}
		},
		onSubmit() {
			console.log(this.selectName);
			if(this.selectName!==''){
				this.tableData = this.Data.filter((item) =>{
				return (item.name === this.selectName);
			});
			}else{
				return this.tableData = this.Data
			}
			console.log(this.tableData)
		},
		handleDelete(index, row) {
			this.tableData.splice(index, 1);
		}
	}
}
</script>

<style lang="less" scoped>
.header {
	background: #fff;
	margin-bottom: 50px;
	padding: 10px;

	.group {
		border: 1px solid #eee;
	}
}

.content {
	background: #fff;
	padding: 10px;
}
</style>