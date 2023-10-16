<template>
  <div class="table-component">
    <div className="w-full h-80 mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div className="text-[16px] font-semibold text-left mb-[16px]">
        Last Washes
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px]">Client</th>
            <th className="pb-[12px]">Washer</th>
            <th className="pb-[12px]">Quantity</th>
            <th className="pb-[12px]">Additional Services</th>
            <th className="pb-[12px]">Amount Payed</th>
            <th className="pb-[12px]">Date/Hour</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
          <table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import TableItemComponent from './TableItemComponent.vue';

export default {
  name: 'LastWashesTableComponent',
  components: { TableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        client: 'James Antony',
        washer: 'Anthony Phillips',
        quantity: 1,
        addon: 'Heavy Dirty',
        price: 95.00,
        date: '27-07-2023 16:21',
      },
    };
  },
};
</script>
