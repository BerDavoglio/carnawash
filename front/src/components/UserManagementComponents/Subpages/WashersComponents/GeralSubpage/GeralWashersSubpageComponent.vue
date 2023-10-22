<template>
  <div>
    <div class="geral-sub-page"
         v-if="!edit">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Washers',
          value: 300,
        }" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Washers',
          value: 15,
        }" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Washers',
          value: 8,
        }" />
      </div>
      <div className="my-8">
        <washers-geral-table-component :options="['go', 'python', 'rust', 'javascript']"
                                       :default="'go'"
                                       @input="alert(displayToKey($event))" />
      </div>
    </div>
    <div class="edit-sub-page"
         v-if="edit">
      <edit-washers-subpage-component />
    </div>
  </div>
</template>

<script>
import DataBlockComponent from '../../../DataBlockComponent.vue';
import WashersGeralTableComponent from './WashersGeralTableComponent.vue';
import EditWashersSubpageComponent from '../EditSubpage/EditWashersSubpageComponent.vue';

export default {
  name: 'GeralWashersSubpageComponent',
  components: { DataBlockComponent, WashersGeralTableComponent, EditWashersSubpageComponent },
  data() {
    return {
      edit: false,
    };
  },
};
</script>
