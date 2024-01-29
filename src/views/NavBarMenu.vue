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

      <li v-show="!isLoggedIn">
        <router-link to="/login">Login</router-link>
      </li>
      <li v-show="isLoggedIn">
        <router-link to="/logout" @click="logout">Logout</router-link>
      </li>
    </ul>
  </nav>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  computed: {
    ...mapGetters(['isLoggedIn']),
  },
  methods: {
    ...mapActions(['logoutUser']),
    logout() {
      // Call the Vuex action to log out the user
      this.logoutUser();
      // You can also redirect the user to the login page here if needed
      // Example: this.$router.push('/login');
    },
  },
};
</script>

<style scoped>
/* Navigation Styles */
nav {
  background-color: #16b07c;
  color: white;
  padding: 10px;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: flex;
}

li {
  margin-right: 20px;
  position: relative;
}

li:hover ul {
  display: block;
}

li a {
  color: white;
  text-decoration: none;
  padding: 10px;
  display: block;
}

li ul {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #32e69e;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

li ul li {
  width: 150px;
  white-space: nowrap;
}

li ul li a {
  padding: 10px;
  display: block;
}

li ul li:hover {
  background-color: #158a5a;
}
</style>
