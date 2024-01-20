import * as VueRouter from 'vue-router';
import Dashboard from '../views/dashboard/index.vue';
import Login from '../views/login/index.vue';

export const router = VueRouter.createRouter({
    // 4. 内部提供了 history 模式的实现。为了简单起见，我们在这里使用 hash 模式。
    history: VueRouter.createWebHashHistory(),
    routes: [
        {path: '/', component: Dashboard},
        {path: '/login', component: Login},
    ]
});