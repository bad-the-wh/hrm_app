<template>
    <div>
        <h1>{{ evaluation.employee.name }}</h1>

        <p>Score: {{ evaluation.score }}</p>
        <p>Feedback: {{ evaluation.feedback }}</p>

        <router-link :to="{ name: 'PerformanceEvaluationEdit', params: { id: evaluation.id } }">Edit Performance
            Evaluation</router-link>
        <router-link to="/performance_evaluations">Back to Performance Evaluations</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            evaluation: {},
        };
    },
    mounted() {
        this.fetchEvaluation();
    },
    methods: {
        fetchEvaluation() {
            axios.get(`/api/performance_evaluations/${this.$route.params.id}`)
                .then(response => {
                    this.evaluation = response.data;
                    console.log('Performance Evaluation:', this.evaluation);
                })
                .catch(error => {
                    console.error('Error fetching performance evaluation', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  