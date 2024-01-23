import { createRouter, createWebHistory } from 'vue-router';

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

const routes = [
  // Employees
  { path: '/employees', name: 'EmployeeList', component: EmployeeList },
  { path: '/employees/new', name: 'EmployeeNew', component: EmployeeNew },
  { path: '/employees/:id', name: 'EmployeeDetail', component: EmployeeDetail, props: true },
  { path: '/employees/:id/edit', name: 'EmployeeEdit', component: EmployeeEdit, props: true },

  // Leave Requests
  { path: '/leave_requests', name: 'LeaveRequestList', component: LeaveRequestList },
  { path: '/leave_requests/new', name: 'LeaveRequestNew', component: LeaveRequestNew },
  { path: '/leave_requests/:id', name: 'LeaveRequestDetail', component: LeaveRequestDetail, props: true },
  { path: '/leave_requests/:id/edit', name: 'LeaveRequestEdit', component: LeaveRequestEdit, props: true },

  // Performance Evaluations
  { path: '/performance_evaluations', name: 'PerformanceEvaluationList', component: PerformanceEvaluationList },
  { path: '/performance_evaluations/new', name: 'PerformanceEvaluationNew', component: PerformanceEvaluationNew },
  { path: '/performance_evaluations/:id', name: 'PerformanceEvaluationDetail', component: PerformanceEvaluationDetail, props: true },
  { path: '/performance_evaluations/:id/edit', name: 'PerformanceEvaluationEdit', component: PerformanceEvaluationEdit, props: true },

  // Announcements
  { path: '/announcements', name: 'AnnouncementList', component: AnnouncementList },
  { path: '/announcements/new', name: 'AnnouncementNew', component: AnnouncementNew },
  { path: '/announcements/:id', name: 'AnnouncementDetail', component: AnnouncementDetail, props: true },
  { path: '/announcements/:id/edit', name: 'AnnouncementEdit', component: AnnouncementEdit, props: true },

  // Add other routes as needed

  // Default route
  { path: '/:catchAll(.*)', redirect: '/leave_requests' },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
