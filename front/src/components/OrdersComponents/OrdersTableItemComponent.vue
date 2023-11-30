<template>
  <tr>
    <td className="text-[#3F3F44] font-light pt-[24px] text-left"> {{ this.obj.id }} </td>
    <td className="text-[#3F3F44] font-light pt-[24px] text-center">{{ this.obj.client }}</td>
    <td className="text-[#1486CA] text-[16px] pt-[24px] font-semibold text-center">
      {{ formatPrice(this.obj.price) }}
    </td>
    <td className="text-[#3F3F44] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      View Details
    </td>
    <td className="text-[#3F3F44] font-light pt-[24px] text-center w-[90px]">
      {{ this.obj.date }}
    </td>
    <td className="text-[#3F3F44] font-light pt-[24px] text-center
    h-[44px] w-[160px]">
      <v-select label="Washers"
                :items="items"
                variant="outlined"
                density="compact"
                style="height: 44px;" />
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      <div className="w-[110px] px-[16px] py-[8px] font-semibold m-auto
      rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
      cursor-pointer my-auto mx-4">
        Confirm
      </div>
    </td>
    <td className="text-[#3F3F44] font-light pt-[24px] text-center">{{ this.obj.acceptance }}</td>
    <td className="pt-[24px] text-center max-w-[110px]">
      <span className="cursor-pointer">
        <v-icon name="bi-plus-circle"
                scale="1.25" />
      </span>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'OrdersTableItemComponent',
  props: ['obj'],
  data() {
    return {
      items: ['Washer A', 'Washer B', 'Washer C', 'Washer D'],
    };
  },
  methods: {
    formatPrice(value) {
      const val = (value / 1).toFixed(2).replace('.', ',');
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    },
  },
};
</script>
