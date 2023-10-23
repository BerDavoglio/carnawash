<template>
  <div>
    <div className="w-full h-80 mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Reports
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-[230px] mt-[10px] text-right mb-[16px] mr-[40px]">
            <v-select label="Filter"
                      :items="this.items"
                      variant="outlined" />
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px]">Date</th>
            <th className="pb-[12px] text-center">Washes Total</th>
            <th className="pb-[12px] text-center">Profit Total</th>
            <th className="pb-[12px] text-center">Payments</th>
            <th className="pb-[12px] text-center">Markup (%)</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
          <report-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import ReportTableItemComponent from './ReportTableItemComponent.vue';

export default {
  name: 'ReportTableComponent',
  components: { ReportTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        date: '27-07-2023',
        washes: 203,
        profit: 4321,
        payment: 450,
        markup: 37,
      },
      items: ['Alfabetical', 'Date'],
    };
  },
};
</script>
