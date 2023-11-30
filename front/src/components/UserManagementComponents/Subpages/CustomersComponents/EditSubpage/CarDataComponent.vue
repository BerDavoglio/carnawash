<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="car-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="font-semibold text-[16px] text-left">
        Registered Cars
      </div>
      <div className="flex flex-row justify-end">
        <div className="text-[#EDBD3A] font-medium text-[16px]
      cursor-pointer text-right"
             @click="createCar()">
          <v-icon name="md-edit-outlined"
                  scale="1.25"
                  fill="#EDBD3A" />
          Create
        </div>
      </div>
    </div>
    <div className="scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <car-block-component v-for="i in listCars"
                           v-bind:key="i"
                           :obj="i"
                           :carObj="i" />
    </div>
  </div>
</template>

<script setup>
import { useClientStore } from '../../../../../store/store';
</script>

<script>
import CarBlockComponent from './CarBlockComponent.vue';

export default {
  name: 'CarDataComponent',
  components: { CarBlockComponent },
  props: ['pre_data'],
  data() {
    return {
      listCars: [],
    };
  },
  methods: {
    async createCar() {
      const clientStore = useClientStore();
      await clientStore.createClientCar(this.pre_data, {
        brand: '',
        model: '',
        color: '',
        plate: '',
        car_size_id: 1,
      });
    },
  },
  async beforeMount() {
    const clientStore = useClientStore();
    await clientStore.requestClientWash(this.pre_data);

    this.listWash = clientStore.getClientWash;
  },
};
</script>
