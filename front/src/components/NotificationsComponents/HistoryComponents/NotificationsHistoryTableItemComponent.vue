<template>
  <tr>
    <td className="w-[400px] text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ this.obj.title }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.user_type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.name }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      Resend
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.date }}
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
