<!-- eslint-disable -->
<template>
  <div>
    <div className="h-[406px] w-[277px]
    shadow-[4px_6px_30px_0px_#00000020] my-6
    p-6 flex flex-col justify-between">
      <div class="title"
           className="flex flex-row justify-between">
        <div className="text-[16px] font-semibold">
          Program notification
        </div>
        <v-icon name="md-edit-outlined"
                scale="1.25"
                fill="black" />
      </div>
      <div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-[16px]">
          Notification title
          <div className="ml-auto">
            <div className="w-[230px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <input v-model="not_title"
                     className="h-[40px] w-[85%] rounded-lg px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
              <v-icon name="bi-search"
                      scale="1.5"
                      fill="black" />
            </div>
          </div>
        </div>
        <div className="text-[16px] text-left font-normal text-[#3F3F44] mb-[8px]">
          Period to use
        </div>
        <div className="w-[150px] h-[44px] mb-[8px]">
          <div className="my-auto">
            <VueDatePicker v-model="start_date" />
          </div>
        </div>
        <div className="w-[150px] h-[44px]">
          <div className="my-auto">
            <VueDatePicker v-model="end_date" />
          </div>
        </div>
      </div>
      <div>
        <div className="w-[231px] h-[44px]
        px-[16px] py-[8px] font-semibold mr-4
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
          Program notification
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NotificationsProgramBoxComponent',
};
</script>
