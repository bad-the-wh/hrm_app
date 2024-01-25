<template>
    <div>
        <h1>Performance Evaluations</h1>

        <ul>
            <li v-for="evaluation in evaluations" :key="evaluation.id">
                <!-- Display employee details directly from the joint request -->
                <router-link :to="{ name: 'PerformanceEvaluationDetail', params: { id: evaluation.id } }">
                    {{ employeeReviewedList[evaluation.employee_reviewed_id]?.name }}
                </router-link>
                <!-- Displaying note and commentary -->
                <p>Note: {{ evaluation.note }}</p>
                <p>Commentary: {{ evaluation.commentary }}</p>

                <!-- Display information about the reviewer -->
                <p v-if="employeeReviewerList[evaluation.reviewer_id]">Reviewer: {{
                    employeeReviewerList[evaluation.reviewer_id].name }}</p>
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
            employeeReviewedList: {}, // Store details of employee_reviewed by evaluation ID
            employeeReviewerList: {}, // Store details of reviewer by evaluation ID
        };
    },
    mounted() {
        this.fetchEvaluations();
    },
    methods: {
        fetchEvaluations() {
            axios
                .get('http://localhost:3000/api/performance_evaluations')
                .then((response) => {
                    this.evaluations = response.data;

                    // Fetch additional details about the employee_reviewed and reviewer
                    this.fetchEmployeeDetails('employeeReviewedList', 'employee_reviewed_id');
                    this.fetchEmployeeDetails('employeeReviewerList', 'reviewer_id');
                })
                .catch((error) => {
                    console.error('Error fetching performance evaluations', error);
                });
        },
        fetchEmployeeDetails(property, foreignKey) {
            // Collect unique employee IDs from evaluations
            const employeeIds = Array.from(
                new Set(this.evaluations.map((evaluation) => evaluation[foreignKey]))
            );

            // Fetch details for each unique employee ID
            employeeIds.forEach((employeeId) => {
                axios
                    .get(`http://localhost:3000/api/employees/${employeeId}`)
                    .then((response) => {
                        // Update the property with the employee details
                        this.$data[property][employeeId] = response.data;
                    })
                    .catch((error) => {
                        console.error(`Error fetching ${property} details`, error);
                    });
            });
        },
    },
};
</script>

  
<style scoped>
/* Your component-specific styles go here */
</style>
  