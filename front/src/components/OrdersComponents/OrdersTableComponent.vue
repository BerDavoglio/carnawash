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
            Wash requests
          </div>
        </div>
        <div className="flex flex-row">
          <div className="text-right my-auto mr-[40px] flex flex-row">
            <div className="align-middle text-[16px] font-normal mr-2">
              Notify wash status automatically:
            </div>
            <VueToggles v-model="enable"
                        :height="28"
                        :width="54"
                        checkedBg="#1C8E33"
                        style="margin-left: auto; margin-right: auto;" />
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
                   className="rounded-[10px] px-2 py-3 w-[306px]">
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-left">Wash ID</th>
            <th className="pb-[12px] text-center">Client Name</th>
            <th className="pb-[12px] text-center">Price</th>
            <th className="pb-[12px] text-center">Details</th>
            <th className="pb-[12px] text-center w-[110px]">Date Request</th>
            <th className="pb-[12px] text-center">Assing to washer</th>
            <th className="pb-[12px] text-center w-[110px]">Save Request</th>
            <th className="pb-[12px] text-center w-[150px]">Washer Acceptance</th>
            <th className="pb-[12px] text-center w-[100px]">Cancel Appointment</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
          <orders-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import { VueToggles } from 'vue-toggles';

import OrdersTableItemComponent from './OrdersTableItemComponent.vue';

export default {
  name: 'UserTableComponent',
  components: { OrdersTableItemComponent, VueToggles },
  data() {
    return {
      objeto: {
        id: 1,
        client: 'Client A',
        price: 123,
        date: '25/08/2023',
        acceptance: 'Waiting Confirmation',
      },
      items: ['Alfabetical', 'Date'],
    };
  },
};
</script>
