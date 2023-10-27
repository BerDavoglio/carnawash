<template>
  <div>
    <div className="w-[1063px] h-[420px]
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[44px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Active coupons
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-[257px] h-[44px] mr-4
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
            <v-icon name="bi-plus-circle"
                    scale="1.25" />New coupon
          </div>
          <div className="w-[257px] h-[44px]
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
            <v-icon name="bi-plus-circle"
                    scale="1.25" />New notification
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-left">Coupon name</th>
            <th className="pb-[12px] text-center">Coupon code</th>
            <th className="pb-[12px] text-center">Discount</th>
            <th className="pb-[12px] text-center">Times Used</th>
            <th className="pb-[12px] w-[150px] text-center">Send to especific user/users</th>
            <th className="pb-[12px] text-center">Details</th>
            <th className="pb-[12px] text-center">Able/Disable</th>
            <th className="pb-[12px] text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
          <coupons-active-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import CouponsActiveTableItemComponent from './CouponsActiveTableItemComponent.vue';

export default {
  name: 'NotificationsActiveTableComponent',
  components: { CouponsActiveTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        name: 'Home Coming',
        code: 'CLIENT20',
        discount: 20,
        times_used: 350,
      },
    };
  },
};
</script>
