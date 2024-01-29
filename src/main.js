// src/main.js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store'; // Import the Vuex store
import axios from 'axios';

let localAuthToken = localStorage.auth_token;
let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
if (cookieExists) {
  const auth_token = localStorage.getItem("auth_token");
  const authTokenExists = auth_token !== "undefined" && auth_token !== null;
  if (authTokenExists) {
    store.dispatch("loginUserWithToken", { auth_token });
  }
}

createApp(App).use(router).use(store).mount('#app'); // Use the Vuex store

// Assuming you have a global Axios configuration
axios.interceptors.request.use(
    (config) => {
      const token = store.getters.getAuthToken;
      if (token) {
        config.headers.Authorization = token;
      }
      return config;
    },
    (error) => {
      return Promise.reject(error);
    }
  );
  
axios.defaults.xsrfCookieName = 'CSRF-TOKEN'; // Replace with your actual cookie name
axios.defaults.xsrfHeaderName = 'X-CSRF-Token'; // Replace with your actual header name
axios.defaults.withCredentials = true;
