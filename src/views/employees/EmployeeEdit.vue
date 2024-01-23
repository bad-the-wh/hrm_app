<template>
    <div>
        <h1>Edit Employee</h1>

        <employee-form />
        <router-link :to="{ name: 'EmployeeDetail', params: { id: employee.id } }">Back to Employee</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';
import EmployeeForm from '@/components/EmployeeForm.vue';

export default {
    components: {
        EmployeeForm,
    },
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
            axios.get(`http:://localhost:3000/api/employees/${this.$route.params.id}`)
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
  