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
             @click="this.$emit('notificationSend', [false, null])">
          <v-icon name="io-close"
                  scale="1.25" />
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="w-[241px] p-[12.5px] border-[#EDBD3A]
              border-2 text-[#EDBD3A] rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center bg-white"
             @click="this.$emit('notificationSend', [false, null])">
          Cancel
        </div>
        <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
              text-black rounded-[8px] cursor-pointer
              mx-auto font-semibold text-center"
             @click="sendNotification()">
          Send
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useNotificationStore } from '../../../store/store';

export default {
  name: 'NotificationSendPopup',
  props: ['pre_data'],
  data() {
    return {};
  },
  methods: {
    async sendNotification() {
      const notificationStore = useNotificationStore();
      await notificationStore.createSent(this.pre_data).then(() => {
        this.$emit('notificationSend', [false, null]);
      });
    },
  },
};
</script>
