<template>
    <div class="announcement-detail">
        <h1>{{ announcement.title }}</h1>

        <div class="announcement-info">
            <p><strong>Title:</strong> {{ announcement.title }}</p>
            <p><strong>Content:</strong> {{ announcement.message }}</p>

            <!-- Display information about the employee who posted the announcement -->
            <p><strong>Posted by:</strong> {{ employeeDetails.name }}</p>

            <!-- Display information about the concerned position -->
            <p><strong>Concerned Position:</strong> {{ employeeDetails.position }}</p>
        </div>

        <div class="action-buttons">
            <router-link :to="{ name: 'AnnouncementEdit', params: { id: announcement.id } }" class="edit-button">
                Edit Announcement
            </router-link>
            <router-link to="/announcements" class="back-button">Back to Announcements</router-link>
        </div>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            announcement: {},
            employeeDetails: {},
        };
    },
    mounted() {
        this.fetchAnnouncement();
    },
    methods: {
        fetchAnnouncement() {
            axios
                .get(`http://localhost:3000/api/announcements/${this.$route.params.id}`)
                .then((response) => {
                    this.announcement = response.data;
                    // Fetch additional details about the posted_by employee
                    this.fetchEmployeeDetails(this.announcement.posted_by_id);
                })
                .catch((error) => {
                    console.error('Error fetching announcement', error);
                });
        },
        fetchEmployeeDetails(employeeId) {
            axios
                .get(`http://localhost:3000/api/employees/${employeeId}`)
                .then((response) => {
                    this.employeeDetails = response.data;
                })
                .catch((error) => {
                    console.error('Error fetching employee details', error);
                });
        },
    },
};
</script>
  
<style scoped>
.announcement-detail {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
}

.announcement-info {
    background-color: #fff;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 20px;
}

p {
    margin: 10px 0;
}

.action-buttons {
    display: flex;
    justify-content: space-between;
}

.edit-button,
.back-button {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    color: #fff;
    transition: background-color 0.3s;
}

.edit-button {
    background-color: #16b07c;
}

.back-button {
    background-color: #333;
}

.edit-button:hover,
.back-button:hover {
    background-color: #158a5a;
}
</style>
