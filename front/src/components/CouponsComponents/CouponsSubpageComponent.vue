<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="flex flex-row justify-between">
      <coupons-active-table-component />
      <div className="w-[421px] h-[420px] p-6
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      flex flex-col justify-between">
        <div className="text-left text-[16px] font-semibold">Coupon banner</div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Coupon code
            <div className="ml-auto">
              <div className="w-[368px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="this.coupon_banner.code"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Discount porcentage
            <div className="ml-auto">
              <div className="w-[368px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="this.coupon_banner.discount"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Able/Disable
            <div className="ml-auto">
              <div className="w-[368px] h-[40px] rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
              flex flex-row justify-between">
                <div className="my-auto ml-[16px] text-[14px] font-light text-[#3F3F44]">
                  Coupon active
                </div>
                <VueToggles v-model="this.coupon_banner.is_disabled"
                            :height="28"
                            :width="54"
                            checkedBg="#1C8E33"
                            style="margin-left: auto;
                            margin-top: auto;
                            margin-bottom: auto;
                            margin-right: 10px;" />
              </div>
            </div>
          </div>
        </div>
        <div className="w-[257px] h-[44px]
        px-[16px] py-[8px] font-semibold mx-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
             @click="editBanner(coupon_banner.id)">
          Save changes
        </div>
      </div>
    </div>
    <div>
      <coupons-history-table-component />
    </div>
  </div>
</template>

<script setup>
import { VueToggles } from 'vue-toggles';
import { useCouponsStore } from '../../store/store';
</script>

<script>

import CouponsActiveTableComponent from './CouponsSubpageComponents/ActiveComponents/CouponsActiveTableComponent.vue';
import CouponsHistoryTableComponent from './CouponsSubpageComponents/HistoryComponents/CouponsHistoryTableComponent.vue';

export default {
  name: 'CouponsSubpageComponent',
  components: {
    VueToggles,
    CouponsActiveTableComponent,
    CouponsHistoryTableComponent,
  },
  data() {
    return {
      coupon_banner: [],
    };
  },
  methods: {
    async editBanner(id) {
      const couponStore = useCouponsStore();
      await couponStore.editCouponBanner(id, this.coupon_banner);
    },
  },
  async beforeMount() {
    const couponStore = useCouponsStore();
    await couponStore.requestCouponBanner();

    // eslint-disable-next-line prefer-destructuring
    this.coupon_banner = couponStore.getCouponBanner[0];
  },
};
</script>
