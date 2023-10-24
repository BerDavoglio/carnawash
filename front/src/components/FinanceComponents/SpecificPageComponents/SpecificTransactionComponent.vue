<template>
  <div>
    <div className="p-6 w-[1440px] h-[250px] rounded-lg mb-6
    border-[3px] border-solid border-[#1486CA]
    shadow-[4px_6px_30px_0px_#00000020] m-auto">
      <div className="mb-6 text-[#1486CA] text-[16px] font-semibold text-left">
        Transaction Details
      </div>
      <div className="flex flex-row justify-between mb-6">
        <div className="flex flex-col text-[#3F3F44] text-[16px] text-left">
          <div>Total price</div>
          <div>Discount offered</div>
          <div>Discount Applied</div>
          <div>Total amount payed</div>
        </div>
        <div className="flex flex-col text-[#3F3F44] text-[16px] text-right font-semibold">
          <div>{{ formatPrice(470) }}</div>
          <div>%10</div>
          <div>{{ formatPrice(40) }}</div>
          <div>{{ formatPrice(430) }}</div>
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="">Payment method</div>
        <div className="text-[#3F3F44] text-[16px] font-semibold">Credit</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SpecificTransactionComponent',
  methods: {
    formatPrice(value) {
      const val = (value / 1).toFixed(2).replace('.', ',');
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    },
  },
};
</script>
