<template>
  <div>
    <h2>Employee List</h2>

    <div v-if="loading">Loading...</div>

    <ul v-else-if="employees.length > 0">
      <li v-for="employee in employees" :key="employee.id">{{ employee.name }}</li>
    </ul>

    <div v-else>
      <p>No employees found.</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      employees: [],
      loading: false,
    };
  },
  mounted() {
    this.fetchEmployees();
  },
  methods: {
    async fetchEmployees() {
      this.loading = true;

      try {
        // Update the API endpoint URL to match your Rails routes
        const response = await axios.get('http://localhost:3000/api/employees');
        this.employees = response.data;
        console.log('Employees:', this.employees);
      } catch (error) {
        console.error('Error fetching employees', error);
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>
