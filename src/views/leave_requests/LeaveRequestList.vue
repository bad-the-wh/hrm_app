<template>
    <div>
        <h1>Leave Requests</h1>

        <ul>
            <li v-for="leaveRequest in leaveRequests" :key="leaveRequest.id">
                <router-link :to="{ name: 'LeaveRequestDetail', params: { id: leaveRequest.id } }">
                    {{ leaveRequest.employee.name }}
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
            axios.get('http:://localhost:3000/api/leave_requests')
                .then(response => {
                    this.leaveRequests = response.data;
                    console.log('Leave Requests:', this.leaveRequests);
                })
                .catch(error => {
                    console.error('Error fetching leave requests', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  