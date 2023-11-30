<template>
  <div>
    <div className="w-[1500px] h-[406px] my-6
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[35px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Notifications History
          </div>
        </div>
      </div>
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] w-[400px] text-left">Notification Title</th>
            <th className="pb-[12px] text-center">User Type</th>
            <th className="pb-[12px] text-center">User Name</th>
            <th className="pb-[12px] text-center">Notification Type</th>
            <th className="pb-[12px] text-center">Resend Notification</th>
            <th className="pb-[12px] text-center">Time / Date sent</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <notifications-history-table-item-component v-for="i in listHistory"
                                                      v-bind:key="i"
                                                      :obj="i"
                                                      @notificationResend="notificationResend" />
        </tbody>
      </table>
    </div>
    <v-dialog v-model="resend[0]"
              width="auto">
      <notification-resend-popup :pre_data="resend[1]"
                                 @notificationResend="notificationResend" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useNotificationStore, useClientStore } from '../../../store/store';
</script>

<script>
import NotificationsHistoryTableItemComponent from './NotificationsHistoryTableItemComponent.vue';
import NotificationResendPopup from '../../PopupComponents/NotificationsPopups/ResendNotificationPopup.vue';

export default {
  name: 'NotificationsHistoryTableComponent',
  components: { NotificationsHistoryTableItemComponent, NotificationResendPopup },
  data() {
    return {
      listHistory: [],
      resend: [false, null],
    };
  },
  methods: {
    notificationResend(val) {
      this.resend = val;
    },
    registerNewNotification(val) {
      this.editNot = val;
    },
  },
  async beforeMount() {
    const notificationStore = useNotificationStore();
    const clientStore = useClientStore();

    await notificationStore.requestNotificationHistory();
    await clientStore.requestClients();

    const listAux = notificationStore.getNotificationHistory;
    listAux.forEach((item) => {
      const especificNotification = notificationStore.getNotification.find(
        (aux) => aux.id === item.notification_id,
      );

      const especificUser = clientStore.getClients.find(
        (aux) => aux.id === item.user_id,
      );

      this.listHistory.push({
        id: item.id,
        notification_id: item.notification_id,
        title: (especificNotification === undefined ? 'ERROR' : especificNotification.title),
        user_type: item.user_type,
        user_id: item.user_id,
        name: (especificUser === undefined ? '-' : especificUser.name),
        type: (especificNotification === undefined ? '-' : especificNotification.type),
        date: item.created_at,
      });
    });
  },
};
</script>
