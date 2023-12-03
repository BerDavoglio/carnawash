<template>
  <div>
    <div className="w-full max-h-[684px] mt-4 rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-left">Users allowed</th>
            <th className="pb-[12px] text-center">Enable User</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <usertypes-allowed-table-item-component v-for="i in list"
                                                v-bind:key="i"
                                                :obj="i" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import UsertypesAllowedTableItemComponent from './UsertypesAllowedTableItemComponent.vue';

export default {
  name: 'UsertypesAllowedTableComponent',
  components: { UsertypesAllowedTableItemComponent },
  data() {
    return {
      list: [
        'Admin A',
        'Admin B',
        'Admin C',
        'Admin D',
        'Admin E',
      ],
    };
  },
};
</script>
