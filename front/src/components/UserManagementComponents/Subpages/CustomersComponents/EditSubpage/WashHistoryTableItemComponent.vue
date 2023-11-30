<template>
  <tr>
    <td className="text-[#3F3F44] font-light py-[24px] text-center"> {{ obj.id }} </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.cars_list_id }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.washer_id }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">
      {{ obj.selected_date }}
    </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.status }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.wash }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ obj.rate }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">
      {{ obj.payment_schedule_id }}
    </td>
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
