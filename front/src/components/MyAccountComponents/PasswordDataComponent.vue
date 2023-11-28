<template>
  <div class="password-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="font-semibold text-[16px] text-left">
        Password
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
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Confirm Password
            <div className="ml-auto">
              <div className="w-full h-fit
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
            mb-5">
                <input v-model="confirmPass"
                       :type="isHiddenTwo ? 'password' : 'text'"
                       aria-label="Confirm Password"
                       className="w-[95%] px-[10px] py-2">
                <v-icon name="bi-eye-slash"
                        scale="1.25"
                        fill="black"
                        @click="changeConfirmPass()" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold">
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
  name: 'PasswordDataComponent',
  data() {
    return {
      password: '',
      confirmPass: '',
      isHiddenOne: true,
      isHiddenTwo: true,
    };
  },
  methods: {
    changePass() {
      this.isHiddenOne = !this.isHiddenOne;
    },
    changeConfirmPass() {
      this.isHiddenTwo = !this.isHiddenTwo;
    },
    async update() {
      const store = useLoginStore();
      if (this.password === this.confirmPass) {
        await store.updatePerfil({
          password: this.password,
        });
      }
    },
  },
};
</script>
