<!-- eslint-disable vuejs-accessibility/form-control-has-label -->
<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[742px] h-[480px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          {{ pre_data === null ? 'Register new coupon' : 'Coupon details' }}
        </div>
        <div className="flex flex-row">
          <div v-show="pre_data !== null"
               className="cursor-pointer mr-2"
               @click="deleteCoupon(pre_data.id)">
            <v-icon name="bi-trash"
                    scale="1.25" />
          </div>
          <div className="cursor-pointer"
               @click="this.$emit('newCoupon', false)">
            <v-icon name="io-close"
                    scale="1.25" />
          </div>
        </div>
      </div>
      <div>
        <div className="flex flex-row justify-between">
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Name
            <div className="ml-auto">
              <div className="w-[338px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="new_coupon.name"
                       className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Coupon Code
            <div className="ml-auto">
              <div className="w-[338px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="new_coupon.code"
                       className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              </div>
            </div>
          </div>
        </div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Discount
          <div className="ml-auto">
            <div className="w-[685px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="new_coupon.discount"
                     className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            </div>
          </div>
        </div>
        <div className="flex flex-row justify-between">
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Uses allowed
            <div className="ml-auto">
              <div className="w-[338px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="new_coupon.uses_allowed"
                       className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Unlimited uses
            <div className="ml-auto">
              <div className="w-[330px] h-[48px] rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
              flex flex-row justify-between">
                <div className="my-auto ml-[16px] text-[14px] font-light text-[#3F3F44]">
                  Allowed
                </div>
                <VueToggles v-model="new_coupon.is_unlimited"
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
        <div className="my-auto">
          <div className="my-auto">Filter to Date:</div>
          <div className="flex flex-row justify-between h-[56px]">
            <div className="my-auto flex flex-row">
              <div className="w-[150px]">
                <VueDatePicker v-model="start_date"
                               :enable-time-picker="false" />
              </div>
              <div className="my-auto mx-2">to:</div>
              <div className="w-[150px]">
                <VueDatePicker v-model="end_date"
                               :enable-time-picker="false" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
          text-black rounded-[8px] cursor-pointer
          mx-auto font-semibold text-center"
           @click="saveNotification()">
        Save coupon
      </div>
    </div>
  </div>
</template>

<script setup>
import { VueToggles } from 'vue-toggles';
import {
  useCouponsStore,
} from '../../../store/store';
</script>

<script>
export default {
  name: 'RegisterNewNotificationPopup',
  components: { VueToggles },
  props: ['pre_data'],
  data() {
    return {
      new_coupon: {
        name: '',
        code: '',
        discount: 0,
        uses_allowed: 0,
        is_unlimited: false,
      },
    };
  },
  methods: {
    async deleteCoupon(id) {
      const store = useCouponsStore();
      await store.deleteCoupon(id);
    },
    async saveNotification() {
      const couponStore = useCouponsStore();

      if (this.pre_data === null) {
        await couponStore.createCoupon({
          name: this.new_coupon.name,
          code: this.new_coupon.code,
          discount: this.new_coupon.discount,
          uses_allowed: this.new_coupon.uses_allowed,
          is_unlimited: this.new_coupon.is_unlimited,
        }).then(() => {
          this.$emit('newCoupon', false);
        });
      } else {
        await couponStore.editCoupon(this.pre_data.id, {
          name: this.new_coupon.name,
          code: this.new_coupon.code,
          discount: this.new_coupon.discount,
          uses_allowed: this.new_coupon.uses_allowed,
          is_unlimited: this.new_coupon.is_unlimited,
        }).then(() => {
          this.$emit('newCoupon', false);
        });
      }
    },
  },
  beforeMount() {
    if (this.pre_data !== null) {
      this.new_coupon = this.pre_data;
    }
  },
};
</script>
