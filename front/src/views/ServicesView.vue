<!-- eslint-disable -->
<template>
  <div class="reports-view">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Services
        </div>
        <div className="ml-auto">
          <div className="w-fit h-fit
          rounded-[10px] border-2
               border-solid border-[#C9C9C9]
               pl-3">
            <v-icon name="bi-search"
                    scale="1.25"
                    fill="black" />
            <input type="text"
                   v-model="search"
                   placeholder="Search"
                   aria-label="search"
                   className="rounded-[10px] px-2 py-3 w-[471px]">
          </div>
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div class="sub-page"
         className="grid grid-cols-2 mt-[32px]">
      <div class="col1">
        <graph-services-geral-component :values="values_1"
                                        :title="'Additional service data total'" />
        <services-markup-block-component />
        <services-newcar-block-component />
        <services-activescar-block-component />
      </div>
      <div class="col2">
        <graph-services-geral-component :values="values_2"
                                        :title="'Vehicle size data total'" />
        <services-newwash-block-component />
        <services-activeswash-block-component />
        <services-newadditional-block-component />
        <services-activesadditional-block-component />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLoginStore, useServicesStore } from '../store/store';
</script>

<script>
import GraphServicesGeralComponent from '../components/ServicesComponents/GraphServicesGeralComponent.vue';
import ServicesMarkupBlockComponent from '../components/ServicesComponents/LeftColumn/ServicesMarkupBlockComponent.vue';
import ServicesNewcarBlockComponent from '../components/ServicesComponents/LeftColumn/ServicesNewcarBlockComponent.vue';
import ServicesActivescarBlockComponent from '../components/ServicesComponents/LeftColumn/ServicesActivescarBlockComponent.vue';
import ServicesNewwashBlockComponent from '../components/ServicesComponents/RightColumn/ServicesNewwashBlockComponent.vue';
import ServicesActiveswashBlockComponent from '../components/ServicesComponents/RightColumn/ServicesActiveswashBlockComponent.vue';
import ServicesNewadditionalBlockComponent from '../components/ServicesComponents/RightColumn/ServicesNewadditionalBlockComponent.vue';
import ServicesActivesadditionalBlockComponent from '../components/ServicesComponents/RightColumn/ServicesActivesadditionalBlockComponent.vue';

export default {
  name: 'ServicesView',
  components: {
    GraphServicesGeralComponent,
    ServicesMarkupBlockComponent,
    ServicesNewcarBlockComponent,
    ServicesActivescarBlockComponent,
    ServicesNewwashBlockComponent,
    ServicesActiveswashBlockComponent,
    ServicesNewadditionalBlockComponent,
    ServicesActivesadditionalBlockComponent,
  },
  data() {
    return {
      listAddLabel: [],
      listAddValues: [],
      listSizeLabel: [],
      listSizeValues: [],
      values_1: {
        labels: this.listAddLabel,
        datasets: [
          {
            label: this.listAddLabel,
            backgroundColor: ['#1486CA', '#EDBD3A', '#1C8E33', '#E5333E'],
            data: this.listAddValues,
          },
        ],
      },
      values_2: {
        labels: this.listSizeLabel,
        datasets: [
          {
            label: this.listSizeLabel,
            backgroundColor: ['#1486CA', '#EDBD3A', '#1C8E33', '#E5333E'],
            data: this.listSizeValues,
          },
        ],
      },
    };
  },
  async beforeMount() {
    const loginStore = useLoginStore();
    if (loginStore.getToken === '') {
      this.$router.push({ name: 'login' });
    }
    const servicesStore = useServicesStore();
    await servicesStore.requestAdditional();
    await servicesStore.requestMarkup();
    await servicesStore.requestRegular();
    await servicesStore.requestSize();

    await servicesStore.requestAdditionalData();
    const addData = servicesStore.getAdditionalData;
    addData.forEach((obj) => {
      this.listAddLabel.push(obj.title);
      this.listAddValues.push(obj.times_used);
    });

    await servicesStore.requestSizeData();
    const sizeData = servicesStore.getSizeData;
    sizeData.forEach((obj) => {
      this.listSizeLabel.push(obj.title);
      this.listSizeValues.push(obj.times_used);
    });
  },
};
</script>
