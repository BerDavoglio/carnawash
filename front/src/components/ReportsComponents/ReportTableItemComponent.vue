<template>
  <tr>
    <td className="py-[12px] text-[#3F3F44] font-light">
      {{ this.obj.date }}
    </td>
    <td className="py-[12px] text-[#3F3F44] text-center font-medium">
      {{ this.obj.washes }}
    </td>
    <td className="py-[12px] text-[#1486CA] text-center font-medium">
      {{ formatPrice(this.obj.profit) }}
    </td>
    <td className="py-[12px] text-[#3F3F44] text-center font-medium">
      {{ formatPrice(this.obj.payment) }}
    </td>
    <td className="py-[12px] text-[#3F3F44] text-center font-medium">
      {{ this.obj.markup }}
    </td>
  </tr>
</template>

<script>
export default {
  name: 'ReportTableItemComponent',
  props: ['obj'],
  methods: {
    formatPrice(value) {
      const val = (value / 1).toFixed(2).replace('.', ',');
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    },
  },
};
</script>
