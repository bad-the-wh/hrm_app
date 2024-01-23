<template>
    <div>
        <h1>Edit Performance Evaluation</h1>

        <performance-evaluation-form />
        <router-link :to="{ name: 'PerformanceEvaluationDetail', params: { id: evaluation.id } }">Back to Performance
            Evaluation</router-link>

        <button @click="deleteEvaluation">Delete Performance Evaluation</button>
    </div>
</template>
  
<script>
import axios from 'axios';
import PerformanceEvaluationForm from '@/components/PerformanceEvaluationForm.vue';

export default {
    components: {
        PerformanceEvaluationForm,
    },
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
        deleteEvaluation() {
            axios.delete(`/api/performance_evaluations/${this.$route.params.id}`)
                .then(() => {
                    console.log('Performance Evaluation deleted successfully');
                    this.$router.push('/performance_evaluations');
                })
                .catch(error => {
                    console.error('Error deleting performance evaluation', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  