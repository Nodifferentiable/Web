import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '@/views/layout/Index.vue'
import Login from '@/views/login/Index.vue'
import Home from '@/views/home/Index.vue'

const Product = ()=> import('@/views/product/product.vue')
const List = ()=> import('@/views/product/list/Index.vue')
const Category = ()=> import('@/views/product/category/Index.vue')

Vue.use(VueRouter)

const routes = [
	{
		path:'/',
		component:Layout,
		children:[
			{
				path:'/',
				name:'home',
				component:Home
			},
			{
				path:'/product',
				name:'product',
				component:Product,
				children:[
					{
						path:'list',
						name:'list',
						component:List
					},
					{
						path:'category',
						name:'category',
						component:Category
					}
				]
			}
		]
	},
	{
		path:'/login',
		name:'login',
		component:Login
	}
]

const router = new VueRouter({
  routes
})
export default router
