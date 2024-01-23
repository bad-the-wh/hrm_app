<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="name">Name</label>
            <input v-model="employee.name" type="text" id="name" />
        </div>

        <div>
            <label for="email">Email</label>
            <input v-model="employee.email" type="text" id="email" />
        </div>

        <div>
            <label for="position">Position</label>
            <input v-model="employee.position" type="text" id="position" />
        </div>

        <div>
            <label for="birthdate">Birthdate</label>
            <input v-model="employee.birthdate" type="date" id="birthdate" />
        </div>

        <div>
            <button type="submit">Submit</button>
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
/* Your component-specific styles go here */
</style>
  