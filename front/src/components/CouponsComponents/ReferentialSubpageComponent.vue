<template>
  <div>
    <div className="flex flex-row justify-between">
      <referential-left-component />
      <referential-right-component />
    </div>
    <div>
      <referential-history-table-component />
    </div>
  </div>
</template>

<script>
import ReferentialHistoryTableComponent from './ReferentialSubpageComponents/HistoryComponents/ReferentialHistoryTableComponent.vue';
import ReferentialLeftComponent from './ReferentialSubpageComponents/ReferentialLeftComponent.vue';
import ReferentialRightComponent from './ReferentialSubpageComponents/ReferentialRightComponent.vue';

export default {
  name: 'ReferentialSubpageComponent',
  components: {
    ReferentialHistoryTableComponent,
    ReferentialLeftComponent,
    ReferentialRightComponent,
  },
};
</script>
