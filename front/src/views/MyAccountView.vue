<template>
  <div className="home">
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

<script>
import UserDataComponent from '../components/MyAccountComponents/UserDataComponent.vue';
import PasswordDataComponent from '../components/MyAccountComponents/PasswordDataComponent.vue';

export default {
  name: 'MyAccountView',
  components: { UserDataComponent, PasswordDataComponent },
  data() {
    return {
      isCell: false,
      windowWidth: window.innerWidth,
    };
  },
  methods: {
    onResize() {
      this.windowWidth = window.innerWidth;
    },
    verifyResize(i) {
      if (i < 768) {
        return true;
      } return false;
    },
    changePage(val) {
      this.isFaq = val;
    },
  },
  watch: {
    windowWidth(newWidth) {
      this.isCell = this.verifyResize(newWidth);
    },
  },
  beforeMount() {
    this.isCell = this.verifyResize(window.innerWidth);
  },
  mounted() {
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize);
    });
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.onResize);
  },
};
</script>
