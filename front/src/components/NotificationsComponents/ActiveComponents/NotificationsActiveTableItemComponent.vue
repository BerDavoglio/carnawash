<template>
  <tr>
    <td className="w-[400px] text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ this.obj.title }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.destinated }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      Send
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1">
      Resend
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
export default {
  name: 'NotificationsActiveTableItemComponent',
  props: ['obj'],
  data() {
    return {};
  },
};
</script>
