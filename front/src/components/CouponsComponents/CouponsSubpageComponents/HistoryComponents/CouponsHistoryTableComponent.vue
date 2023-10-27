<template>
  <div>
    <div className="w-[1500px] h-[406px] my-6
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[35px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Coupons History
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] w-[400px] text-left">Coupon used</th>
            <th className="pb-[12px] text-center">User</th>
            <th className="pb-[12px] text-center">Total amount</th>
            <th className="pb-[12px] text-center">Amount saved</th>
            <th className="pb-[12px] text-center">Amount spent</th>
            <th className="pb-[12px] text-center">Time / Date</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
          <coupons-history-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import CouponsHistoryTableItemComponent from './CouponsHistoryTableItemComponent.vue';

export default {
  name: 'CouponsHistoryTableComponent',
  components: { CouponsHistoryTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        coupon: '10OFF',
        user: 'User A',
        total: 160,
        saved: 16,
        spent: 144,
        date: '25-08-2023 07:55',
      },
    };
  },
};
</script>
