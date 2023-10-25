<template>
  <div>
    <div class="filter">
      <orders-filter-component />
    </div>
    <div class="block-graph">
      <orders-block-graph-component />
    </div>
    <div class="tab">
      <orders-table-component />
    </div>
  </div>
</template>

<script>
import OrdersFilterComponent from './OrdersFilterComponent.vue';
import OrdersBlockGraphComponent from './OrdersBlockGraphComponent.vue';
import OrdersTableComponent from './OrdersTableComponent.vue';

export default {
  name: 'GeralOrdersSubpageComponent',
  components: {
    OrdersFilterComponent,
    OrdersBlockGraphComponent,
    OrdersTableComponent,
  },
  data() {
    return {};
  },
};
</script>
