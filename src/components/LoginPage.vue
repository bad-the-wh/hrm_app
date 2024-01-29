<template>
  <div class="container">
    <h1 class="sm-title">Vue Session Manager</h1>
    <div class="sm-card">
      <div v-if="isLoggedIn" class="user-info">
        <!-- Content to display when logged in -->
        <button @click="logoutUser" class="logout-button">Logout</button>
        <table class="table">
          <!-- Table content for logged-in user -->
        </table>
      </div>
      <div v-else class="login-section">
        <!-- Login form -->
        <h3>Login!</h3>
        <form @submit="onLogin" class="login-form">
          <input class="login-form-input" type="text" v-model="loginEmail" placeholder="Email" />
          <br />
          <input class="login-form-input" type="password" v-model="loginPassword" placeholder="Password" />
          <br />
          <input type="submit" value="Login" class="login-form-submit" />
        </form>

        <!-- Link to the registration page -->
        <router-link to="/register" class="register-link">Register</router-link>
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
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 50px;
}

.sm-title {
  font-size: 24px;
  margin-bottom: 20px;
}

.sm-card {
  border: 1px solid #ccc;
  padding: 20px;
  width: 300px;
  border-radius: 8px;
}

.user-info {
  text-align: center;
}

.logout-button {
  background-color: #ff4500;
  color: #fff;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.login-section {
  text-align: center;
}

.login-form {
  margin-top: 20px;
}

.login-form-input {
  margin: 8px 0;
  padding: 8px;
  width: 100%;
  box-sizing: border-box;
}

.login-form-submit {
  background-color: #4caf50;
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.register-link {
  margin-top: 10px;
  display: block;
  color: #3498db;
  text-decoration: none;
  font-weight: bold;
}
</style>
