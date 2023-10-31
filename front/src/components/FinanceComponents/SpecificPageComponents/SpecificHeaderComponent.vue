<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="flex flex-row mb-[24px]">
      <div className="w-9 h-9 rounded-full bg-amber-400 flex my-auto">
        <div className="m-auto cursor-pointer"
             @click="this.$emit('changeDes', true)">
          <v-icon name="md-arrowback"
                  fill="white" />
        </div>
      </div>
      <div className="m-auto">
        <div className="text-[18px] font-semibold">Wash ID</div>
        <div className="text-[24px] font-medium text-[#045C9C] mt-[16px]">12U83201</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SpecificHeaderComponent',
};
</script>
