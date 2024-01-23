<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="score">Score</label>
            <input v-model="performanceEvaluation.score" type="number" id="score" />
        </div>

        <div>
            <label for="feedback">Feedback</label>
            <textarea v-model="performanceEvaluation.feedback" id="feedback"></textarea>
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
                score: null,
                feedback: '',
            },
        };
    },
    methods: {
        submitForm() {
            // Make an axios call to submit the form data
            // Replace the following line with your actual API endpoint
            axios.post('http:://localhost:3000/api/performance_evaluations', this.performanceEvaluation)
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
  