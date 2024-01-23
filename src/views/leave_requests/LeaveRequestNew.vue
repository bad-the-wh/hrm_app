<template>
    <div>
        <h1>New Leave Request</h1>

        <leave-request-form />
        <router-link to="/leave_requests">Back to Leave Requests</router-link>
    </div>
</template>
  
<script>
import LeaveRequestForm from '@/components/LeaveRequestForm.vue';

export default {
    components: {
        LeaveRequestForm,
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>  