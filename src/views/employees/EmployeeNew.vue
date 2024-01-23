<template>
    <div>
        <h1>New Employee</h1>

        <employee-form />
        <router-link to="/employees">Back to Employee List</router-link>
    </div>
</template>
  
<script>
import EmployeeForm from '@/components/EmployeeForm.vue';

export default {
    components: {
        EmployeeForm,
    },
};
</script>
  
<style scoped>
/* Your component-specific styles go here */
</style>