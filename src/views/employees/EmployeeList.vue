<template>
  <div class="employee-list">
    <h2>Employee List</h2>

    <div v-if="loading" class="loading">Loading...</div>

    <ul v-else-if="employees.length > 0" class="list">
      <li v-for="employee in employees" :key="employee.id" class="employee-item">
        <router-link :to="{ name: 'EmployeeDetail', params: { id: employee.id } }" class="employee-link">
          {{ employee.name }} - {{ employee.position }} ({{ employee.LDAP }})
        </router-link>
      </li>
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
        const response = await axios.get('http://localhost:3000/api/employees'); // Update this URL
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

<style scoped>
.employee-list {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
  color: #333;
}

.loading {
  margin-top: 20px;
}

.list {
  list-style: none;
  padding: 0;
}

.employee-item {
  margin: 10px 0;
}

.employee-link {
  text-decoration: none;
  color: #16b07c;
  transition: color 0.3s;
}

.employee-link:hover {
  color: #158a5a;
}
</style>
