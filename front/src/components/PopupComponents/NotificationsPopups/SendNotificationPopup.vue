<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[140px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Send notification?
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('notificationSend', false)">
          <v-icon name="io-close" />
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="w-[241px] p-[12.5px] border-[#EDBD3A]
              border-2 text-[#EDBD3A] rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center bg-white"
             @click="this.$emit('notificationSend', false)">
          Cancel
        </div>
        <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
              text-black rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center"
             @click="this.$emit('notificationSend', false)">
          Send
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NotificationSendPopup',
  data() {
    return {};
  },
  methods: {},
};
</script>
