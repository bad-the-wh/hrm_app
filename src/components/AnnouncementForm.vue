<template>
    <form @submit.prevent="submitForm">
        <div>
            <label for="title">Title</label>
            <input v-model="announcement.title" type="text" id="title" />
        </div>

        <div>
            <label for="content">Content</label>
            <textarea v-model="announcement.content" id="content"></textarea>
        </div>

        <div>
            <label for="published_at">Published at</label>
            <input v-model="announcement.published_at" type="date" id="published_at" />
        </div>

        <div>
            <button type="submit">Submit</button>
        </div>
    </form>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            announcement: {
                title: '',
                content: '',
                published_at: '',
            },
        };
    },
    methods: {
        submitForm() {
            // Make an axios call to submit the form data
            // Replace the following line with your actual API endpoint
            axios.post('http:://localhost:3000/api/announcements', this.announcement)
                .then(response => {
                    // Handle success if needed
                    console.log('Announcement submitted successfully', response);
                })
                .catch(error => {
                    // Handle error if needed
                    console.error('Error submitting Announcement form', error);
                });
        },
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>
  