<template>
  <tr>
    <td className="w-[400px] text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ obj.coupon }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.user }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ formatPrice(obj.total) }}
    </td>
    <td className="text-[#1486CA] text-[16px] pt-[24px] font-semibold text-center">
      {{ formatPrice(obj.saved) }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ formatPrice(obj.spent) }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.date }}
    </td>
  </tr>
</template>

<script>
export default {
  name: 'CouponsHistoryTableItemComponent',
  props: ['obj'],
  data() {
    return {};
  },
  methods: {
    formatPrice(value) {
      const val = (value / 1).toFixed(2).replace('.', ',');
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    },
  },
};
</script>
