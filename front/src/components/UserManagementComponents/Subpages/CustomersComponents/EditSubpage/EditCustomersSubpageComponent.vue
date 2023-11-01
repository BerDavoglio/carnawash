<template>
  <div>
    <div className="grid grid-cols-2 gap-[51px] mb-[36px]">
      <user-data-component @showC="(val) => this.$emit('showCostumer', val)" />
      <car-data-component />
    </div>
    <div>
      <wash-history-table-component />
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
  data() {
    return {
      name: '',
      email: '',
      phone: '',
      address: '',
      type: '',
      password: '',
      isHiddenOne: true,
    };
  },
  methods: {
    changePass() {
      this.isHiddenOne = !this.isHiddenOne;
    },
  },
};
</script>
