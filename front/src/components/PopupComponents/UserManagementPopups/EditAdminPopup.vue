<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[572px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Edit admin
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('editAdmin', false)">
          <v-icon name="io-close" />
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Name
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="new_admin.name"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        E-mail
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="new_admin.email"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Telephone
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="new_admin.phone"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Password
          <div className="ml-auto">
            <div className="w-full h-fit
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="new_admin.pass"
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
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="this.$emit('editAdmin', false)">
        Save Changes
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'EditAdminPopup',
  data() {
    return {
      isHiddenOne: true,
      new_admin: {
        name: '',
        email: '',
        phone: '',
        pass: '',
      },
    };
  },
  methods: {
    changePass() {
      this.isHiddenOne = !this.isHiddenOne;
    },
  },
};
</script>
