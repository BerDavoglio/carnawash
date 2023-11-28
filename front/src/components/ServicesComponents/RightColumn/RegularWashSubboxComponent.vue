<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="flex flex-row justify-between"
         v-for="regular in listRegular"
         v-bind:key="regular">
      <div className="mt-[24px] w-[90%]">
        <div className="flex flex-row justify-between">
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Car Size
            <div className="ml-auto">
              <div className="w-[286px] h-fit rounded-lg
                bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="regular.car_size"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                        bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Subscription Price
            <div className="ml-auto">
              <div className="w-[286px] h-fit rounded-lg
                bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="regular.price"
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
          Additional services included
          <div className="ml-auto">
            <div className="w-full h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="regular.additional_services"
                     className="h-[40px] w-[95%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="md-edit-outlined"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
      </div>
      <div className="my-auto cursor-pointer"
           @click="deleteOne(regular.id)">
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
  name: 'RegularwashSubboxComponent',
  data() {
    return {
      listRegular: [],
    };
  },
  methods: {
    async deleteOne(id) {
      const servicesStore = useServicesStore();

      await servicesStore.deleteRegular(id);
    },
    async editAll() {
      const servicesStore = useServicesStore();

      this.listRegular.forEach(async (obj) => {
        await servicesStore.editRegular(obj.id, obj);
      });
    },
  },
  async beforeMount() {
    const servicesStore = useServicesStore();
    this.listRegular = servicesStore.getRegular;
  },
};
</script>
