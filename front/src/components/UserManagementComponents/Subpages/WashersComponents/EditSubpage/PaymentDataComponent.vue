<template>
  <div class="payment-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="font-semibold text-[16px] text-left">
        Payment Data
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
            BSB
            <input v-model="bsb"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Account Name
            <input v-model="name"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Account Number
            <input v-model="number"
                   className="h-[16px] w-full rounded-lg  px-4 py-6 mb-4
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <!-- <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold">
          Save Changes
        </div> -->
      <div className="text-right font-medium text-[16px] text-[#EDBD3A] cursor-pointer">
        <v-icon name="md-edit-outlined"
                fill="#EDBD3A" />Change Password
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'UserDataComponent',
  data() {
    return {
      bsb: '',
      name: '',
      number: '',
    };
  },
  methods: {},
};
</script>
