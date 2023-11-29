<template>
  <div>
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Coupons and Promotions
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div class="submenu"
         className="mt-[21px]
         mb-6">
      <div className="grid grid-cols-2">
        <div className="mr-auto">
          <div class="menu"
               className="flex flex-row
               text-[16px] font-normal">
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (this.isCoupons ? 'font-semibold' : '')]"
                 @click="changePage(true)">
              Coupons
            </div>
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['cursor-pointer '
              + (!this.isCoupons ? 'font-semibold' : '')]"
                 @click="changePage(false)">
              Referential coupons
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="subpage">
      <coupons-subpage-component v-if="isCoupons" />
      <referential-subpage-component v-if="!isCoupons" />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore, useCouponsStore } from '../store/store';
</script>

<script>
import CouponsSubpageComponent from '../components/CouponsComponents/CouponsSubpageComponent.vue';
import ReferentialSubpageComponent from '../components/CouponsComponents/ReferentialSubpageComponent.vue';

export default {
  name: 'CouponsView',
  components: {
    CouponsSubpageComponent,
    ReferentialSubpageComponent,
  },
  data() {
    return {
      isCoupons: true,
    };
  },
  methods: {
    changePage(val) {
      this.isCoupons = val;
    },
  },
  async beforeMount() {
    const loginStore = useLoginStore();
    if (loginStore.getToken === '') {
      this.$router.push({ name: 'login' });
    }

    const couponStore = useCouponsStore();
    await couponStore.requestCoupons();
    await couponStore.requestCouponBanner();
    await couponStore.requestCouponsHistory();
  },
};
</script>
