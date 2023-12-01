<template>
  <div>
    <div class="geral-sub-page"
         v-if="!this.editPage">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Washers',
          value: all,
        }"
                              :hasFilter="0" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Washers',
          value: newWasher,
        }"
                              :hasFilter="1" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Washers',
          value: inactive,
        }"
                              :hasFilter="2" />
      </div>
      <div className="my-8">
        <washers-geral-table-component @registerWashers="registerWashers"
                                       @editWashers="editWashers"
                                       @showWasher="(val) => this.editPage = val" />
      </div>
    </div>
    <div class="edit-sub-page"
         v-if="this.editPage">
      <edit-washers-subpage-component @showWasher="(val) => this.editPage = val" />
    </div>
    <v-dialog v-model="registerWasher"
              width="auto">
      <create-washer-popup @registerWashers="registerWashers" />
    </v-dialog>
    <v-dialog v-model="editWasher[0]"
              width="auto">
      <edit-washer-popup @editWashers="editWashers" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useWashersStore } from '../../../../../store/store';
</script>

<script>
import DataBlockComponent from '../../../DataBlockComponent.vue';
import WashersGeralTableComponent from './WashersGeralTableComponent.vue';
import EditWashersSubpageComponent from '../EditSubpage/EditWashersSubpageComponent.vue';

import CreateWasherPopup from '../../../../PopupComponents/UserManagementPopups/CreateWasherPopup.vue';
import EditWasherPopup from '../../../../PopupComponents/UserManagementPopups/EditWasherPopup.vue';

export default {
  name: 'GeralWashersSubpageComponent',
  components: {
    DataBlockComponent,
    WashersGeralTableComponent,
    EditWashersSubpageComponent,
    CreateWasherPopup,
    EditWasherPopup,
  },
  data() {
    return {
      editPage: false,
      registerWasher: false,
      editWasher: [false, null],
      all: 0,
      newClients: 0,
      inactive: 0,
    };
  },
  methods: {
    registerWashers(val) {
      this.registerWasher = val;
    },
    editWashers(val) {
      this.editWasher = val;
    },
  },
  async beforeMount() {
    const washerStore = useWashersStore();
    await washerStore.requestWashers();
    await washerStore.requestNewWashers();

    this.all = washerStore.getWashers.length;
    this.newWasher = washerStore.getNewWashers;
    this.inactive = washerStore.getInactiveWashers;
  },
};
</script>
