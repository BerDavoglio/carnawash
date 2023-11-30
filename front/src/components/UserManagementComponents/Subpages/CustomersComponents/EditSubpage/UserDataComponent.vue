<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="user-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="flex flex-row">
        <div className="w-9 h-9 rounded-full bg-amber-400 flex my-auto">
          <div className="m-auto cursor-pointer"
               @click="this.$emit('showC', [false, null])">
            <v-icon name="md-arrowback"
                    fill="white" />
          </div>
        </div>
        <div className="font-semibold text-[16px] text-left my-auto ml-4">
          User Data
        </div>
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
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Complete Name
            <input v-model="userObj.name"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            E-mail
            <input v-model="userObj.email"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Telephone
            <input v-model="userObj.phone"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Address
            <input v-model="userObj.address"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            User Type
            <input v-model="userObj.role"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Password
            <div className="ml-auto">
              <div className="w-full h-fit
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
            mb-5">
                <input v-model="pass"
                       :type="isHiddenOne ? 'password' : 'text'"
                       aria-label="Password"
                       className="w-[95%] px-[10px] py-2">
                <v-icon name="bi-eye-slash"
                        scale="1.25"
                        fill="black"
                        @click="changePass()" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold"
           @click="editUser()">
        Save Changes
      </div>
      <!-- <div className="text-right font-medium text-[16px] text-[#EDBD3A] cursor-pointer">
        <v-icon name="md-edit-outlined"
                fill="#EDBD3A" />Change Password
      </div> -->
    </div>
  </div>
</template>

<script setup>
import { useClientStore } from '../../../../../store/store';
</script>

<script>
export default {
  name: 'UserDataComponent',
  props: ['pre_data'],
  data() {
    return {
      userObj: {},
      pass: '',
      isHiddenOne: true,
      edit: false,
    };
  },
  methods: {
    changePass() {
      this.isHiddenOne = !this.isHiddenOne;
    },
    async editUser() {
      const clientStore = useClientStore();
      await clientStore.updateClient(this.pre_data, {
        name: this.userObj.name,
        email: this.userObj.email,
        address: this.userObj.address,
        phone: this.userObj.phone,
        role: this.userObj.role,
      });
      if (this.pass !== '') {
        await clientStore.updateClient(this.pre_data, {
          password: this.pass,
        });
      }
    },
  },
  async beforeMount() {
    const clientStore = useClientStore();
    await clientStore.requestClients();

    const aux = clientStore.getClients.find(
      (item) => item.id === this.pre_data,
    );
    this.userObj = aux;
  },
};
</script>
