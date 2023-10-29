<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[742px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4">
      <div className="text-left font-semibold text-[16px]">
        Register new vehicle size
      </div>
      <div className="my-[24px]">
        <div className="flex flex-row justify-between">
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Car Size
            <div className="ml-auto">
              <div className="w-[324px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="size"
                       className="h-[40px] w-[90%] rounded-lg  px-4 py-6
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
      <div>
        <div className="w-[272px] h-[44px]
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
             @click="confirmNewCar = true;">
          Add new vehicle size
        </div>
      </div>
    </div>
    <v-dialog v-model="confirmNewCar"
              width="auto">
      <confirm-new-carsize-popup @confirmNewCarsize="confirmNewCarsize" />
    </v-dialog>
  </div>
</template>

<script>
import ConfirmNewCarsizePopup from '../../PopupComponents/ServicesPopups/ConfirmNewCarsizePopup.vue';

export default {
  name: 'ServicesNewcarBlockComponent',
  components: { ConfirmNewCarsizePopup },
  data() {
    return {
      size: '',
      price: '',
      additional: '',
      confirmNewCar: false,
    };
  },
  methods: {
    confirmNewCarsize(val) {
      this.confirmNewCar = val;
    },
  },
};
</script>
