<template>
  <div>
    <h2>Login</h2>
    <form @submit.prevent="login">
      <div>
        <label for="email">Email:</label>
        <input v-model="email" type="text" id="email" name="user[email]" />
      </div>
      <div>
        <label for="password">Password:</label>
        <input v-model="password" type="password" id="password" name="user[password]" />
      </div>
      <div>
        <button type="submit" :disabled="loading">Login</button>
        <span v-if="loading">Logging in...</span>
      </div>

      <div>
        <h4>Not registered? Create an account.</h4>
        <!-- Add a link to the registration page -->
        <router-link to="/register">Register</router-link>
      </div>

      <div v-if="errorMessage">
        <p>{{ errorMessage }}</p>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      email: '',
      password: '',
      loading: false,
      errorMessage: '',
    };
  },
  methods: {
    async login() {
      try {
        this.loading = true;

        // Retrieve CSRF token from response headers
        const csrfTokenMatch = document.cookie.match(/X-CSRF-Token=([^;]+)/);
        const csrfToken = csrfTokenMatch ? csrfTokenMatch[1] : null;

        console.log(csrfToken);

        const response = await axios.post(
          'http://localhost:3000/users/sign_in',
          {
            user: {
              email: this.email,
              password: this.password,
            },
          },
          {
            withCredentials: true,
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': csrfToken,
            },
          }
        );

        // Check if the response is successful (status 2xx)
        if (response.status >= 200 && response.status < 300) {
          // Check if the response data has a success property
          if (response.data && response.data.success !== undefined) {
            // Save authentication data to use in future requests
            const authData = {
              accessToken: response.headers['access-token'],
              client: response.headers['client'],
              uid: response.headers['uid'],
            };

            // Save authData to localStorage or Vuex for future use
            localStorage.setItem('authData', JSON.stringify(authData));

            // Redirect to another route upon successful login
            this.$router.push('/dashboard');
          } else {
            // Handle unsuccessful login and set error message
            this.errorMessage = 'Invalid credentials.';
          }
        } else {
          // Handle unsuccessful login and set error message
          this.errorMessage = 'Invalid credentials.';
        }
      } catch (error) {
        // Check if the error is due to invalid email or password
        if (error.response && error.response.status === 401) {
          this.errorMessage = 'Invalid credentials.';
        } else {
          console.error('Login error:', error);
          // Handle other login errors and set a generic error message
          this.errorMessage = 'An error occurred during login.';
        }
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped></style>
