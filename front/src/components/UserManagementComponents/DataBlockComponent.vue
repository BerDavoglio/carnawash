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
      <div className="text-right text-[#107EC4] text-[30px] font-medium">
        {{ obj.value }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DataBlockComponent',
  props: ['obj'],
};
</script>
