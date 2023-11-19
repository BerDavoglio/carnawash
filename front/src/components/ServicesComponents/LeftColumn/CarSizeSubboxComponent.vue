<template>
  <div className="flex flex-row justify-between">
    <div className="mt-[24px] w-[90%]">
      <div className="flex flex-row justify-between">
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Car Size
          <div className="ml-auto">
            <div className="w-[286px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="size"
                     className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Size Price
          <div className="ml-auto">
            <div className="w-[286px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="price"
                     className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Additional Information
        <div className="ml-auto">
          <div className="w-full h-fit rounded-lg
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="additional"
                   className="h-[40px] w-[95%] rounded-lg  px-4 py-6
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <v-icon name="md-edit-outlined"
                    scale="1.5"
                    fill="black" />
          </div>
        </div>
      </div>
    </div>
    <div className="my-auto cursor-pointer">
      <v-icon name="bi-trash"
            scale="1.25"
            fill="black" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'CarsizeSubboxComponent',
  data() {
    return {
      size: '',
      price: '',
      additional: '',
    };
  },
};
</script>
