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
        <input v-model="name"
               placeholder="Full Name"
               className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
               bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
        <input v-model="phone"
               placeholder="Telephone"
               className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
               bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
        <input v-model="email"
               placeholder="E-mail"
               className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
               bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold">
        Save Changes
      </div>
    </div>
  </div>
</template>

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
};
</script>
