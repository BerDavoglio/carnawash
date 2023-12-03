<template>
  <tr>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-left">
      {{ obj[0] }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ obj[1] }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px]">
      <VueToggles v-model="enable"
                  :height="28"
                  :width="54"
                  checkedBg="#1C8E33"
                  style="margin-left: auto; margin-right: auto;" />
    </td>
  </tr>
</template>

<script>
import { VueToggles } from 'vue-toggles';

export default {
  name: 'UsertypesTableItemComponent',
  components: { VueToggles },
  props: ['obj'],
  data() {
    return {
      enable: true,
    };
  },
};
</script>
