<template>
  <div>
    <div class="sub-menu"
         className="mt-[21px] w-[1500px] h-[791px]
         shadow-[4px_6px_30px_0px_#00000020] p-[32px]">
      <div className="flex flex-row">
        <div className="mr-auto">
          <div class="menu"
               className="flex flex-row
               text-[16px] font-normal mt-4">
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (this.isUser == 'registered' ? 'font-semibold' : '')]"
                 @click="changePage('registered')">
              Registered Admins
            </div>
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (this.isUser == 'types' ? 'font-semibold' : '')]"
                 @click="changePage('types')">
              User Types
            </div>
          </div>
        </div>
        <div className="ml-auto">
          <div className="flex flex-row h-[56px]">
            <div className="w-[230px] text-right mr-4">
              <v-select label="Filter"
                        :items="this.items"
                        variant="outlined" />
            </div>
            <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold">
              <v-icon name="bi-plus-square"
                      scale="1.25"
                      fill="black" />
              Register User Type
            </div>
            <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold ml-4">
              <v-icon name="pr-user-plus"
                      scale="1.25"
                      fill="black" />
              Register Admin
            </div>
          </div>
        </div>
      </div>
      <div class="sub-page">
        <registered-subpage-component v-if="isUser == 'registered'" />
        <usertypes-subpage-component v-if="isUser == 'types'" />
      </div>
    </div>
  </div>
</template>

<script>
import RegisteredSubpageComponent from '../RegisteredSubpages/RegisteredSubpageComponent.vue';
import UsertypesSubpageComponent from '../UsertypesSubpages/UsertypesSubpageComponent.vue';

export default {
  name: 'GeralAdminsSubpageComponent',
  components: { RegisteredSubpageComponent, UsertypesSubpageComponent },
  data() {
    return {
      isUser: 'registered',
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
  },
};
</script>
