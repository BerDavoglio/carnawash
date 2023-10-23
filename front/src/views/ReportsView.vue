<template>
  <div class="reports-view">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Reports
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
    <div class="filters"
         className="mt-8">
      <div className="p-6 shadow-[4px_6px_30px_0px_#00000020]">
        <div className="flex flex-row justify-between">
          <div className="font-semibold text-[16px]">Revenue filters</div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div @click="isShow = !isShow"
               className="cursor-pointer">
            <v-icon :name="!isShow ? 'md-keyboardarrowdown' : 'md-keyboardarrowup'"
                    scale="1.5" />
          </div>
        </div>
        <div v-if="isShow"
             className="mt-6">
          <div className="flex flex-row justify-between h-[56px]">
            <div className="my-auto">Filter to Date:</div>
            <div className="my-auto flex flex-row">
              <div className="w-[210px]">
                <VueDatePicker v-model="start_date"
                               :enable-time-picker="false" />
              </div>
              <div className="my-auto mx-2">to:</div>
              <div className="w-[210px]">
                <VueDatePicker v-model="end_date"
                               :enable-time-picker="false" />
              </div>
            </div>
            <div className="my-auto">Or search for period:</div>
            <div className="w-[533px]">
              <v-select label="Filter"
                        :items="this.items"
                        variant="outlined" />
            </div>
          </div>
          <div className="mt-4">
            <div className="w-[128px] p-[8px] bg-[#EDBD3A]
        text-white rounded-[8px] cursor-pointer
        font-semibold ml-auto">
              <span className="mr-2">
                <v-icon name="bi-search"
                        scale="1"
                        fill="white" />
              </span>Search
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="graph"
         className="mt-6">
      <bars-graph-component />
    </div>
    <div class="boxs"
         className="mt-6">
      <div className="w-full flex flex-row justify-between">
        <bars-composition-graph-component />
        <pizza-graph-markup-component />
        <pizza-graph-payment-component />
      </div>
    </div>
    <div class="table"
         className="mt-8">
      <report-table-component />
    </div>
    <div class="last-button"
         className="w-full">
      <div className="mt-[28px] font-medium w-fit ml-auto
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
        <v-icon name="bi-download"
                scale="1.25"
                fill="#EDBD3A" /> Export file
      </div>
    </div>
  </div>
</template>

<script>
import BarsGraphComponent from '../components/ReportsComponents/BarsGraphComponent.vue';
import BarsCompositionGraphComponent from '../components/ReportsComponents/BarsCompositionGraphComponent.vue';
import PizzaGraphMarkupComponent from '../components/ReportsComponents/PizzaGraphMarkupComponent.vue';
import PizzaGraphPaymentComponent from '../components/ReportsComponents/PizzaGraphPaymentComponent.vue';
import ReportTableComponent from '../components/ReportsComponents/ReportTableComponent.vue';

export default {
  name: 'ReportsView',
  components: {
    BarsGraphComponent,
    BarsCompositionGraphComponent,
    PizzaGraphMarkupComponent,
    PizzaGraphPaymentComponent,
    ReportTableComponent,
  },
  data() {
    return {
      items: ['Last 7 days', 'Last 30 days', 'Last 6 months', 'Last 12 months'],
      start_date: new Date(),
      end_date: new Date(),
      isShow: true,
    };
  },
};
</script>
