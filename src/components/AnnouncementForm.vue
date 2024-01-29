<template>
    <form @submit.prevent="submitForm" class="login-form">
        <div>
            <label for="employeeLDAP">Employee LDAP</label>
            <input v-model="announcement.posted_by" type="number" id="employeeLDAP" class="login-form-input" min="100000000"
                max="999999999" />
        </div>

        <div>
            <label for="position">Position</label>
            <input v-model="announcement.concerned_position" type="text" id="position" class="login-form-input" />
        </div>

        <div>
            <label for="title">Title</label>
            <input v-model="announcement.title" type="text" id="title" class="login-form-input" />
        </div>

        <div>
            <label for="content">Content</label>
            <textarea v-model="announcement.message" id="content" class="login-form-input"></textarea>
        </div>

        <div>
            <label for="published_at">Published at</label>
            <input v-model="announcement.publication_date" type="date" id="published_at" class="login-form-input" />
        </div>

        <div>
            <button type="submit" class="login-form-submit">Submit</button>
        </div>
    </form>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            announcement: {
                posted_by: 0, // Default value, replace with appropriate default if needed
                concerned_position: '',
                title: '',
                message: '',
                publication_date: '',
            },
        };
    },
    methods: {
        submitForm() {
            axios.post('http://localhost:3000/api/announcements', this.announcement)
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
