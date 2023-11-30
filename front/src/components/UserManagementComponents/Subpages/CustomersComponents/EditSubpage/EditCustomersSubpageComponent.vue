<template>
  <div>
    <div className="grid grid-cols-2 gap-[51px] mb-[36px]">
      <user-data-component :pre_data="pre_data"
                           @showC="(val) => this.$emit('showCostumer', val)" />
      <car-data-component :pre_data="pre_data" />
    </div>
    <div>
      <wash-history-table-component :pre_data="pre_data" />
    </div>
  </div>
</template>

<script>
import UserDataComponent from './UserDataComponent.vue';
import CarDataComponent from './CarDataComponent.vue';
import WashHistoryTableComponent from './WashHistoryTableComponent.vue';

export default {
  name: 'EditCustomersSubpageComponent',
  components: { UserDataComponent, CarDataComponent, WashHistoryTableComponent },
  props: ['pre_data'],
  data() {
    return {};
  },
  methods: {
    changePass() {
      this.isHiddenOne = !this.isHiddenOne;
    },
  },
};
</script>
