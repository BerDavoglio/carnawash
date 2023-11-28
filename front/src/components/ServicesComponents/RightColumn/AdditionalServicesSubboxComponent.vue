<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="flex flex-row justify-between"
         v-for="additional in listAdditional"
         v-bind:key="additional">
      <div className="mt-[24px] w-[90%]">
        <div className="flex flex-row justify-between">
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Service type
            <div className="ml-auto">
              <div className="w-[286px] h-fit rounded-lg
                bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="additional.title"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                        bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Additional Price
            <div className="ml-auto">
              <div className="w-[286px] h-fit rounded-lg
                bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="additional.price"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                        bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="my-auto cursor-pointer"
           @click="deleteOne(additional.id)">
        <v-icon name="bi-trash"
                scale="1.25"
                fill="black" />
      </div>
    </div>
    <div>
      <div className="w-[272px] h-[44px] mt-6
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
            @click="editAll()">
        Confirm Changes
      </div>
    </div>
  </div>
</template>

<script setup>
import { useServicesStore } from '../../../store/store';
</script>

<script>
export default {
  name: 'AdditionalservicesSubboxComponent',
  data() {
    return {
      listAdditional: [],
    };
  },
  methods: {
    async deleteOne(id) {
      const servicesStore = useServicesStore();

      await servicesStore.deleteAdditional(id);
    },
    async editAll() {
      const servicesStore = useServicesStore();

      this.listAdditional.forEach(async (obj) => {
        await servicesStore.editAdditional(obj.id, obj);
      });
    },
  },
  async beforeMount() {
    const servicesStore = useServicesStore();
    this.listAdditional = servicesStore.getAdditional;
  },
};
</script>
