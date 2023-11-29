<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
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
            cursor-pointer"
               @click="newCoup = true;">
            <v-icon name="bi-plus-circle"
                    scale="1.25" />New coupon
          </div>
          <div className="w-[257px] h-[44px]
        px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
               @click="sendNoti = true;">
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
          <coupons-active-table-item-component v-for="i in listActive"
                                               v-bind:key="i"
                                               :obj="i"
                                               @editPopCoupon="editPopCoupon" />
        </tbody>
      </table>
    </div>
    <v-dialog v-model="sendNoti"
              width="auto">
      <register-new-notification-popup @newNotification="newNotification" />
    </v-dialog>
    <v-dialog v-model="newCoup"
              width="auto">
      <register-new-coupon-popup :pre_data="editCoup"
                                 @newCoupon="newCoupon" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useCouponsStore, useClientStore } from '../../../../store/store';
</script>

<script>
import CouponsActiveTableItemComponent from './CouponsActiveTableItemComponent.vue';

import RegisterNewNotificationPopup from '../../../PopupComponents/CouponsPopups/RegisterNewNotificationPopup.vue';
import RegisterNewCouponPopup from '../../../PopupComponents/CouponsPopups/RegisterNewCouponPopup.vue';

export default {
  name: 'NotificationsActiveTableComponent',
  components: {
    CouponsActiveTableItemComponent,
    RegisterNewNotificationPopup,
    RegisterNewCouponPopup,
  },
  data() {
    return {
      listActive: [],
      sendNoti: false,
      newCoup: false,
      editCoup: null,
    };
  },
  methods: {
    newNotification(val) {
      this.sendNoti = val;
    },
    newCoupon(val) {
      this.newCoup = val;
      this.editCoup = null;
    },
    editPopCoupon(val) {
      this.newCoup = true;
      this.editCoup = val;
    },
    async editCoupon(id, obj) {
      const couponStore = useCouponsStore();
      await couponStore.editCoupon(id, obj);
    },
    async deleteCoupon(id) {
      const couponStore = useCouponsStore();
      await couponStore.deleteCoupon(id);
    },
  },
  async beforeMount() {
    const couponStore = useCouponsStore();
    await couponStore.requestCoupons();

    const clientStore = useClientStore();
    await clientStore.requestClients();

    // eslint-disable-next-line prefer-destructuring
    this.listActive = couponStore.getCoupons;
  },
};
</script>
