<template>
    <div class="performance-evaluations-list">
        <h1>Performance Evaluations</h1>

        <ul>
            <li v-for="evaluation in evaluations" :key="evaluation.id" class="evaluation-item">
                <!-- Display employee details directly from the joint request -->
                <router-link :to="{ name: 'PerformanceEvaluationDetail', params: { id: evaluation.id } }"
                    class="employee-link">
                    {{ employeeReviewedList[evaluation.employee_reviewed_id]?.name }}
                </router-link>

                <!-- Displaying note and commentary -->
                <p class="note">Note: {{ evaluation.note }}</p>
                <p class="commentary">Commentary: {{ evaluation.commentary }}</p>

                <!-- Display information about the reviewer -->
                <p v-if="employeeReviewerList[evaluation.reviewer_id]" class="reviewer-info">Reviewer: {{
                    employeeReviewerList[evaluation.reviewer_id].name }}</p>
            </li>
        </ul>

        <router-link to="/performance_evaluations/new" class="new-evaluation-link">New Performance Evaluation</router-link>
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
.performance-evaluations-list {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
}

.evaluation-item {
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.employee-link {
    font-weight: bold;
    text-decoration: none;
    color: #16b07c;
}

.note,
.commentary {
    margin: 5px 0;
}

.reviewer-info {
    font-style: italic;
    color: #555;
}

.new-evaluation-link {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #16b07c;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.new-evaluation-link:hover {
    background-color: #158a5a;
}
</style>
