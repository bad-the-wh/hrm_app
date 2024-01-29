<template>
    <div class="announcements-list">
        <h1>Announcements</h1>

        <ul class="announcement-list">
            <li v-for="announcement in announcements" :key="announcement.id">
                <router-link :to="{ name: 'AnnouncementDetail', params: { id: announcement.id } }">
                    {{ announcement.title }}
                </router-link>
            </li>
        </ul>

        <router-link to="/announcements/new" class="new-announcement-link">
            New Announcement
        </router-link>
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
                })
                .catch(error => {
                    console.error('Error fetching announcements', error);
                });
        },
    },
};
</script>

<style scoped>
.announcements-list {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
}

.announcement-list {
    list-style-type: none;
    padding: 0;
}

.announcement-list li {
    margin: 10px 0;
}

.router-link-exact-active {
    color: #16b07c;
    /* Color for active link */
}

.new-announcement-link {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    background-color: #16b07c;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.new-announcement-link:hover {
    background-color: #158a5a;
}
</style>
