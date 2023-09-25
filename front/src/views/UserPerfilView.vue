<!-- eslint-disable max-len -->
<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="user-perfil-view">
    <div className="m-auto">
      <div>Usuário: <strong className="text-xl">{{ user.name }}</strong></div>
      <div className="my-4">
        <div>Você tem</div>
        <div className="text-2xl"><strong>{{ useLoginStore().getPerfil.points }}</strong></div>
        <div>pontos</div>
      </div>
      <div className="max-w-[30rem] m-auto">
        <div class="w-full bg-gray-200 rounded-full h-4 dark:bg-gray-700">
          <div class="bg-blue-200 h-4 rounded-full"
               :style="['width: '
                 + (useLoginStore().getPerfil.points / useConquestStore().getList[useConquestStore().getList.length - 1].points) * 100
                 + '%']">
            <div className="text-[0.7rem]">
              {{ useLoginStore().getPerfil.points }}
            </div>
          </div>
        </div>
      </div>
      <div className="my-4">
        <div className="w-80 py-6 mx-auto
          rounded-xl shadow-lg shadow-black/30">
          <div className="font-bold text-xl">
            Lista de Conquistas:
          </div>
          <div className="my-4"
           v-for="(obj, index) in useConquestStore().getList"
               v-bind:key="obj">
            Conquista Nº {{ index + 1 }}:
            <br />
            <strong :className="(obj.points < useLoginStore().getPerfil.points
              ? 'line-through'
              : '')">
              {{ obj.description }}
            </strong>
            <br />
            <strong :className="(obj.points < useLoginStore().getPerfil.points
              ? 'line-through'
              : '')">{{ obj.points }}</strong>
          </div>
        </div>
      </div>
      <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
      <div @click="showTip = !showTip"
           className="
        underline cursor-pointer
        text-blue-600 hover:text-blue-800">
        Como conseguir pontos?
      </div>
      <div v-if="showTip">
        <div className="w-80 bg-blue-200 mx-auto
          rounded-xl shadow-lg shadow-black/30
          p-4">
          <div className="text-lg font-bold">Para conseguir mais pontos, é necessário:</div>
          <li>Marcar Consultas periodicamente</li>
          <li>Comprar com os Cupons da Clínica</li>
        </div>
      </div>
      <!-- <div className="my-4">
        <div>Próxima Consulta:</div>
        <div className="w-72 h-24 bg-blue-200 mx-auto
          flex place-items-center
          rounded-xl shadow-lg shadow-black/30">
          <div className="w-full">Dia: <br /><strong>{{ consulta.date }}</strong></div>
          <div className="w-full">Doutor(a): <br /><strong>{{ consulta.dr }}</strong></div>
        </div>
      </div> -->
      <div className="mx-auto my-10">
        <div className="text-bold text-xl">Informações do Usuário:</div>
        <div className="max-w-[32rem] bg-blue-200 m-auto rounded-xl p-4">
          <input v-model="user.name"
                 placeholder="Nome"
                 className="w-[90%] h-8 rounded-lg p-2 mb-2">
          <input v-model="user.email"
                 placeholder="E-mail"
                 className="w-[90%] h-8 rounded-lg p-2 mb-2">
          <input v-model="user.address"
                 placeholder="Endereço"
                 className="w-[90%] h-8 rounded-lg p-2 mb-2">
          <input v-model="user.birth"
                 placeholder="Aniversário"
                 className="w-[90%] h-8 rounded-lg p-2 mb-2">
          <input v-model="user.cpf"
                 placeholder="CPF"
                 className="w-[90%] h-8 rounded-lg p-2 mb-2">
          <div className="mx-auto w-36 p-1
            rounded-xl text-white
            cursor-pointer bg-green-500 hover:bg-green-700"
               @click="useLoginStore().updatePerfil(user)">
            Salvar
          </div>
        </div>
      </div>
      <div className="w-48 p-2 bg-red-200 my-10 mx-auto
      rounded-xl cursor-pointer shadow-xl"
           @click="useLoginStore().logout(this.$router.push({ name: 'login' }))">
        Logout
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLoginStore, useConquestStore } from '../store/store';
</script>

<script>
export default {
  name: 'UserPerfilView',
  data() {
    return {
      user: {
        name: useLoginStore().getPerfil.name,
        email: useLoginStore().getPerfil.email,
        birth: useLoginStore().getPerfil.birth,
        address: useLoginStore().getPerfil.address,
        cpf: useLoginStore().getPerfil.cpf,
      },
      showTip: false,
      value: 30,
    };
  },
  async beforeCreate() {
    await useLoginStore().requestPerfil();
    await useConquestStore().requestConquest();

    if (useLoginStore().getToken === '') {
      this.$router.push({ name: 'login' });
    }
  },
};
</script>
