<template>
  <tr>
    <td className="text-[#3F3F44] font-light py-[24px] text-center"> {{ obj.id }} </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.client }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.car }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.date }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.appointment }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.wash }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.rating }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.payment }}</td>
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
