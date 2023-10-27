<template>
  <tr>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ this.obj.name }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.code }}
    </td>
    <td className="text-[#1486CA] text-[16px] pt-[24px] font-semibold text-center">
      {{ this.obj.discount }}%
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.times_used }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      Send code
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      View details
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px]">
      <VueToggles v-model="enable"
                  :height="28"
                  :width="54"
                  checkedBg="#1C8E33"
                  style="margin-left: auto; margin-right: auto;" />
    </td>
    <td className="pt-[24px] text-center">
      <span className="cursor-pointer">
        <v-icon name="md-edit-outlined"
                scale="1.25" />
      </span>
      <span className="cursor-pointer">
        <v-icon name="bi-trash"
                scale="1.25" />
      </span>
    </td>
  </tr>
</template>

<script>
import { VueToggles } from 'vue-toggles';

export default {
  name: 'CouponsActiveTableItemComponent',
  props: ['obj'],
  components: { VueToggles },
  data() {
    return {};
  },
};
</script>
