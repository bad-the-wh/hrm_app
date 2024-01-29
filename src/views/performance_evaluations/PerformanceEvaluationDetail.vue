<template>
    <div class="performance-evaluation-detail">
        <h1>{{ employee_reviewed.name }}</h1>

        <p>Score: {{ evaluation.note }}</p>
        <p>Feedback: {{ evaluation.commentary }}</p>

        <!-- Display information about the employee who was reviewed -->
        <p v-if="employee_reviewed">Reviewed Employee: {{ employee_reviewed.name }}</p>

        <!-- Display information about the reviewer -->
        <p v-if="employee_reviewer">Reviewer: {{ employee_reviewer.name }}</p>

        <p v-if="evaluation">Date d'évaluation: {{ evaluation.evaluation_date }}</p>

        <router-link :to="{ name: 'PerformanceEvaluationEdit', params: { id: evaluation.id } }" class="edit-link">
            Edit Performance Evaluation
        </router-link>
        <router-link to="/performance_evaluations" class="back-link">Back to Performance Evaluations</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            evaluation: {},
            employee_reviewer: {},
            employee_reviewed: {},
        };
    },
    mounted() {
        this.fetchEvaluation();
    },
    methods: {
        fetchEvaluation() {
            axios
                .get(
                    `http://localhost:3000/api/performance_evaluations/${this.$route.params.id}`,
                    { params: { include: 'employee_reviewed,employee_reviewer' } }
                )
                .then((response) => {
                    this.evaluation = response.data;

                    // Fetch additional details about the employee_reviewed
                    this.fetchEmployeeDetails(this.evaluation.employee_reviewed_id, 'employee_reviewed');

                    // Fetch additional details about the reviewer
                    this.fetchEmployeeDetails(this.evaluation.reviewer_id, 'employee_reviewer');
                })
                .catch((error) => {
                    console.error('Error fetching performance evaluation', error);
                });
        },
        fetchEmployeeDetails(employeeId, propertyName) {
            axios
                .get(`http://localhost:3000/api/employees/${employeeId}`)
                .then((response) => {
                    // Use regular assignment
                    this[propertyName] = response.data;
                    console.log(`${propertyName} Details:`, this[propertyName]);
                })
                .catch((error) => {
                    console.error(`Error fetching ${propertyName} details`, error);
                });
        },
    },
};
</script>
  
<style scoped>
.performance-evaluation-detail {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
}

p {
    margin-bottom: 10px;
}

.edit-link,
.back-link {
    display: inline-block;
    padding: 8px 16px;
    background-color: #16b07c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.edit-link:hover,
.back-link:hover {
    background-color: #158a5a;
}
</style>
