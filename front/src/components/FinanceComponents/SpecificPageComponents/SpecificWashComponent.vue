<template>
  <div>
    <div className="mb-6">
      <div className="font-semibold text-[16px] text-left text-[#045C9C]
      mb-[16px]">
        Wash Details
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] text-left">Car Type/Model</th>
            <th className="pb-[12px] text-center">Car Type Price</th>
            <th className="pb-[12px] text-center">Additional Service</th>
            <th className="pb-[12px] text-center">Additional Service Price</th>
            <th className="pb-[12px] text-center">Promo Code Discount/Coupon</th>
            <th className="pb-[12px] text-center">Quantity</th>
            <th className="pb-[12px] text-right">Total Price</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <specific-table-item-component :obj="this.objeto" />
          <specific-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import SpecificTableItemComponent from './SpecificTableItemComponent.vue';

export default {
  name: 'SpecificWashComponent',
  components: { SpecificTableItemComponent },
  data() {
    return {
      objeto: {
        type: ['Car Size Small', 'Car Model A'],
        type_price: 60,
        add: ['Pet Hair'],
        add_price: 15,
        code: 20,
        quantity: 1,
        total: 180,
      },
    };
  },
};
</script>
