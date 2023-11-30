<template>
  <tr>
    <td className="py-[12px]">
      <span className="text-[#045C9C] font-medium mr-2">
        {{ obj.id }}
      </span>
      {{ obj.client }}
    </td>
    <td className="py-[12px]">{{ obj.washer }}</td>
    <td className="py-[12px]">{{ obj.quantity }}</td>
    <td className="py-[12px]">{{ obj.addon }}</td>
    <td className="text-[#045C9C] font-semibold py-[12px]">
      {{ obj.price }}
    </td>
    <td className="py-[12px]">{{ obj.date }}</td>
  </tr>
</template>

<script>
export default {
  name: 'TableItemComponent',
  props: ['obj'],
};
</script>
