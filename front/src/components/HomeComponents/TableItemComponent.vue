<template>
  <tr>
    <td className="py-[12px]">
      <span className="text-[#045C9C] font-medium mr-2">
        {{ this.obj.id }}
      </span>
      {{ this.obj.client }}
    </td>
    <td className="py-[12px]">{{ this.obj.washer }}</td>
    <td className="py-[12px]">{{ this.obj.quantity }}</td>
    <td className="py-[12px]">{{ this.obj.addon }}</td>
    <td className="text-[#045C9C] font-semibold py-[12px]">
      {{ this.obj.price }}
    </td>
    <td className="py-[12px]">{{ this.obj.date }}</td>
  </tr>
</template>

<script>
export default {
  name: 'TableItemComponent',
  props: ['obj'],
};
</script>
