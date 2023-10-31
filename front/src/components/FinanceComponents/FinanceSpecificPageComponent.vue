<template>
  <div>
    <div className="my-[24px] w-full
    shadow-[4px_6px_30px_0px_#00000020] rounded-lg
    p-[36px]">
      <specific-header-component @changeDes="(val) => this.$emit('changeToDescript', val)" />
      <specific-infos-component />
      <specific-wash-component />
      <specific-transaction-component />
      <div className="m-auto">
        <div className="flex flex-row">
          <div className="text-[#EDBD3A] cursor-pointer text-[16px] font-semibold ml-auto">
            <span>
              <v-icon name="bi-download"
                      fill="#EDBD3A" />
            </span>
            Export payment voucher
          </div>
          <div className="text-[#EDBD3A] cursor-pointer text-[16px] font-semibold ml-4 mr-auto">
            <span>
              <v-icon name="hi-printer"
                      fill="#EDBD3A" />
            </span>
            Print
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SpecificHeaderComponent from './SpecificPageComponents/SpecificHeaderComponent.vue';
import SpecificInfosComponent from './SpecificPageComponents/SpecificInfosComponent.vue';
import SpecificWashComponent from './SpecificPageComponents/SpecificWashComponent.vue';
import SpecificTransactionComponent from './SpecificPageComponents/SpecificTransactionComponent.vue';

export default {
  name: 'FinanceSpecificPageComponent',
  components: {
    SpecificHeaderComponent,
    SpecificInfosComponent,
    SpecificWashComponent,
    SpecificTransactionComponent,
  },
};
</script>
