<template>
  <div className="h-[240px] w-[260px] rounded-lg
        shadow-[4px_6px_30px_0px_#00000020]
        p-8 justify-between
        grid grid-rols-2">
    <div className="grid grid-cols-2 justify-between content-between">
      <v-icon :name="this.icon"
              scale="1.666666"
              fill="black" />
      <div className="text-[#0F83C9] text-[28px]">
        {{ this.value }}
      </div>
    </div>
    <div className="text-start mt-auto
              text-[18px] font-semibold">
      {{ this.text }}
    </div>
  </div>
</template>

<script >
export default {
  name: 'BoxInfoComponent',
  props: ['value', 'icon', 'text'],
};
</script>
