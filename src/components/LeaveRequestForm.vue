<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="employeeLDAP">Employee LDAP</label>
            <input v-model="leaveRequest.employee" type="number" id="employeeLDAP" min="100000000" max="999999999" />
        </div>

        <div>
            <label for="start_date">Start Date</label>
            <input v-model="leaveRequest.leave_start_date" type="date" id="start_date" />
        </div>

        <div>
            <label for="end_date">End Date</label>
            <input v-model="leaveRequest.leave_end_date" type="date" id="end_date" />
        </div>

        <div>
            <label for="reason">Reason</label>
            <textarea v-model="leaveRequest.reason" id="reason"></textarea>
        </div>

        <div>
            <button type="submit">Submit</button>
        </div>
    </form>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            leaveRequest: {
                employee: 0, // Default value, replace with appropriate default if needed
                leave_start_date: '',
                leave_end_date: '',
                reason: '',
            },
        };
    },
    methods: {
        submitForm() {
            axios.post('http://localhost:3000/api/leave_requests', this.leaveRequest)
                .then(response => {
                    // Handle success if needed
                    console.log('Leave Request submitted successfully', response);
                })
                .catch(error => {
                    // Handle error if needed
                    console.error('Error submitting Leave Request form', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
