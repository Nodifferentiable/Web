/**
 * 定义混入
 * @type {{data(): {message: string}}}
 */
const create = {
    data() {
        return {
            //api路径
            api: {
                pageUrl: "",
                saveUrl: "",
                delUrl: ""
            },
            //抽屉控制
            isDrawerDialog: false,
            //列表数据
            tableData: [],
            //分页详情
            pageInfo: {
                //当前页
                pageNum: 1,
                //分页大小
                pageSize: 10,
                //总条数
                total: 0
            },
            //搜索
            searchForm: {},
            //删除数据的id
            ids: [],
            statusList: [
                {
                    value: "启用"
                },
                {
                    value: "禁用"
                }
            ]
        }
    },
    created() {
        this.getList()
    },
    methods: {
        //获取分页数据
        getList() {
            let data = Object.assign(this.searchForm, this.pageInfo)
            this.$axios.post(this.api.pageUrl, data).then(res => {
                this.tableData = res.data.list
                console.log("-----------------------")
                console.log(res.data)
                this.pageInfo.total = res.data.total
                console.log(res)
            })
        },
        //选择分页
        currentChange(e) {
            this.pageInfo.pageNum = e
            this.getList()
            console.log(e)
        },
        //改变分页数量
        sizeChange(e) {
            this.pageInfo.pageSize = e
            this.getList()
            console.log(e)
        },
        //搜索
        handleSearch() {
            this.pageInfo.pageNum = 1
            this.getList()
        },
        //关闭抽屉
        closeDrawer(e) {
            this.isDrawerDialog = e
        },
        //提交数据
        submitDrawer(e) {
            this.$axios.post(this.api.saveUrl, e).then(res => {
                console.log(res)
                if (res.code === 200) {
                    this.isDrawerDialog = false
                    this.$message({
                        message: res.msg,
                        type: 'success'
                    });
                    this.getList()
                }
            })

        },
        //添加数据
        handleAdd() {
            this.isDrawerDialog = true
            this.formData = {}
        },
        //编辑
        handleEdit(index, row) {
            this.isDrawerDialog = true
            console.log(index, row);
            //https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign
            this.formData = Object.assign({}, row)
        },

        //表格多选操作
        handleSelectionChange(val) {
            console.log(val)
            //赋值以前先清空
            this.ids = []
            val.forEach(item => {
                this.ids.push(item.id)
            })

        },
        //批量删除
        batchDelete() {
            this.$confirm(`此操作将永久删除ID为[${this.ids}]的数据, 是否继续?`, '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
                center: true
            }).then(() => {
                //批量删除数据
                this.$axios.post(this.api.delUrl, this.ids).then(res => {
                    if (res.code === 200) {
                        this.$message({
                            message: res.msg,
                            type: 'success'
                        });
                        this.getList()
                    }
                })
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                });
                this.$refs.multipleTable.clearSelection();
            });
        },

        //单个删除
        handleDelete(index, row) {
            console.log(index, row);
            this.ids = [row.id]
            this.batchDelete()

        },


    }

}

export default create
