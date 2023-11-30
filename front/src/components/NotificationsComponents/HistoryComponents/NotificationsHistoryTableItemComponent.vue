<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <tr>
    <td className="w-[400px] text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ obj.title }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.user_type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.name }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1"
        @click="this.$emit('notificationResend', [true, obj]);">
      Resend
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ obj.date }}
    </td>
  </tr>
</template>

<script>
export default {
  name: 'NotificationsHistoryTableItemComponent',
  props: ['obj'],
  data() {
    return {};
  },
};
</script>
