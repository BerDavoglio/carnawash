<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[220px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Edit usertype
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('editUsertype', false)">
          <v-icon name="io-close"
                  scale="1.25" />
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Usertype name
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="name"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="this.$emit('editUsertype', false)">
        Save Changes
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'EditAdminPopup',
  data() {
    return {
      name: '',
    };
  },
  methods: {},
};
</script>
