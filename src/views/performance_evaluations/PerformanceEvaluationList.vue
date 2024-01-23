<template>
    <div>
        <h1>Performance Evaluations</h1>

        <ul>
            <li v-for="evaluation in evaluations" :key="evaluation.id">
                <router-link :to="{ name: 'PerformanceEvaluationDetail', params: { id: evaluation.id } }">
                    {{ evaluation.employee.name }}
                </router-link>
            </li>
        </ul>

        <router-link to="/performance_evaluations/new">New Performance Evaluation</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            evaluations: [],
        };
    },
    mounted() {
        this.fetchEvaluations();
    },
    methods: {
        fetchEvaluations() {
            axios.get('/api/performance_evaluations')
                .then(response => {
                    this.evaluations = response.data;
                    console.log('Performance Evaluations:', this.evaluations);
                })
                .catch(error => {
                    console.error('Error fetching performance evaluations', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  