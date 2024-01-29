<template>
  <div class="container">
    <h1 class="sm-title">Vue Session Manager</h1>
    <div class="sm-card">
      <div v-if="isLoggedIn">
        <!-- Content to display when logged in -->
        <button @click="logoutUser" class="logout-button">Logout</button>
        <table class="table">
          <!-- Table content for logged-in user -->
        </table>
      </div>
      <div v-else>
        <!-- Login form -->
        <h3>Login!</h3>
        <form @submit="onLogin" class="login-form">
          <input class="login-form-email" type="text" v-model="loginEmail" placeholder="Email" />
          <br />
          <input class="login-form-password" type="password" v-model="loginPassword" placeholder="Password" />
          <br />
          <input type="submit" value="Login" class="login-form-submit" />
        </form>

        <!-- Link to the registration page -->
        <router-link to="/register">Register</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import "@/store/index.js";
import { mapActions, mapGetters } from "vuex";

export default {
  name: "LoginPage",
  computed: {
    ...mapGetters(["isLoggedIn"]),
  },
  data() {
    return {
      loginEmail: "",
      loginPassword: "",
    };
  },
  methods: {
    ...mapActions(["loginUser", "logoutUser"]),
    onLogin(event) {
      event.preventDefault();
      let data = {
        user: {
          email: this.loginEmail,
          password: this.loginPassword,
        },
      };
      this.loginUser(data);
      this.resetData();
    },
    resetData() {
      this.loginEmail = "";
      this.loginPassword = "";
    },
  },
};
</script>

<style scoped>
/* Styles for LoginPage component */
</style>
