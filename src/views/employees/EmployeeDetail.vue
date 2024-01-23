<template>
    <div>
        <h1>{{ employee.name }}</h1>

        <p>Email: {{ employee.email }}</p>
        <p>Position: {{ employee.position }}</p>
        <p>Birthdate: {{ employee.birthdate }}</p>

        <router-link :to="{ name: 'EmployeeEdit', params: { id: employee.id } }">Edit Employee</router-link>
        <router-link to="/employees">Back to Employee List</router-link>
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
            axios.get(`http://localhost:3000/api/employees${this.$route.params.id}`)
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
/* Your component-specific styles go here */
</style>
  