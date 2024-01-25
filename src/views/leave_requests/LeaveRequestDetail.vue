<template>
    <div>
        <h1>{{ getEmployeeName() }}</h1>

        <p>Start Date: {{ leaveRequest.leave_start_date }}</p>
        <p>End Date: {{ leaveRequest.leave_end_date }}</p>
        <p>Response: {{ leaveRequest.response }}</p>

        <router-link :to="{ name: 'LeaveRequestEdit', params: { id: leaveRequest.id } }">
            Edit Leave Request
        </router-link>
        <router-link to="/leave_requests">Back to Leave Requests</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            leaveRequest: {},
            employeeDetails: {},
        };
    },
    mounted() {
        this.fetchLeaveRequestDetails();
    },
    methods: {
        fetchLeaveRequestDetails() {
            const leaveRequestId = this.$route.params.id;

            axios
                .get(`http://localhost:3000/api/leave_requests/${leaveRequestId}`)
                .then((response) => {
                    this.leaveRequest = response.data;
                    // Fetch additional details about the employee for this leave request
                    if (this.leaveRequest.employee_id) {
                        this.fetchEmployeeDetails(this.leaveRequest.employee_id);
                    }
                })
                .catch((error) => {
                    console.error('Error fetching leave request details', error);
                });
        },
        fetchEmployeeDetails(employeeId) {
            axios
                .get(`http://localhost:3000/api/employees/${employeeId}`)
                .then((response) => {
                    // Attach employee details to the leave request
                    this.employeeDetails = response.data;
                })
                .catch((error) => {
                    console.error('Error fetching employee details', error);
                });
        },
        getEmployeeName() {
            // Access employee name from employeeDetails
            return this.employeeDetails.name;
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
