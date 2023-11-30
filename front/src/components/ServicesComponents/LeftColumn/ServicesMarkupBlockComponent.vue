<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[742px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4">
      <div className="text-left font-semibold text-[16px]">
        Markup
      </div>
      <div className="my-[24px] flex flex-row justify-between">
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Washer porcentage
          <div className="ml-auto">
            <div className="w-[324px] h-fit rounded-lg
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="washer_porcentage"
                     className="h-[40px] w-[90%] rounded-lg  px-4 py-6
                    bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Carnawash porcentage
          <div className="ml-auto">
            <div className="w-[324px] h-fit rounded-lg
            bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="carnawash_porcentage"
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
            cursor-pointer"
             @click="confirmMarkups[0] = true;">
          Confirm Markup
        </div>
      </div>
    </div>
    <v-dialog v-model="confirmMarkups[0]"
              width="auto">
      <confirm-markup-change-popup @confirmMarkupChange="confirmMarkupChange" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useServicesStore } from '../../../store/store';
</script>

<script>
import ConfirmMarkupChangePopup from '../../PopupComponents/ServicesPopups/ConfirmMarkupChangePopup.vue';

export default {
  name: 'ServicesMarkupBlockComponent',
  components: { ConfirmMarkupChangePopup },
  data() {
    return {
      carnawash_porcentage: 0,
      washer_porcentage: 0,
      confirmMarkups: [false, false],
    };
  },
  methods: {
    confirmMarkupChange(val) {
      // eslint-disable-next-line prefer-destructuring
      this.confirmMarkups = val;
      if (val[1]) {
        const store = useServicesStore();
        store.editMarkup(
          store.getMarkup[0].id,
          this.washer_porcentage,
          this.carnawash_porcentage,
        );
      }
    },
  },
  async beforeMount() {
    const store = useServicesStore();
    await store.requestMarkup();

    this.carnawash_porcentage = store.getMarkup[0].carnawash_porcentage;
    this.washer_porcentage = store.getMarkup[0].washer_porcentage;
  },
};
</script>
