<template>
  <div class="table-component">
    <div className="w-full h-[580px] mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[56px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Wash History
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-[230px] text-right mb-[16px] mr-[40px]">
            <v-select label="Filter"
                      :items="items"
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
            <th className="pb-[12px] text-center">Wash ID</th>
            <th className="pb-[12px] text-center">Client</th>
            <th className="pb-[12px] text-center">Car</th>
            <th className="pb-[12px] text-center">Date</th>
            <th className="pb-[12px] text-center">Appointment Status</th>
            <th className="pb-[12px] text-center">Wash Status</th>
            <th className="pb-[12px] text-center">Rating</th>
            <th className="pb-[12px] text-center">Payment Status</th>
            <th className="pb-[12px] text-center">Transactions Details</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
          <wash-history-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import WashHistoryTableItemComponent from './WashHistoryTableItemComponent.vue';

export default {
  name: 'WashHistoryTableComponent',
  components: { WashHistoryTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1234,
        client: 'Client A',
        car: 'Car A',
        date: 'dd/mm/yyyy 00:00',
        appointment: 'To Confirm',
        wash: 'Not Started',
        rating: '-',
        payment: '-',
      },
      items: ['Alfabetical', 'Date'],
    };
  },
};
</script>
