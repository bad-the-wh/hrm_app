<template>
    <div>
        <h1>{{ leaveRequest.employee.name }}</h1>

        <p>Start Date: {{ leaveRequest.start_date }}</p>
        <p>End Date: {{ leaveRequest.end_date }}</p>
        <p>Reason: {{ leaveRequest.reason }}</p>

        <router-link :to="{ name: 'LeaveRequestEdit', params: { id: leaveRequest.id } }">Edit Leave Request</router-link>
        <router-link to="/leave_requests">Back to Leave Requests</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            leaveRequest: {},
        };
    },
    mounted() {
        this.fetchLeaveRequest();
    },
    methods: {
        fetchLeaveRequest() {
            axios.get(`http:://localhost:3000/api/leave_requests/${this.$route.params.id}`)
                .then(response => {
                    this.leaveRequest = response.data;
                    console.log('Leave Request:', this.leaveRequest);
                })
                .catch(error => {
                    console.error('Error fetching leave request', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  