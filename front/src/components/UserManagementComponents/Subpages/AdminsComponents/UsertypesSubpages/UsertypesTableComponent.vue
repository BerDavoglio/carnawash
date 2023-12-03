<template>
  <div>
    <div className="w-full h-[650px] mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-center">User Type</th>
            <th className="pb-[12px] text-center">Registered Users</th>
            <th className="pb-[12px] text-center">Enable</th>
            <th className="pb-[12px] text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <usertypes-table-item-component @editU="(val) => { this.$emit('editUsertype', val); }"
                                          @deleteU="(val) => { this.$emit('deleteUsertype', val); }"
                                          :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import UsertypesTableItemComponent from './UsertypesTableItemComponent.vue';

export default {
  name: 'GeralAdminTableComponent',
  components: { UsertypesTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        type: 'Client A',
        users: [
          'User 1',
          'User 2',
        ],
      },
      items: ['Alfabetical', 'Date'],
    };
  },
};
</script>
