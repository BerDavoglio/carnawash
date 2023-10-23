<template>
  <div>
    <div className="w-[742px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4">
      <div className="text-left font-semibold text-[16px]">
        Register new additional service
      </div>
      <div className="my-[24px] flex flex-row justify-between">
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Service type
          <div className="ml-auto">
            <div className="w-[324px] h-fit rounded-lg
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="type"
                     className="h-[40px] w-[90%] rounded-lg  px-4 py-6
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Additional price
          <div className="ml-auto">
            <div className="w-[324px] h-fit rounded-lg
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="price"
                     className="h-[40px] w-[90%] rounded-lg  px-4 py-6
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
      </div>
      <div>
        <div className="w-[272px] h-[44px]
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
          Confirm new additional service
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ServicesNewadditionalBlockComponent',
  data() {
    return {
      type: '',
      price: '',
    };
  },
};
</script>
