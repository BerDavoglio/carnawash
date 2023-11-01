<template>
  <div class="data-block-component">
    <div className="w-[387px] h-[200px] p-8
    grid grid-cols-2
    shadow-[4px_6px_30px_0px_#00000020]">
      <div className="w-full text-left flex flex-col justify-between">
        <v-icon :name="obj.icon"
                scale="2"
                fill="black" />
        <div className="text-[18px] font-semibold">
          {{ obj.text }}
        </div>
      </div>
      <div className="w-full text-center flex flex-col justify-between">
        <div className="text-right text-[#107EC4] text-[30px] font-medium">
          {{ obj.value }}
        </div>
        <div v-show="hasFilter == 1"
             className="w-[98px] text-[12px] px-[16px] py-[8px]
             rounded-[24px] bg-[#F4F6F7] ml-auto">
          Last 7 days
        </div>
        <div v-show="hasFilter == 2"
             className="w-[165px] text-[12px] px-[16px] py-[8px]
             rounded-[24px] bg-[#F4F6F7] ml-auto">
          Inactives for more than 30 days
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DataBlockComponent',
  props: ['obj', 'hasFilter'],
};
</script>
