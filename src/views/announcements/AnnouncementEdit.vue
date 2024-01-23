<template>
    <div>
        <h1>Edit Announcement</h1>

        <announcement-form />
        <router-link :to="{ name: 'AnnouncementDetail', params: { id: announcement.id } }">Back to Announcement</router-link>

        <button @click="deleteAnnouncement">Delete Announcement</button>
    </div>
</template>
  
<script>
import axios from 'axios';
import AnnouncementForm from '@/components/AnnouncementForm.vue';

export default {
    components: {
        AnnouncementForm,
    },
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
        deleteAnnouncement() {
            axios.delete(`/api/announcements/${this.$route.params.id}`)
                .then(() => {
                    console.log('Announcement deleted successfully');
                    this.$router.push('/announcements');
                })
                .catch(error => {
                    console.error('Error deleting announcement', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  