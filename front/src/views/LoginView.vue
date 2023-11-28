<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="login-view">
    <div className="w-full h-screen grid grid-cols-2 bg-[#107EC4]">
      <div style="clip-path: ellipse(100% 47% at 0% 50%);"
           className="w-full h-[95%] m-auto bg-white">
        <div className="flex h-[85vh]">
          <img className="m-auto w-[60%]"
               src="../../public/assets/img/brand-logo.png"
               alt="" />
        </div>
      </div>
      <div className="m-auto w-auto"
           v-show="page == 'Login'">
        <div className="text-white mb-9 text-[22px]">
          Sign In
        </div>
        <div className="w-full">
          <input v-model="email"
                 placeholder="E-mail"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-5 bg-white">
          <input v-model="password"
                 :type="isHiddenOne ? 'password' : 'text'"
                 aria-label="Password"
                 placeholder="Password"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-5 bg-white">
          <div className="text-[16px] text-white underline mb-9 cursor-pointer"
               @click="page = 'Reset'">
            I forgot the password
          </div>
        </div>
        <div className="w-full p-[12.5px] bg-[#EDBD3A]
        text-white rounded-[8px] cursor-pointer"
             @click="this.login()">
          Login
        </div>
      </div>
      <div className="m-auto w-auto max-w-[443px]"
           v-show="page == 'Reset'">
        <div className="text-white mb-10 text-[22px]">
          Retrieve your account
        </div>
        <div className="w-full mb-10">
          <input v-model="email"
                 placeholder="E-mail or phone number"
                 className="h-[16px] w-full rounded-lg px-4 py-6 mb-5
                 bg-white">
          <div className="text-white text-[16px] w-[90%] m-auto">
            We're gonna sent an e-mail to your inbox with a link to reset your password
          </div>
        </div>
        <div className="w-full p-[10px] bg-[#EDBD3A]
                text-white rounded-[8px] cursor-pointer"
             @click="page = 'Password'">
          Send me the e-mail
        </div>
      </div>
      <div className="m-auto w-auto"
           v-show="page == 'Password'">
        <div className="text-white mb-10 text-[22px]">
          Change your password
        </div>
        <div className="w-full mb-10">
          <input v-model="password"
                 :type="isHiddenOne ? 'password' : 'text'"
                 aria-label="Password"
                 placeholder="Password"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-5
                 bg-white">
          <input v-model="password"
                 :type="isHiddenTwo ? 'password' : 'text'"
                 aria-label="Confirm password"
                 placeholder="Confirm password"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-5
                 bg-white">
        </div>
        <div className="w-full p-[10px] bg-[#EDBD3A]
                text-white rounded-[8px] cursor-pointer">
          Confirm new password
        </div>
        <div className="my-[20px] text-[16px] text-white">or</div>
        <div className="text-[16px] text-[#EDBD3A] cursor-pointer"
             @click="page = 'Login'">
          Log In to my account
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
export default {
  name: 'LoginPerfilView',
  data() {
    return {
      email: '',
      password: '',
      isHiddenOne: true,
      isHiddenTwo: true,
      pwIcon: false,
      page: 'Login',
    };
  },
  methods: {
    async login() {
      const store = useLoginStore();
      await store.login(
        this.email,
        this.password,
        (destiny) => {
          this.goPage(destiny);
        },
      );
    },
    async signin() {
      // const store = useLoginStore();
      // await store.createPerfil(
      //   this.user,
      //   (destiny) => {
      //     this.goPage(destiny);
      //   },
      // );
    },
    goPage(route) {
      this.$router.push({ name: route });
    },
  },
};
</script>
