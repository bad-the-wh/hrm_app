<template>
    <div class="leave-request-detail">
        <h1>{{ getEmployeeName() }}</h1>

        <div>
            <p>Start Date: {{ leaveRequest.leave_start_date }}</p>
            <p>End Date: {{ leaveRequest.leave_end_date }}</p>
            <p>Response: {{ leaveRequest.response }}</p>
        </div>

        <router-link :to="{ name: 'LeaveRequestEdit', params: { id: leaveRequest.id } }" class="edit-link">
            Edit Leave Request
        </router-link>
        <router-link to="/leave_requests" class="back-link">Back to Leave Requests</router-link>
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
.leave-request-detail {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
}

div {
    margin-top: 20px;
}

p {
    margin: 5px 0;
}

.edit-link,
.back-link {
    display: inline-block;
    margin-top: 10px;
    padding: 5px 10px;
    background-color: #16b07c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.edit-link:hover,
.back-link:hover {
    background-color: #158a5a;
}
</style>
  