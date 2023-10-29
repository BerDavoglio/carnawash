<template>
  <div class="table-component">
    <div className="w-full h-[580px] mt-4
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Last Washes
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-[230px] h-[56px] mt-[10px] text-right mb-[16px] mr-[40px]">
            <v-select label="Filter"
                      :items="this.items"
                      variant="outlined" />
          </div>
          <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            m-auto font-semibold">
            <v-icon name="pr-user-plus"
                    scale="1.25"
                    fill="black" />
            Register Washer
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-center">Select All</th>
            <th className="pb-[12px] text-center">Wash ID</th>
            <th className="pb-[12px] text-center">Client</th>
            <th className="pb-[12px] text-center">Washer</th>
            <th className="pb-[12px] text-center max-w-[110px]">Date</th>
            <th className="pb-[12px] text-center">Wash Status</th>
            <th className="pb-[12px] text-center">Time</th>
            <th className="pb-[12px] text-center">Rating</th>
            <th className="pb-[12px] text-center max-w-[120px]">Payment Action</th>
            <th className="pb-[12px] text-center max-w-[80px]">Transaction Detail</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
          <finance-table-item-component :obj="this.objeto"
                                        @confirmPayment="confirmPayment" />
        </tbody>
      </table>
    </div>
    <v-dialog v-model="confirmPay"
              width="auto">
      <confirm-payment-popup @confirmPayment="confirmPayment" />
    </v-dialog>
  </div>
</template>

<script>
import FinanceTableItemComponent from './FinanceTableItemComponent.vue';
import ConfirmPaymentPopup from '../PopupComponents/FinancesPopups/ConfirmPaymentPopup.vue';

export default {
  name: 'FinanceTableComponent',
  components: { FinanceTableItemComponent, ConfirmPaymentPopup },
  data() {
    return {
      objeto: {
        id: 1,
        client: 'Client A',
        washer: 'Washer A',
        date: '25/08/2023 07:47',
        status: 'Not Payed',
        time: '1:43',
        rating: '4.5',
      },
      items: ['Alfabetical', 'Date'],
      confirmPay: false,
    };
  },
  methods: {
    confirmPayment(val) {
      this.confirmPay = val;
    },
  },
};
</script>
