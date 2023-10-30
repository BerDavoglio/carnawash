<!-- eslint-disable -->
<template>
  <div>
    <div className="w-[1500px] p-6 shadow-[4px_6px_30px_0px_#00000020]
           rounded-lg mt-4 flex flex-col justify-between h-fit">
      <div>
        <div className="flex flex-row justify-between">
          <div className="font-semibold text-[16px]">Period Filter</div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div @click="isShow = !isShow"
               className="cursor-pointer">
            <v-icon :name="!isShow ? 'md-keyboardarrowdown' : 'md-keyboardarrowup'"
                    scale="1.5" />
          </div>
        </div>
        <div className="mt-6"
             v-show="isShow">
          <div className="flex flex-row justify-between items-center">
            <div className="flex flex-row items-center">
              <div className="font-normal text-[16px]">
                Search Period:
              </div>
              <div className="w-[150px] h-[44px] ml-2">
                <VueDatePicker v-model="start_date"
                               :enable-time-picker="false" />
              </div>
              <div className="w-[150px] h-[44px] ml-2">
                <VueDatePicker v-model="start_date"
                               :enable-time-picker="false"
                               style="height = 44px;" />
              </div>
            </div>
            <div className="flex flex-row justify-between items-center">
              <div className="font-normal text-[16px]">
                Search for:
              </div>
              <div className="w-[296px] h-[44px] ml-2">
                <v-select label="Status"
                          :items="[
                            'Assigned',
                            'Not Assigned',
                            'To Confirm',
                            'Confirmed',
                            'Cancelled',
                          ]"
                          variant="outlined"
                          density="compact" />
              </div>
            </div>
            <div className="flex flex-row justify-between items-center">
              <div className="font-normal text-[16px]">
                Or search time frame:
              </div>
              <div className="w-[336px] h-[44px] ml-2">
                <v-select label="Time Frame"
                          :items="[
                            'Last 7 days',
                            'Last 15 days',
                            'Last Month',
                            'Last 3 months',
                            'Last 6 months',
                          ]"
                          variant="outlined"
                          density="compact" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-6"
           v-show="isShow">
        <div className="w-fit px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer my-auto">
          <span className="mr-2">
            <v-icon name="bi-search"
                    scale="1.25"
                    fill="black" />
          </span>Filter
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'OrdersFilterComponent',
  data() {
    return {
      isShow: true,
    };
  },
};
</script>
