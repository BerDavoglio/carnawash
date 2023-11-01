<template>
  <div>
    <div class="geral-sub-page"
         v-if="!edit">
      <div className="mt-8 flex flex-row justify-between">
        <data-block-component :obj="{
          icon: 'pr-users',
          text: 'Total Washers',
          value: 300,
        }"
                              :hasFilter="0" />
        <data-block-component :obj="{
          icon: 'pr-user-plus',
          text: 'New Washers',
          value: 15,
        }"
                              :hasFilter="1" />
        <data-block-component :obj="{
          icon: 'pr-user-minus',
          text: 'Inactive Washers',
          value: 8,
        }"
                              :hasFilter="2" />
      </div>
      <div className="my-8">
        <washers-geral-table-component @registerWashers="registerWashers"
                                       @editWashers="editWashers"
                                       @showWasher="(val) => this.edit = val" />
      </div>
    </div>
    <div class="edit-sub-page"
         v-if="edit">
      <edit-washers-subpage-component @showWasher="(val) => this.edit = val" />
    </div>
    <v-dialog v-model="registerWasher"
              width="auto">
      <create-washer-popup @registerWashers="registerWashers" />
    </v-dialog>
    <v-dialog v-model="editWasher"
              width="auto">
      <edit-washer-popup @editWashers="editWashers" />
    </v-dialog>
  </div>
</template>

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
      edit: false,
      registerWasher: false,
      editWasher: false,
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
};
</script>
