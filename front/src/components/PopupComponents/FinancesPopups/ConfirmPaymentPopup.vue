<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[140px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Confirm payment?
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('confirmPayment', false)">
          <v-icon name="io-close" scale="1.25"/>
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="w-[241px] p-[12.5px] border-[#EDBD3A]
              border-2 text-[#EDBD3A] rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center bg-white"
             @click="this.$emit('confirmPayment', false)">
          Cancel
        </div>
        <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
              text-black rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center"
             @click="this.$emit('confirmPayment', false)">
          Confirm
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ConfirmPaymentPopup',
  data() {
    return {};
  },
  methods: {},
};
</script>
