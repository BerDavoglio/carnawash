<template>
  <tr className="mb-4">
    <td className="text-[#3F3F44] text-[14px] font-light text-left">
      <div v-for="i in this.obj.type" v-bind:key="i">
        <div className="mb-2 font-normal text-[16px]">
          {{ i }}
        </div>
      </div>
    </td>
    <td className="text-[#3F3F44] text-[16px] font-semibold text-center">
      {{ formatPrice(this.obj.type_price) }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light text-center">
      <div v-for="i in this.obj.add" v-bind:key="i">
        <div className="mb-2 font-normal text-[16px]">
          {{ i }}
        </div>
      </div>
    </td>
    <td className="text-[#3F3F44] text-[16px] font-semibold text-center">
      {{ formatPrice(this.obj.add_price) }}
    </td>
    <td className="text-[#3F3F44] text-[16px] font-semibold text-center">
      {{ this.obj.code }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light text-center">
      {{ this.obj.quantity }}x
    </td>
    <td className="text-[#1486CA] text-[16px] font-semibold text-right">
      {{ formatPrice(this.obj.total) }}
    </td>
  </tr>
</template>

<script>
export default {
  name: 'SpecificTableItemComponent',
  props: ['obj'],
  methods: {
    formatPrice(value) {
      const val = (value / 1).toFixed(2).replace('.', ',');
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    },
  },
};
</script>
