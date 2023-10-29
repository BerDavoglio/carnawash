<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <tr>
    <td className="text-[#3F3F44] font-light py-[24px] text-center"> {{ this.obj.name }} </td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.email }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.phone }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center">{{ this.obj.address }}</td>
    <td className="text-[#3F3F44] font-light py-[24px] text-center
    cursor-pointer underline underline-offset-1">
      View History
    </td>
    <td className="py-[24px] text-center">
      <span className="cursor-pointer"
            @click="editCs">
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
  name: 'UserTableItemComponent',
  props: ['obj'],
  methods: {
    editCs() {
      this.$emit('editCs', true);
    },
  },
};
</script>
