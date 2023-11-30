<template>
  <tr>
    <td className="text-[#3F3F44] font-light py-[24px] text-center"> {{ this.obj.id }} </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.cars_list_id }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.washer_id }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">
      {{ this.obj.selected_date }}
    </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.status }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.wash }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.rate }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">
      {{ this.obj.payment_schedule_id }}
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
