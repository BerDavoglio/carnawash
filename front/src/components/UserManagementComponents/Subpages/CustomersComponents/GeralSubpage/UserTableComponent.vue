<template>
  <div class="table-component">
    <div className="w-full h-[580px] mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[56px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Registered Costumers
          </div>
          <div className="w-fit h-fit
               rounded-[10px] border-2
               border-solid border-[#C9C9C9]
               pl-3 my-auto">
            <v-icon name="bi-search"
                    scale="1.25"
                    fill="black" />
            <input type="text"
                   v-model="search"
                   placeholder="Search"
                   aria-label="search"
                   className="rounded-[10px] px-2 py-3 w-[471px]">
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-[230px] text-right mb-[16px] mr-[40px]">
            <v-select label="Filter"
                      :items="this.items"
                      variant="outlined" />
          </div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold"
               @click="registerCostumers()">
            <v-icon name="pr-user-plus"
                    scale="1.25"
                    fill="black" />
            Register Costumers
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-center">Name</th>
            <th className="pb-[12px] text-center">E-mail</th>
            <th className="pb-[12px] text-center">Telephone</th>
            <th className="pb-[12px] text-center">Address</th>
            <th className="pb-[12px] text-center">Wash history and Data</th>
            <th className="pb-[12px] text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <user-table-item-component :obj="this.objeto"
                                     @editCs="(val) => this.$emit('editCostumers', val)"
                                     @showC="(val) => this.$emit('showCostumer', val)" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import UserTableItemComponent from './UserTableItemComponent.vue';

export default {
  name: 'UserTableComponent',
  components: { UserTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        name: 'Client A',
        email: 'clienta@gmail.com',
        phone: '419909230',
        address: 'Rua das Peras',
      },
      items: ['Alfabetical', 'Date'],
    };
  },
  methods: {
    registerCostumers() {
      this.$emit('registerCostumers', true);
    },
  },
};
</script>
