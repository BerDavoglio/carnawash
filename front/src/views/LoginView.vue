<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="login-view">
    <div className="mx-auto my-36">
      <div className="max-w-[32rem] bg-blue-200 m-auto rounded-xl p-4 shadow-2xl">
        <div className="text-bold text-[3rem] m-4">
          {{ isLogin ? 'Login' : 'Cadastrar' }}
        </div>
        <div v-if="isLogin">
          <input v-model="email"
                 placeholder="E-mail"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
          <input v-model="password"
                 placeholder="Senha"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
        </div>
        <div v-else>
          <input v-model="user.name"
                 placeholder="Nome"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
          <input v-model="user.email"
                 placeholder="E-mail"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
          <input v-model="user.address"
                 placeholder="Endereço"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
          <input v-model="user.cellphone"
                 placeholder="Telefone"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
          <div className="w-[90%] m-auto">
            <VueDatePicker v-model="user.birth"
                           format="dd/MM/yyyy"
                           :enable-time-picker="false"
                           input-class-name="h-10 rounded-lg" />
          </div>
          <input v-model="user.cpf"
                 placeholder="CPF"
                 className="w-[90%] h-10 rounded-lg p-2 my-2">
          <input v-model="user.password"
                 placeholder="Senha"
                 className="w-[90%] h-10 rounded-lg p-2 mb-2">
        </div>
        <div className="grid grid-cols-2 mx-10 my-5">
          <div className="mx-auto w-24 p-3
            rounded-xl text-white
            cursor-pointer bg-green-500 hover:bg-green-700"
               @click="isLogin ? login() : signin()">
            {{ isLogin ? 'Entrar' : 'Cadastrar' }}
          </div>
          <div v-if="isLogin"
               className="mx-auto w-24 p-3
            rounded-xl text-white
            cursor-pointer bg-yellow-500 hover:bg-yellow-700"
               @click="isLogin = !isLogin">
            Registrar
          </div>
          <div v-else
               className="mx-auto w-24 p-3
            rounded-xl text-white
            cursor-pointer bg-yellow-500 hover:bg-yellow-700"
               @click="isLogin = !isLogin">
            Login
          </div>
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
      user: {
        name: '',
        email: '',
        address: '',
        cellphone: '',
        birth: '',
        cpf: '',
        password: '',
      },
      isLogin: true,
    };
  },
  methods: {
    async login() {
      const store = useLoginStore();
      await store.requestLogin(
        this.email,
        this.password,
        (destiny) => {
          this.goPage(destiny);
        },
      );
    },
    async signin() {
      const store = useLoginStore();
      await store.createPerfil(
        this.user,
        (destiny) => {
          this.goPage(destiny);
        },
      );
    },
    goPage(route) {
      this.$router.push({ name: route });
    },
  },
};
</script>

<style>
.dp__theme_light {
  --dp-background-color: #ffffff;
  --dp-text-color: #000000;
  --dp-hover-color: #f3f3f3;
  --dp-hover-text-color: #212121;
  --dp-hover-icon-color: #959595;
  --dp-primary-color: #81c0ff;
  --dp-primary-text-color: #959595;
  --dp-secondary-color: #c0c4cc;
  --dp-border-color: #ddd;
  --dp-menu-border-color: #ddd;
  --dp-border-color-hover: #aaaeb7;
  --dp-disabled-color: #f6f6f6;
  --dp-scroll-bar-background: #f3f3f3;
  --dp-scroll-bar-color: #959595;
  --dp-success-color: #76d275;
  --dp-success-color-disabled: #a3d9b1;
  --dp-icon-color: #959595;
  --dp-danger-color: #ff6f60;
  --dp-highlight-color: rgba(25, 118, 210, 0.1);
}
</style>
