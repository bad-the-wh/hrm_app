import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import axios from 'axios';

createApp(App).use(router).mount('#app');


// Assuming you have a global Axios configuration
axios.defaults.xsrfCookieName = 'CSRF-TOKEN'; // Replace with your actual cookie name
axios.defaults.xsrfHeaderName = 'X-CSRF-Token'; // Replace with your actual header name
axios.defaults.withCredentials = true;

