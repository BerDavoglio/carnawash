<!-- eslint-disable vuejs-accessibility/form-control-has-label -->
<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<!-- eslint-disable vue/valid-v-on -->
<template>
  <tr>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-left">
      <input type="checkbox"
             v-model="this.select"
             className="mr-2 w-[17px] h-[17px]" />
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.id }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.client }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.washer }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.date }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.status }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.time }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj.rating }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      <div className="w-[144px] px-[16px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer my-auto"
           @click="this.$emit('confirmPayment', true)">
        Send Payment
      </div>
    </td>
    <td className="py-[24px] text-center max-w-[80px]">
      <span className="cursor-pointer"
      @click="this.$emit('changeDes', false)">
        <v-icon name="bi-plus-circle"
                scale="1.25" />
      </span>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'FinanceTableItemComponent',
  props: ['obj', 'isAll'],
  components: {},
  data() {
    return {
      selected: false,
      contract: true,
      enable: true,
    };
  },
};
</script>
