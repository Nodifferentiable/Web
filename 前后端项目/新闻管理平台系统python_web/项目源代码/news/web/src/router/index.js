import Vue from 'vue'
import VueRouter from 'vue-router'
import Layout from '../views/Layout.vue'
import LayoutFront from "@/views/front/LayoutFront";
import NotFound from "@/views/NotFound";

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Layout,
        children: [
            {
                path: "/",
                name: "",
                component: () => import('../views/admin/Home.vue')
            },
            {
                path: "/categoryManage",
                name: "CategoryManage",
                component: () => import('../views/admin/categoryManage')
            },
            {
                path: "/goodsManage",
                name: "GoodsManage",
                component: () => import('../views/admin/goodsManage')
            },
            {
                path: "/sysUserManage",
                name: "SysUserManage",
                component: () => import('../views/admin/sysUserManage')
            },
            {
                path: '/editUserInfo',
                name: 'EditUserInfo',
                component: () => import('../views/admin/editUserInfo.vue')
            },
            {
                path: '/commentManage',
                name: 'CommentManage',
                component: () => import('../views/admin/commentManage.vue')
            },
        ]
    },
    {
        path: "/login",
        name: "Login",
        component: () => import('../views/Login')
    },
    {
        path: "/register",
        name: "Register",
        component: () => import('../views/Register')
    },
// 404页面路由配置
    {
        path: '*',
        name: 'NotFound',
        component: NotFound,
    },

    {
        path: '/front',
        name: 'Front',
        component: LayoutFront,
        children: [
            {
                path: "/",
                name: "Goods",
                component: () => import('../views/front/Goods')
            },
            {
                path: "/detail",
                name: "Detail",
                component: () => import('../views/front/Detail')
            },
        ]
    }


]

const router = new VueRouter({
    //路由模式
    // mode: 'history',
    routes
})

router.afterEach(() => {
    const currentRoute = router.currentRoute;
    console.log(currentRoute.path)
    const menuNode = document.querySelector(`[data-path="${currentRoute.path}"]`);
    if (menuNode) {
        menuNode.click(); // 模拟点击以展开菜单
    }
});

export default router
