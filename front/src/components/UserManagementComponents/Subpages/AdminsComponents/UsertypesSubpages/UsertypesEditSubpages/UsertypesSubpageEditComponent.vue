<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="usertypes-subpage-edit-component">
    <div className="w-[1500px] h-[811px] my-[16px] m-auto p-6
    shadow-[4px_6px_30px_0px_#00000020] rounded-lg">
      <div class="header"
           className="flex flex-row justify-between">
        <div className="flex flex-row my-auto">
          <div className="w-9 h-9 rounded-full bg-amber-400 flex my-auto mr-6">
            <div className="m-auto cursor-pointer"
                 @click="this.$emit('changeGeral', 'Page')">
              <v-icon name="md-arrowback"
                      fill="white" />
            </div>
          </div>
          <div className="font-semibold text-[16px] my-auto">
            User type edit
          </div>
        </div>
        <div className="ml-auto">
          <div className="w-[394px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="name"
                   placeholder="User type name"
                   className="h-[40px] w-[88%] rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <v-icon name="md-edit-outlined"
                    scale="1.5"
                    fill="black" />
          </div>
        </div>
      </div>
      <div class="tables"
           className="flex flex-row justify-between">
        <div className="w-[783px]">
          <usertypes-pages-table-component />
        </div>
        <div className="w-[650px]">
          <usertypes-allowed-table-component />
        </div>
      </div>
    </div>
    <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            ml-auto mr-[56px] font-semibold text-center"
         @click="this.$emit('changeGeral', 'Page')">
      Save user type
    </div>
  </div>
</template>

<script>
import UsertypesPagesTableComponent from './UsertypesPagesTableComponent.vue';
import UsertypesAllowedTableComponent from './UsertypesAllowedTableComponent.vue';

export default {
  name: 'UsertypesSubpageEditComponent',
  components: { UsertypesPagesTableComponent, UsertypesAllowedTableComponent },
  data() {
    return {
      name: '',
    };
  },
};
</script>
