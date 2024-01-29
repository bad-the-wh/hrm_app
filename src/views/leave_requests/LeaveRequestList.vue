<template>
    <div class="leave-requests-list">
        <h1>Leave Requests</h1>

        <ul>
            <li v-for="leaveRequest in leaveRequests" :key="leaveRequest.id">
                <router-link :to="{ name: 'LeaveRequestDetail', params: { id: leaveRequest.id } }"
                    class="leave-request-link">
                    {{ getEmployeeName(leaveRequest.employeeDetails) }}
                </router-link>
            </li>
        </ul>

        <router-link to="/leave_requests/new" class="new-request-link">New Leave Request</router-link>
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
.leave-requests-list {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
}

ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

li {
    margin-bottom: 10px;
}

.leave-request-link,
.new-request-link {
    display: inline-block;
    padding: 8px 16px;
    background-color: #16b07c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.leave-request-link:hover,
.new-request-link:hover {
    background-color: #158a5a;
}
</style>
  