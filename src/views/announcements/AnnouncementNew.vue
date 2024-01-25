<template>
    <div>
        <h1>New Announcement</h1>

        <announcement-form />
        <router-link to="/announcements">Back to Announcements</router-link>
    </div>
</template>
  
<script>
import AnnouncementForm from '@/components/AnnouncementForm.vue';

export default {
    components: {
        AnnouncementForm,
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>