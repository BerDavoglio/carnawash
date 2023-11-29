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
          <div v-for="i in listHistory" v-bind:key="i">
            <coupons-history-table-item-component :obj="i" />
          </div>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { useCouponsStore, useOrdersStore } from '../../../../store/store';
</script>

<script>
import CouponsHistoryTableItemComponent from './CouponsHistoryTableItemComponent.vue';

export default {
  name: 'CouponsHistoryTableComponent',
  components: { CouponsHistoryTableItemComponent },
  data() {
    return {
      listHistory: [],
    };
  },
  async beforeMount() {
    const couponStore = useCouponsStore();
    await couponStore.requestCoupons();
    await couponStore.requestCouponsHistory();

    const orderStore = useOrdersStore();
    await orderStore.requestWashes();

    // eslint-disable-next-line prefer-destructuring
    this.listAux = couponStore.getCouponsHistory;
    this.listAux.forEach((obj) => {
      const sched = orderStore.getWashesRequests.find((item) => item.id === obj.schedule_id);
      const coup = couponStore.getCoupons.find((item) => item.id === obj.coupon_id);
      const aux = {
        coupon: coup.name,
        user: sched.user_id,
        total: obj.total,
        saved: obj.total * coup.discount,
        spent: obj.total - (obj.total * coup.discount),
        date: obj.created_at,
      };
      this.listHistory.push(aux);
    });
  },
};
</script>
