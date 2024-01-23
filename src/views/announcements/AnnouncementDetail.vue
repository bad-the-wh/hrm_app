<template>
    <div>
        <h1>{{ announcement.title }}</h1>

        <p>Content: {{ announcement.content }}</p>
        <p>Published at: {{ announcement.published_at }}</p>

        <router-link :to="{ name: 'AnnouncementEdit', params: { id: announcement.id } }">Edit Announcement</router-link>
        <router-link to="/announcements">Back to Announcements</router-link>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            announcement: {},
        };
    },
    mounted() {
        this.fetchAnnouncement();
    },
    methods: {
        fetchAnnouncement() {
            axios.get(`/api/announcements/${this.$route.params.id}`)
                .then(response => {
                    this.announcement = response.data;
                    console.log('Announcement:', this.announcement);
                })
                .catch(error => {
                    console.error('Error fetching announcement', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  