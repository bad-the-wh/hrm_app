<template>
    <div>
        <h1>{{ announcement.title }}</h1>

        <p>Title: {{ announcement.title }}</p>
        <p>Content: {{ announcement.message }}</p>

        <!-- Display information about the employee who posted the announcement -->
        <p>Posted by: {{ employeeDetails.name }}</p>

        <!-- Display information about the concerned position -->
        <p>Concerned Position: {{ employeeDetails.position }}</p>

        <router-link :to="{ name: 'AnnouncementEdit', params: { id: announcement.id } }">
            Edit Announcement
        </router-link>
        <router-link to="/announcements">Back to Announcements</router-link>
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
                    console.log('Employee Details:', this.employeeDetails);
                })
                .catch((error) => {
                    console.error('Error fetching employee details', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  