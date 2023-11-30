<template>
  <div class="user-management">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          User Management
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div class="submenu"
         className="mt-[21px]">
      <div className="mr-auto">
        <div class="menu"
             className="flex flex-row
               text-[16px] font-normal">
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div :className="['mr-[57px] cursor-pointer '
            + (isUser == 'customers' ? 'font-semibold' : '')]"
               @click="changePage('customers')">
            Customers
          </div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div :className="['mr-[57px] cursor-pointer '
            + (isUser == 'washers' ? 'font-semibold' : '')]"
               @click="changePage('washers')">
            Washers
          </div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div :className="['mr-[57px] cursor-pointer '
            + (isUser == 'admins' ? 'font-semibold' : '')]"
               @click="changePage('admins')">
            Admins
          </div>
        </div>
      </div>
    </div>
    <div class="sub-page">
      <geral-customer-subpage-component v-if="isUser == 'customers'" />
      <geral-washers-subpage-component v-if="isUser == 'washers'" />
      <geral-admins-subpage-component v-if="isUser == 'admins'" />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
import GeralCustomerSubpageComponent from '../components/UserManagementComponents/Subpages/CustomersComponents/GeralSubpage/GeralCustomerSubpageComponent.vue';
import GeralWashersSubpageComponent from '../components/UserManagementComponents/Subpages/WashersComponents/GeralSubpage/GeralWashersSubpageComponent.vue';
import GeralAdminsSubpageComponent from '../components/UserManagementComponents/Subpages/AdminsComponents/GeralSubpage/GeralAdminsSubpageComponent.vue';

export default {
  name: 'UserManagementView',
  components: {
    GeralCustomerSubpageComponent,
    GeralWashersSubpageComponent,
    GeralAdminsSubpageComponent,
  },
  data() {
    return {
      isUser: 'customers',
    };
  },
  methods: {
    changePage(val) {
      this.isUser = val;
    },
  },
  beforeMount() {
    const store = useLoginStore();
    if (store.getToken === '') {
      this.$router.push({ name: 'login' });
    }
  },
};
</script>
