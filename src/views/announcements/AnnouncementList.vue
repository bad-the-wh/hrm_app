<template>
    <div>
        <h1>Announcements</h1>

        <ul>
            <li v-for="announcement in announcements" :key="announcement.id">
                <router-link :to="{ name: 'AnnouncementDetail', params: { id: announcement.id } }">
                    {{ announcement.title }}
                </router-link>
            </li>
        </ul>

        <router-link to="/announcements/new">New Announcement</router-link>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            announcements: [],
        };
    },
    mounted() {
        this.fetchAnnouncements();
    },
    methods: {
        fetchAnnouncements() {
            axios.get('http://localhost:3000/api/announcements')
                .then(response => {
                    this.announcements = response.data;
                    console.log('Announcements:', this.announcements);
                })
                .catch(error => {
                    console.error('Error fetching announcements', error);
                });
        },
    },
};
</script>

<style scoped>
/* Your component-specific styles go here */
</style>
