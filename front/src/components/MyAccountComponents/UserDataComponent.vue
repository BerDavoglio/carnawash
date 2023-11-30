<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="user-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="font-semibold text-[16px] text-left">
        User Data
      </div>
      <div className="text-[#EDBD3A] font-medium text-[16px]
      cursor-pointer text-right">
        <v-icon name="md-edit-outlined"
                scale="1.25"
                fill="#EDBD3A" />
        Edit
      </div>
    </div>
    <div class="block"
         className="p-6 shadow-[4px_6px_40px_0px_#00000020]
    border-1 border-[#EBF0ED]">
      <div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Complete Name
          <input v-model="name"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
        </div>
      </div>
      <div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          E-mail
          <input v-model="email"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
        </div>
      </div>
      <div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Telephone
          <input v-model="phone"
                 className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold"
           @click="update()">
        Save Changes
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../../store/store';
</script>

<script>
export default {
  name: 'UserDataComponent',
  data() {
    return {
      name: '',
      phone: '',
      email: '',
    };
  },
  methods: {
    async update() {
      const store = useLoginStore();
      await store.updatePerfil({
        name: this.name,
        email: this.email,
        phone: this.phone,
      });
    },
  },
  beforeMount() {
    const store = useLoginStore();
    this.name = store.getPerfil.name;
    this.phone = store.getPerfil.phone;
    this.email = store.getPerfil.email;
  },
};
</script>
