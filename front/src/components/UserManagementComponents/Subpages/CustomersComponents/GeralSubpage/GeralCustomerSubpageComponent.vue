<template>
  <div>
    <div class="geral-sub-page"
         v-if="!edit[0]">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Clients',
          value: all,
        }"
                              :hasFilter="0" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Clients',
          value: newClients,
        }"
                              :hasFilter="1" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Clients',
          value: inactive,
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
         v-if="edit[0]">
      <edit-customers-subpage-component @showCostumer="(val) => this.edit = val"
                                        :pre_data="this.edit[1]" />
    </div>
    <v-dialog v-model="registerCostumer"
              width="auto">
      <create-client-popup @registerCostumers="registerCostumers" />
    </v-dialog>
    <v-dialog v-model="editCostumer[0]"
              width="auto">
      <edit-client-popup @editCostumers="editCostumers"
                         :pre_data="editCostumer[1]" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useClientStore } from '../../../../../store/store';
</script>

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
      edit: [false, null],
      registerCostumer: false,
      editCostumer: [false, null],
      all: 0,
      newClients: 0,
      inactive: 0,
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
  async beforeMount() {
    const clientStore = useClientStore();
    await clientStore.requestClients();
    await clientStore.requestNewClients();

    this.all = clientStore.getClients.length;
    this.newClients = clientStore.getNewClients;
    this.inactive = clientStore.getInactiveClients;
  },
};
</script>
