<template>
    <form @submit.prevent="submitForm" class="login-form">
        <div>
            <label for="name">Name</label>
            <input v-model="employee.name" type="text" id="name" class="login-form-input" />
        </div>

        <div>
            <label for="email">Email</label>
            <input v-model="employee.email" type="text" id="email" class="login-form-input" />
        </div>

        <div>
            <label for="position">Position</label>
            <input v-model="employee.position" type="text" id="position" class="login-form-input" />
        </div>

        <div>
            <label for="birthdate">Birthdate</label>
            <input v-model="employee.birthdate" type="date" id="birthdate" class="login-form-input" />
        </div>

        <div>
            <button type="submit" class="login-form-submit">Submit</button>
        </div>
    </form>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            employee: {
                name: '',
                email: '',
                position: '',
                birthdate: '',
            },
        };
    },
    methods: {
        submitForm() {
            // Make an axios call to submit the form data
            axios.post('http://localhost:3000/api/employees', this.employee)
                .then(response => {
                    // Handle success if needed
                    console.log('Employee submitted successfully', response);
                })
                .catch(error => {
                    // Handle error if needed
                    console.error('Error submitting employee form', error);
                });
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
</style>