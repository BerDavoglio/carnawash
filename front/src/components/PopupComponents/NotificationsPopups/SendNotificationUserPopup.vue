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
          <div className="w-[718px] h-fit rounded-lg">
              <v-select label="Coupon"
                      v-model="new_notification.title"
                      :items="this.listNotifications"
                      variant="solo"
                      density="compact"
                      bg-color="#F8F8F8" />
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        User name/names
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg">
              <v-select label="Search or input user"
                    v-model="new_notification.user"
                    :items="this.listClients"
                    variant="solo"
                    density="compact"
                    bg-color="#F8F8F8" />
          </div>
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="saveNotification()">
        Send Notification
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  useNotificationStore,
  useClientStore,
} from '../../../store/store';
</script>

<script>
export default {
  name: 'SendNotificationUserPopup',
  data() {
    return {
      new_notification: {
        title: '',
        user: '',
      },
      listClients: [],
      listNotifications: [],
    };
  },
  methods: {
    async saveNotification() {
      const notificationStore = useNotificationStore();
      const clientStore = useClientStore();

      const especificNotification = notificationStore.getNotification.find(
        (item) => item.title === this.new_notification.title,
      );

      const especificUser = clientStore.getClients.find(
        (item) => item.name === this.new_notification.user,
      );

      await notificationStore.createSent({
        notification_id: especificNotification.id,
        user_id: especificUser.id,
      }).then(() => {
        this.$emit('sendNotificationUser', false);
      });
    },
  },
  async beforeMount() {
    const notificationStore = useNotificationStore();
    const clientStore = useClientStore();

    await notificationStore.requestNotification();
    await clientStore.requestClients();

    const cliAux = clientStore.getClients;
    cliAux.forEach((user) => {
      this.listClients.push(user.name);
    });

    const notAux = notificationStore.getNotification;
    notAux.forEach((not) => {
      this.listNotifications.push(not.title);
    });
  },
};
</script>
