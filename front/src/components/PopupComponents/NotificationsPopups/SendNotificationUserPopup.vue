<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[335px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Send notification to user
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('sendNotificationUser', false)">
          <v-icon name="io-close" scale="1.25"/>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Notification title
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="send_not.title"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        User name/names
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="send_not.user"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="this.$emit('sendNotificationUser', false)">
        Send Notification
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SendNotificationUserPopup',
  data() {
    return {
      send_not: {
        title: '',
        user: '',
      },
    };
  },
  methods: {},
};
</script>
