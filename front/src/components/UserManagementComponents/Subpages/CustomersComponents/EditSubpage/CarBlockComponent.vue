<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="car-block-component"
       className="p-6 shadow-[4px_6px_40px_0px_#00000020]
            border-1 border-[#EBF0ED] mb-4">
    <div className="mb-4">
      <div className="flex flex-row justify-end">
        <div className="text-[#EDBD3A] font-medium text-[16px]
      cursor-pointer text-right mr-4"
             @click="deleteCar(this.carObjAux.id);">
          <v-icon name="bi-trash"
                  scale="1.25"
                  fill="#EDBD3A" />
          Delete
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Brand
        <input v-model="this.carObjAux.brand"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Model
        <input v-model="this.carObjAux.model"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Color
        <input v-model="this.carObjAux.color"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="mb-4">
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Registration Number
        <input v-model="this.carObjAux.number"
               className="h-[16px] w-full rounded-lg mt-2 px-4 py-6
                         bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
      </div>
    </div>
    <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
        text-black rounded-[8px] cursor-pointer
        m-auto font-semibold"
         @click="updateCar(this.carObjAux.id);">
      Save Changes
    </div>
  </div>
</template>

<script setup>
import { useClientStore } from '../../../../../store/store';
</script>

<script>
export default {
  name: 'CarBlockComponent',
  props: ['carObj'],
  data() {
    return {
      carObjAux: {},
    };
  },
  methods: {
    async updateCar(id) {
      const clientStore = useClientStore();
      await clientStore.updateClientCar(this.pre_data, id, this.carObjAux);
    },
    async deleteCar(id) {
      const clientStore = useClientStore();
      await clientStore.deleteClientCar(this.pre_data, id);
    },
  },
  beforeMount() {
    this.carObjAux = this.carObj;
  },
};
</script>
