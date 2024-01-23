<template>
    <div>
        <h1>New Performance Evaluation</h1>

        <performance-evaluation-form />
        <router-link to="/performance_evaluations">Back to Performance Evaluations</router-link>
    </div>
</template>
  
<script>
import PerformanceEvaluationForm from '@/components/PerformanceEvaluationForm.vue';

export default {
    components: {
        PerformanceEvaluationForm,
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  