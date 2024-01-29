import { createRouter, createWebHistory } from 'vue-router';
import store from '@/store'; // Adjust the path based on your actual file structure


// Import your components
import EmployeeList from '@/views/employees/EmployeeList.vue';
import EmployeeNew from '@/views/employees/EmployeeNew.vue';
import EmployeeDetail from '@/views/employees/EmployeeDetail.vue';
import EmployeeEdit from '@/views/employees/EmployeeEdit.vue';

import LeaveRequestList from '@/views/leave_requests/LeaveRequestList.vue';
import LeaveRequestNew from '@/views/leave_requests/LeaveRequestNew.vue';
import LeaveRequestDetail from '@/views/leave_requests/LeaveRequestDetail.vue';
import LeaveRequestEdit from '@/views/leave_requests/LeaveRequestEdit.vue';

import PerformanceEvaluationList from '@/views/performance_evaluations/PerformanceEvaluationList.vue';
import PerformanceEvaluationNew from '@/views/performance_evaluations/PerformanceEvaluationNew.vue';
import PerformanceEvaluationDetail from '@/views/performance_evaluations/PerformanceEvaluationDetail.vue';
import PerformanceEvaluationEdit from '@/views/performance_evaluations/PerformanceEvaluationEdit.vue';

import AnnouncementList from '@/views/announcements/AnnouncementList.vue';
import AnnouncementNew from '@/views/announcements/AnnouncementNew.vue';
import AnnouncementDetail from '@/views/announcements/AnnouncementDetail.vue';
import AnnouncementEdit from '@/views/announcements/AnnouncementEdit.vue';

import LoginPage from '@/components/LoginPage.vue';
import RegisterUser from '@/components/RegisterUser.vue';

const routes = [
  // Employees
  { path: '/employees', name: 'EmployeeList', component: EmployeeList},
  { path: '/employees/new', name: 'EmployeeNew', component: EmployeeNew, meta: { requiresAuth: true } },
  { path: '/employees/:id', name: 'EmployeeDetail', component: EmployeeDetail, props: true },
  { path: '/employees/:id/edit', name: 'EmployeeEdit', component: EmployeeEdit, props: true, meta: { requiresAuth: true } },

  // Leave Requests
  { path: '/leave_requests', name: 'LeaveRequestList', component: LeaveRequestList },
  { path: '/leave_requests/new', name: 'LeaveRequestNew', component: LeaveRequestNew, meta: { requiresAuth: true } },
  { path: '/leave_requests/:id', name: 'LeaveRequestDetail', component: LeaveRequestDetail, props: true },
  { path: '/leave_requests/:id/edit', name: 'LeaveRequestEdit', component: LeaveRequestEdit, props: true, meta: { requiresAuth: true }},

  // Performance Evaluations
  { path: '/performance_evaluations', name: 'PerformanceEvaluationList', component: PerformanceEvaluationList },
  { path: '/performance_evaluations/new', name: 'PerformanceEvaluationNew', component: PerformanceEvaluationNew, meta: { requiresAuth: true }},
  { path: '/performance_evaluations/:id', name: 'PerformanceEvaluationDetail', component: PerformanceEvaluationDetail, props: true },
  { path: '/performance_evaluations/:id/edit', name: 'PerformanceEvaluationEdit', component: PerformanceEvaluationEdit, props: true, meta: { requiresAuth: true } },

  // Announcements
  { path: '/announcements', name: 'AnnouncementList', component: AnnouncementList },
  { path: '/announcements/new', name: 'AnnouncementNew', component: AnnouncementNew, meta: { requiresAuth: true }},
  { path: '/announcements/:id', name: 'AnnouncementDetail', component: AnnouncementDetail, props: true },
  { path: '/announcements/:id/edit', name: 'AnnouncementEdit', component: AnnouncementEdit, props: true, meta: { requiresAuth: true } },

  // Login & Register
  { path: '/login', name: 'Login', component: LoginPage },
  { path: '/register', name: 'Register', component: RegisterUser },

  // Default route
  { path: '/:catchAll(.*)', redirect: '/employees' },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
  });
  
  // Global navigation guard
  router.beforeEach((to, from, next) => {
    if (to.meta.requiresAuth && !store.getters.isLoggedIn) {
      // Redirect to the login page if not authenticated
      next({ name: 'Login' });
    } else {
      next(); // Continue with the navigation
    }
  });
  
  export default router;