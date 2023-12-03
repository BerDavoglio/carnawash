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
            <th className="pb-[12px] text-left">Page</th>
            <th className="pb-[12px] text-center">Section</th>
            <th className="pb-[12px] text-center">Enable Access</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <usertypes-pages-table-item-component v-for="i in list"
                                                v-bind:key="i"
                                                :obj="i" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import UsertypesPagesTableItemComponent from './UsertypesPagesTableItemComponent.vue';

export default {
  name: 'UsertypesPagesTableComponent',
  components: { UsertypesPagesTableItemComponent },
  data() {
    return {
      list: [
        ['Dashboard', '-'],
        ['Orders and Appontments', 'Appontments'],
        ['Orders and Appontments', 'Appontments Story'],
        ['Page A', 'Section A'],
        ['Page A', 'Section B'],
        ['Page A', 'Section C'],
        ['Page A', 'Section D'],
        ['Page B', '-'],
        ['Page C', 'Section A'],
        ['Page C', 'Section B'],
        ['Page C', 'Section C'],
        ['Page C', 'Section D'],
      ],
    };
  },
};
</script>
