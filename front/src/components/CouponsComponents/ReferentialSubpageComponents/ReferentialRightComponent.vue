<template>
  <div>
    <div className="w-[742px] h-[420px] p-6
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      flex flex-col justify-between">
      <div className="text-[16px] font-semibold text-left">
        Coupon new account - Receiver
      </div>
      <div className="flex flex-row justify-between">
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Coupon code
            <div className="ml-auto">
              <div className="w-[330px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="code"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Users Allowed
            <div className="ml-auto">
              <div className="w-[330px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="code"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Expiration date
            <div className="w-[330px] h-[44px]">
              <v-select label="Day"
                        :items="[
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                          'Saturday',
                          'Sunday',
                        ]"
                        variant="solo"
                        density="compact"
                        bg-color="#F8F8F8" />
            </div>
          </div>
        </div>
        <div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
            Discount percentage
            <div className="ml-auto">
              <div className="w-[330px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <input v-model="code"
                       className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
                <v-icon name="md-edit-outlined"
                        scale="1.5"
                        fill="black" />
              </div>
            </div>
          </div>
          <div className="text-left text-[16px] font-normal text-[#3F3F44]">
            Unlimited uses
            <div className="ml-auto">
              <div className="w-[330px] h-[40px] rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
              flex flex-row justify-between">
                <div className="my-auto ml-[16px] text-[14px] font-light text-[#3F3F44]">
                  Allowed
                </div>
                <VueToggles v-model="enable"
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
      </div>
      <div className="w-[241px] h-[44px]
      px-[16px] py-[8px] font-semibold mx-auto
          rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
          cursor-pointer">
        Save coupons
      </div>
    </div>
  </div>
</template>

<script>
import { VueToggles } from 'vue-toggles';

export default {
  name: 'ReferentialRightComponent',
  components: {
    VueToggles,
  },
};
</script>
