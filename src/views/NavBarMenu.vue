<template>
  <nav>
    <ul>
      <!-- Employee Links -->
      <li>
        <router-link to="/employees">Employees</router-link>
        <ul>
          <li><router-link to="/employees">List</router-link></li>
          <li><router-link to="/employees/new">New</router-link></li>
        </ul>
      </li>

      <!-- Leave Requests Links -->
      <li>
        <router-link to="/leave_requests">Leave Requests</router-link>
        <ul>
          <li><router-link to="/leave_requests">List</router-link></li>
          <li><router-link to="/leave_requests/new">New</router-link></li>
        </ul>
      </li>

      <!-- Performance Evaluations Links -->
      <li>
        <router-link to="/performance_evaluations">Performance Evaluations</router-link>
        <ul>
          <li><router-link to="/performance_evaluations">List</router-link></li>
          <li><router-link to="/performance_evaluations/new">New</router-link></li>
        </ul>
      </li>

      <!-- Announcements Links -->
      <li>
        <router-link to="/announcements">Announcements</router-link>
        <ul>
          <li><router-link to="/announcements">List</router-link></li>
          <li><router-link to="/announcements/new">New</router-link></li>
        </ul>
      </li>
    </ul>
  </nav>
</template>
  
<script>
export default {
  // Add any additional logic or styling specific to your navbar
};
</script>
  
<style scoped>
/* Add your styling for the navbar */
nav {
  background-color: #333;
  color: white;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

li {
  display: inline-block;
  margin-right: 10px;
}

li ul {
  display: none;
  position: absolute;
  background-color: #555;
}

li:hover ul {
  display: block;
}
</style>
  