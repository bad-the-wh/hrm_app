<template>
    <div>
        <h1>Leave Requests</h1>

        <ul>
            <li v-for="leaveRequest in leaveRequests" :key="leaveRequest.id">
                <router-link :to="{ name: 'LeaveRequestDetail', params: { id: leaveRequest.id } }">
                    {{ getEmployeeName(leaveRequest.employeeDetails) }}
                </router-link>
            </li>
        </ul>

        <router-link to="/leave_requests/new">New Leave Request</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            leaveRequests: [],
        };
    },
    mounted() {
        this.fetchLeaveRequests();
    },
    methods: {
        fetchLeaveRequests() {
            axios
                .get('http://localhost:3000/api/leave_requests')
                .then((response) => {
                    this.leaveRequests = response.data;
                    // Fetch additional details about the employee for each leave request
                    this.leaveRequests.forEach((leaveRequest) => {
                        if (leaveRequest.employee_id) {
                            this.fetchEmployeeDetails(leaveRequest.employee_id, leaveRequest);
                        }
                    });
                })
                .catch((error) => {
                    console.error('Error fetching leave requests', error);
                });
        },
        fetchEmployeeDetails(employeeId, leaveRequest) {
            axios
                .get(`http://localhost:3000/api/employees/${employeeId}`)
                .then((response) => {
                    // Attach employee details to the leave request
                    leaveRequest.employeeDetails = response.data;
                })
                .catch((error) => {
                    console.error('Error fetching employee details', error);
                });
        },
        getEmployeeName(employeeDetails) {
            return employeeDetails ? employeeDetails.name : 'No employee';
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  