<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="start_date">Start Date</label>
            <input v-model="leaveRequest.start_date" type="date" id="start_date" />
        </div>

        <div>
            <label for="end_date">End Date</label>
            <input v-model="leaveRequest.end_date" type="date" id="end_date" />
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
                start_date: '',
                end_date: '',
                reason: '',
            },
        };
    },
    methods: {
        submitForm() {
            // Make an axios call to submit the form data
            // Replace the following line with your actual API endpoint
            axios.post('http:://localhost:3000/api/leave_requests', this.leaveRequest)
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
  