<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div class="sub-menu"
         className="mt-[21px] w-[1500px] h-[791px]
         shadow-[4px_6px_30px_0px_#00000020] p-[32px]"
         v-if="isGeral == 'Page'">
      <div className="flex flex-row">
        <div className="mr-auto">
          <div class="menu"
               className="flex flex-row
               text-[16px] font-normal mt-4">
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (isUser == 'registered' ? 'font-semibold' : '')]"
                 @click="changePage('registered')">
              Registered Admins
            </div>
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (isUser == 'types' ? 'font-semibold' : '')]"
                 @click="changePage('types')">
              User Types
            </div>
          </div>
        </div>
        <div className="ml-auto">
          <div className="flex flex-row h-[56px]">
            <div className="w-[230px] text-right mr-4"
                 v-if="isUser == 'registered'">
              <v-select label="Filter"
                        :items="items"
                        variant="outlined" />
            </div>
            <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold"
                 @click="changeGeral('NewUsertype')">
              <v-icon name="bi-plus-square"
                      scale="1.25"
                      fill="black" />
              Register User Type
            </div>
            <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold ml-4"
            @click="newAdminVal = true">
              <v-icon name="pr-user-plus"
                      scale="1.25"
                      fill="black" />
              Register Admin
            </div>
            <!-- <div className="w-fit h-fit
              rounded-[10px] border-2
               border-solid border-[#C9C9C9]
               pl-3" v-if="isUser == 'types'">
              <input type="text"
                     v-model="search"
                     placeholder="User type name"
                     aria-label="User type name"
                     className="rounded-[10px] px-2 py-3 w-[360px]">
            </div> -->
          </div>
        </div>
      </div>
      <div class="sub-page">
        <registered-subpage-component v-if="isUser == 'registered'"
                                      @editAdmin="(val) => {
                                        this.editAdminVal = val
                                      }" />
        <usertypes-subpage-component v-if="isUser == 'types'"
                                     @changeGeral="changeGeral" />
      </div>
    </div>
    <div v-if="isGeral == 'NewUsertype'"></div>
    <div v-if="isGeral == 'EditUsertype'"></div>
    <v-dialog v-model="newAdminVal"
              width="auto">
      <create-admin-popup @registerAdmin="(val) => this.newAdminVal = val" />
    </v-dialog>
    <v-dialog v-model="editAdminVal"
              width="auto">
      <edit-admin-popup @editAdmin="(val) => this.editAdminVal = val" />
    </v-dialog>
  </div>
</template>

<script>
import RegisteredSubpageComponent from '../RegisteredSubpages/RegisteredSubpageComponent.vue';
import UsertypesSubpageComponent from '../UsertypesSubpages/UsertypesSubpageComponent.vue';

import CreateAdminPopup from '../../../../PopupComponents/UserManagementPopups/CreateAdminPopup.vue';
import EditAdminPopup from '../../../../PopupComponents/UserManagementPopups/EditAdminPopup.vue';

export default {
  name: 'GeralAdminsSubpageComponent',
  components: {
    RegisteredSubpageComponent,
    UsertypesSubpageComponent,
    CreateAdminPopup,
    EditAdminPopup,
  },
  data() {
    return {
      isUser: 'registered',
      isGeral: 'Page',
      editAdminVal: false,
      newAdminVal: false,
      items: [
        'Admin',
        'SubAdmin',
      ],
    };
  },
  methods: {
    changePage(val) {
      this.isUser = val;
    },
    changeGeral(val) {
      this.isGeral = val;
    },
  },
};
</script>
