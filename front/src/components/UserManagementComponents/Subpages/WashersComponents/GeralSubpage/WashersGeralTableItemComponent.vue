<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <tr>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.name }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.email }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.phone }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.address }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.licence }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center
    cursor-pointer underline underline-offset-1"
    @click="this.$emit('showW', [true, this.obj.id]);">
      View History
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.rating }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center">
      {{ this.obj.quiz }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px]">
      <VueToggles v-model="contract"
                  :height="28"
                  :width="54"
                  checkedBg="#1C8E33"
                  style="margin-left: auto; margin-right: auto;" />
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px]">
      <VueToggles v-model="enable"
                  :height="28"
                  :width="54"
                  checkedBg="#1C8E33"
                  style="margin-left: auto; margin-right: auto;" />
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light py-[24px] text-center cursor-pointer">
      <span className="cursor-pointer">
        <v-icon name="bi-download" />
      </span>
    </td>
    <td className="py-[24px] text-center">
      <span className="cursor-pointer"
            @click="editWs(this.obj)">
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
  name: 'UserTableItemComponent',
  props: ['obj'],
  components: { VueToggles },
  data() {
    return {
      contract: true,
      enable: true,
    };
  },
  methods: {
    editWs(obj) {
      this.$emit('editWs', [true, obj]);
    },
  },
};
</script>
