<template>
  <div>
    <h1>Home Page</h1>
    <NavBarMenu></NavBarMenu>
    <router-view></router-view>
  </div>
</template>

<script>
import NavBarMenu from '@/views/NavBarMenu.vue';

export default {
  components: {
    NavBarMenu,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
