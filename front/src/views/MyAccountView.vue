<template>
  <div className="my-account">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          My Account
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div className="grid grid-cols-2 gap-[51px]">
      <user-data-component />
      <password-data-component />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
import UserDataComponent from '../components/MyAccountComponents/UserDataComponent.vue';
import PasswordDataComponent from '../components/MyAccountComponents/PasswordDataComponent.vue';

export default {
  name: 'MyAccountView',
  components: { UserDataComponent, PasswordDataComponent },
  data() {
    return {};
  },
  methods: {},
  beforeMount() {
    const store = useLoginStore();
    if (store.getToken === '') {
      this.$router.push({ name: 'login' });
    }
  },
};
</script>
