<template>
    <div>
        <h1>Edit Leave Request</h1>

        <leave-request-form />
        <router-link :to="{ name: 'LeaveRequestDetail', params: { id: leaveRequest.id } }">Back to Leave
            Request</router-link>

        <button @click="deleteLeaveRequest">Delete Leave Request</button>
    </div>
</template>
  
<script>
import axios from 'axios';
import LeaveRequestForm from '@/components/LeaveRequestForm.vue';

export default {
    components: {
        LeaveRequestForm,
    },
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
            axios.get(`/api/leave_requests/${this.$route.params.id}`)
                .then(response => {
                    this.leaveRequest = response.data;
                    console.log('Leave Request:', this.leaveRequest);
                })
                .catch(error => {
                    console.error('Error fetching leave request', error);
                });
        },
        deleteLeaveRequest() {
            axios.delete(`/api/leave_requests/${this.$route.params.id}`)
                .then(() => {
                    console.log('Leave Request deleted successfully');
                    this.$router.push('/leave_requests');
                })
                .catch(error => {
                    console.error('Error deleting leave request', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  