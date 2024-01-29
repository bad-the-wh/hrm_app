<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="evaluation_date">Evaluation Date</label>
            <input v-model="performanceEvaluation.evaluation_date" type="date" id="evaluation_date" />
        </div>

        <div>
            <label for="employee_reviewed">Employee Reviewed (LDAP)</label>
            <input v-model="performanceEvaluation.employee_reviewed" type="number" id="employee_reviewed" />
        </div>

        <div>
            <label for="reviewer">Reviewer (LDAP)</label>
            <input v-model="performanceEvaluation.reviewer" type="number" id="reviewer" />
        </div>

        <div>
            <label for="score">Score</label>
            <input v-model="performanceEvaluation.note" type="number" id="score" />
        </div>

        <div>
            <label for="feedback">Feedback</label>
            <textarea v-model="performanceEvaluation.commentary" id="feedback"></textarea>
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
/* Your component-specific styles go here */
</style>
