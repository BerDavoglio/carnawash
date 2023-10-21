<template>
  <tr>
    <td className="text-[#3F3F44] font-light py-[24px] text-center"> {{ this.obj.id }} </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.client }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.car }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.date }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.appointment }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.wash }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.rating }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.payment }}</td>
    <td className="py-[24px] text-center">
      <span className="cursor-pointer">
        <v-icon name="bi-plus-circle"
                scale="1.25" />
      </span>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'WashHistoryTableItemComponent',
  props: ['obj'],
};
</script>
