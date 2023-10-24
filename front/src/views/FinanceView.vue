<template>
  <div className="home">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Finance
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
    <div class="geral-finances"
         v-if="isGeral">
      <div className="flex flex-row justify-between my-6">
        <finance-filter-component />
        <finance-automatic-component />
      </div>
      <finance-table-component />
    </div>
    <div class="specify-finances"
         v-if="!isGeral">
      <finance-specific-page-component />
    </div>
  </div>
</template>

<script>
import FinanceFilterComponent from '../components/FinanceComponents/FinanceFilterComponent.vue';
import FinanceAutomaticComponent from '../components/FinanceComponents/FinanceAutomaticComponent.vue';
import FinanceTableComponent from '../components/FinanceComponents/FinanceTableComponent.vue';
import FinanceSpecificPageComponent from '../components/FinanceComponents/FinanceSpecificPageComponent.vue';

export default {
  name: 'FinancesView',
  components: {
    FinanceFilterComponent,
    FinanceAutomaticComponent,
    FinanceTableComponent,
    FinanceSpecificPageComponent,
  },
  data() {
    return {
      search: '',
      isGeral: true,
    };
  },
};
</script>
