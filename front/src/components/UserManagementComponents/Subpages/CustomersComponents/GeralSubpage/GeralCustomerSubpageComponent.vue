<template>
  <div>
    <div class="geral-sub-page"
         v-if="!edit">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Clients',
          value: 300,
        }"
        :hasFilter="0" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Clients',
          value: 15,
        }"
        :hasFilter="1" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Clients',
          value: 8,
        }"
        :hasFilter="2" />
      </div>
      <div className="my-8">
        <user-table-component @input="alert(displayToKey($event))"
                              @registerCostumers="registerCostumers"
                              @editCostumers="editCostumers"
                              @showCostumer="(val) => this.edit = val" />
      </div>
    </div>
    <div class="edit-sub-page"
         v-if="edit">
      <edit-customers-subpage-component @showCostumer="(val) => this.edit = val" />
    </div>
    <v-dialog v-model="registerCostumer"
              width="auto">
      <create-client-popup @registerCostumers="registerCostumers" />
    </v-dialog>
    <v-dialog v-model="editCostumer"
              width="auto">
      <edit-client-popup @editCostumers="editCostumers" />
    </v-dialog>
  </div>
</template>

<script>
import DataBlockComponent from '../../../DataBlockComponent.vue';
import UserTableComponent from './UserTableComponent.vue';
import EditCustomersSubpageComponent from '../EditSubpage/EditCustomersSubpageComponent.vue';

import CreateClientPopup from '../../../../PopupComponents/UserManagementPopups/CreateClientPopup.vue';
import EditClientPopup from '../../../../PopupComponents/UserManagementPopups/EditClientPopup.vue';

export default {
  name: 'GeralCustomerSubpageComponent',
  components: {
    DataBlockComponent,
    UserTableComponent,
    EditCustomersSubpageComponent,
    CreateClientPopup,
    EditClientPopup,
  },
  data() {
    return {
      edit: false,
      registerCostumer: false,
      editCostumer: false,
    };
  },
  methods: {
    registerCostumers(val) {
      this.registerCostumer = val;
    },
    editCostumers(val) {
      this.editCostumer = val;
    },
  },
};
</script>
