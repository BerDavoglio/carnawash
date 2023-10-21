<template>
  <div class="car-block-component"
       className="p-6 shadow-[4px_6px_40px_0px_#00000020]
            border-1 border-[#EBF0ED] mb-4">
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Brand
        <input v-model="this.brand"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Model
        <input v-model="this.model"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Color
        <input v-model="this.color"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Registration Number
        <input v-model="this.number"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <!-- <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold">
          Save Changes
        </div> -->
  </div>
</template>

<script>
export default {
  name: 'CarBlockComponent',
  data() {
    return {
      brand: '',
      model: '',
      color: '',
      number: '',
    };
  },
};
</script>
