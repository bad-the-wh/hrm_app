<template>
    <div>
        <h2>Create User</h2>

        <form @submit.prevent="registerUser">
            <div>
                <label for="email">Email</label>
                <input v-model="email" type="email" id="email" required />
            </div>

            <div>
                <label for="password">Password</label>
                <input v-model="password" type="password" id="password" required />
            </div>

            <div>
                <label for="password_confirmation">Password Confirmation</label>
                <input v-model="passwordConfirmation" type="password" id="password_confirmation" required />
            </div>

            <div>
                <button type="submit">Register</button>
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
            passwordConfirmation: '',
        };
    },
    methods: {
        async registerUser() {
            try {
                const response = await axios.post('http://localhost:3000/users', {
                    user: {
                        email: this.email,
                        password: this.password,
                        password_confirmation: this.passwordConfirmation,
                    },
                });

                // Handle success if needed
                console.log('User registered successfully', response);

                this.$router.push('/login');
            } catch (error) {
                // Handle error if needed
                console.error('Error registering user', error);
            }
        },
    },
};
</script>
  