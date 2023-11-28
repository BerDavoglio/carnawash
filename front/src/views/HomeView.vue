<template>
  <div className="home">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Dashboard
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
    <div class="blocks">
      <div className="flex flex-row
      w-full mt-4 justify-between">
        <box-info-component value="$168.20"
                            icon="ri-money-dollar-circle-line"
                            text="Total Revenue" />
        <box-info-component value="$75,30"
                            icon="co-dollar"
                            text="Total Profit" />
        <box-info-component value="5.325"
                            icon=""
                            text="Users" />
        <box-info-component value="5.325"
                            icon=""
                            text="Washers" />
        <last-box-info-component />
      </div>
    </div>
    <div class="graphs"
         className="flex flex-row justify-between mt-4">
      <graph-bars-component />
      <graph-pizza-component />
      <graph-stars-component />
    </div>
    <div class="last-washes">
      <last-washes-table-component />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
import BoxInfoComponent from '../components/HomeComponents/BoxInfoComponent.vue';
import LastBoxInfoComponent from '../components/HomeComponents/LastBoxInfoComponent.vue';
import GraphBarsComponent from '../components/HomeComponents/GraphBarsComponent.vue';
import GraphPizzaComponent from '../components/HomeComponents/GraphPizzaComponent.vue';
import GraphStarsComponent from '../components/HomeComponents/GraphStarsComponent.vue';
import LastWashesTableComponent from '../components/HomeComponents/LastWashesTableComponent.vue';

export default {
  name: 'HomeView',
  components: {
    BoxInfoComponent,
    LastBoxInfoComponent,
    GraphBarsComponent,
    GraphPizzaComponent,
    GraphStarsComponent,
    LastWashesTableComponent,
  },
  data() {
    return {
      search: '',
    };
  },
  beforeMount() {
    const store = useLoginStore();
    if (store.getToken === '') {
      this.$router.push({ name: 'login' });
    }
  },
};
</script>
