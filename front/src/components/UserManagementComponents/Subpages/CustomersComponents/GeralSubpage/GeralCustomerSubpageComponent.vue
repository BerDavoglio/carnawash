<template>
  <div>
    <div class="sub-page">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Clients',
          value: 300,
        }" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Clients',
          value: 15,
        }" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Clients',
          value: 8,
        }" />
      </div>
      <div className="my-8">
        <user-table-component :options="['go', 'python', 'rust', 'javascript']"
                              :default="'go'"
                              @input="alert(displayToKey($event))" />
      </div>
    </div>
  </div>
</template>

<script>
import DataBlockComponent from '../../../DataBlockComponent.vue';
import UserTableComponent from './UserTableComponent.vue';

export default {
  name: 'GeralCustomerSubpageComponent',
  components: { DataBlockComponent, UserTableComponent },
  data() {
    return { };
  },
};
</script>
