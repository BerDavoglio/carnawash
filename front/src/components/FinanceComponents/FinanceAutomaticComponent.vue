<template>
  <div>
    <div className="w-[636px] h-[271px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4
    flex flex-col justify-between rounded-lg">
      <div className="">
        <div className="flex flex-row justify-between">
          <div className="text-[16px] font-semibold text-left">
            Schedule automatic payment
          </div>
          <div className="ml-auto">
            <VueToggles v-model="enable"
                        :height="28"
                        :width="54"
                        checkedBg="#1C8E33"
                        style="margin-left: auto; margin-right: auto;" />
          </div>
        </div>
        <div className="mt-6 grid grid-cols-4">
          <div className="col-span-3">
            <div className="text-left text-[16px] font-normal mb-2">Every</div>
            <div className="w-[415px] h-[44px]">
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
                        variant="outlined"
                        density="compact" />
            </div>
          </div>
          <div>
            <div className="text-left text-[16px] font-normal mb-2">At</div>
            <div className="w-[150px] h-[44px]">
              <div className="my-auto">
                <VueDatePicker v-model="date"
                               time-picker />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-6">
        <div className="w-fit px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer my-auto">
          <span className="mr-2">
            <v-icon name="bi-search"
                    scale="1.25"
                    fill="black" />
          </span>Confirm payment schedule
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { VueToggles } from 'vue-toggles';

export default {
  name: 'FinanceAutomaticComponent',
  components: { VueToggles },
  data() {
    return {
      date: new Date(),
    };
  },
};
</script>
