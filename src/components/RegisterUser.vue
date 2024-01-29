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
                <!-- Registration form -->
                <h3>Register!</h3>
                <form @submit.prevent="onRegister" class="register-form">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input v-model="registerEmail" type="text" id="email" placeholder="Email" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input v-model="registerPassword" type="password" id="password" placeholder="Password" />
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input v-model="confirmPassword" type="password" id="confirmPassword"
                            placeholder="Confirm Password" />
                    </div>
                    <div class="form-group">
                        <button type="submit" class="register-form-submit">Register</button>
                    </div>
                </form>
                <!-- Link to login page -->
                <router-link to="/login">Already have an account? Sign in here.</router-link>
            </div>
        </div>
    </div>
</template>
  
<script>

import "@/store/index.js";
import { mapActions, mapGetters } from "vuex";

export default {
    name: "RegisterUser",
    computed: {
        ...mapGetters(["isLoggedIn"]),
    },
    data() {
        return {
            registerEmail: "",
            registerPassword: "",
            confirmPassword: "",
        };
    },
    methods: {
        ...mapActions(["registerUser", "logoutUser"]),
        onRegister() {
            // Add validation logic here if needed
            if (this.registerPassword !== this.confirmPassword) {
                // Display an error message or prevent form submission
                console.error("Passwords do not match");
                return;
            }

            const userData = {
                user: {
                    email: this.registerEmail,
                    password: this.registerPassword,
                },
            };

            this.registerUser(userData);
            this.resetData();
        },
        resetData() {
            this.registerEmail = "";
            this.registerPassword = "";
            this.confirmPassword = "";
        },
    },
};
</script>
  
<style scoped>
/* Styles for RegisterUser component */

.register-form {
    max-width: 300px;
    margin: auto;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

.register-form-submit {
    background-color: #4caf50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
