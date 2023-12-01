<template>
  <div>
    <div className="grid grid-cols-2 gap-[51px] mb-[36px]">
      <user-data-component  @showW="(val) => this.$emit('showWasher', val)" />
      <div>
        <photo-data-component />
        <payment-data-component />
      </div>
    </div>
    <div>
      <wash-history-table-component />
    </div>
  </div>
</template>

<script>
import UserDataComponent from './UserDataComponent.vue';
import PhotoDataComponent from './PhotoDataComponent.vue';
import PaymentDataComponent from './PaymentDataComponent.vue';
import WashHistoryTableComponent from './WashHistoryTableComponent.vue';

export default {
  name: 'EditWashersSubpageComponent',
  components: {
    UserDataComponent,
    PhotoDataComponent,
    PaymentDataComponent,
    WashHistoryTableComponent,
  },
};
</script>
