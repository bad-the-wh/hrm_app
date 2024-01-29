<template>
    <div class="employee-detail">
        <h1>{{ employee.name }}</h1>

        <div class="employee-info">
            <p>LDAP: {{ employee.LDAP }}</p>
            <p>Email: {{ employee.email }}</p>
            <p>Position: {{ employee.position }}</p>
            <p>Birthdate: {{ employee.birthdate }}</p>
        </div>

        <router-link :to="{ name: 'EmployeeEdit', params: { id: employee.id } }" class="edit-link">Edit
            Employee</router-link>
        <router-link to="/employees" class="back-link">Back to Employee List</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            employee: {},
        };
    },
    mounted() {
        this.fetchEmployee();
    },
    methods: {
        fetchEmployee() {
            // Replace the following line with your actual API endpoint
            axios.get(`http://localhost:3000/api/employees/${this.$route.params.id}`)
                .then(response => {
                    this.employee = response.data;
                    console.log('Employee:', this.employee);
                })
                .catch(error => {
                    console.error('Error fetching employee', error);
                });
        },
    },
};
</script>
  
<style scoped>
.employee-detail {
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

.employee-info {
    margin-top: 20px;
}

p {
    margin: 10px 0;
}

.edit-link,
.back-link {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    text-decoration: none;
    color: #fff;
    background-color: #16b07c;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.edit-link:hover,
.back-link:hover {
    background-color: #158a5a;
}
</style>
