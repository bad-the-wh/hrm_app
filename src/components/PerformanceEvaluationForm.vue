<template>
    <form @submit.prevent="submitForm" class="login-form">
        <div>
            <label for="evaluation_date">Evaluation Date</label>
            <input v-model="performanceEvaluation.evaluation_date" type="date" id="evaluation_date"
                class="login-form-input" />
        </div>

        <div>
            <label for="employee_reviewed">Employee Reviewed (LDAP)</label>
            <input v-model="performanceEvaluation.employee_reviewed" type="number" id="employee_reviewed"
                class="login-form-input" />
        </div>

        <div>
            <label for="reviewer">Reviewer (LDAP)</label>
            <input v-model="performanceEvaluation.reviewer" type="number" id="reviewer" class="login-form-input" />
        </div>

        <div>
            <label for="score">Score</label>
            <input v-model="performanceEvaluation.note" type="number" id="score" class="login-form-input" />
        </div>

        <div>
            <label for="feedback">Feedback</label>
            <textarea v-model="performanceEvaluation.commentary" id="feedback" class="login-form-input"></textarea>
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
            performanceEvaluation: {
                evaluation_date: '',
                employee_reviewed: 0, // Default value, replace with appropriate default if needed
                reviewer: 0, // Default value, replace with appropriate default if needed
                note: null,
                commentary: '',
            },
        };
    },
    methods: {
        submitForm() {
            // Make an axios call to submit the form data
            // Replace the following line with your actual API endpoint
            axios.post('http://localhost:3000/api/performance_evaluations', this.performanceEvaluation)
                .then(response => {
                    // Handle success if needed
                    console.log('Performance Evaluation submitted successfully', response);
                })
                .catch(error => {
                    // Handle error if needed
                    console.error('Error submitting Performance Evaluation form', error);
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