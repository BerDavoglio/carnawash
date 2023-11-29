<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Notifications
        </div>
        <div className="ml-auto">
          <div className="w-fit h-fit
          rounded-[10px] border-2
               border-solid border-[#C9C9C9]
               pl-3">
            <v-icon name="bi-search"
                    scale="1.25"
                    fill="black" />
            <input type="text"
                   v-model="search"
                   placeholder="Search"
                   aria-label="search"
                   className="rounded-[10px] px-2 py-3 w-[471px]">
          </div>
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div class="buttons"
         className="flex flex-row justify-end my-[24px]">
      <div className="w-[267px] h-[44px]
        px-[16px] py-[8px] font-semibold mr-4
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
           @click="sendNotUser = true;">
        <v-icon name="bi-send"
                scale="1.25" /> Send notification to user
      </div>
      <div className="w-[237px] h-[44px]
        px-[16px] py-[8px] font-semibold
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
           @click="newNot = [true, null];">
        <v-icon name="bi-plus-circle"
                scale="1.25" /> New notification
      </div>
    </div>
    <div class="boxes"
         className="flex flex-row justify-between">
      <notifications-active-table-component />
      <notifications-program-box-component />
    </div>
    <div>
      <notifications-history-table-component />
    </div>
    <v-dialog v-model="newNot[0]"
              width="auto">
      <register-new-notification-popup :pre_data="null"
                                       @registerNewNotification="registerNewNotification" />
    </v-dialog>
    <v-dialog v-model="sendNotUser"
              width="auto">
      <send-notification-user-popup @sendNotificationUser="sendNotificationUser" />
    </v-dialog>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
import NotificationsActiveTableComponent from '../components/NotificationsComponents/ActiveComponents/NotificationsActiveTableComponent.vue';
import NotificationsProgramBoxComponent from '../components/NotificationsComponents/NotificationsProgramBoxComponent.vue';
import NotificationsHistoryTableComponent from '../components/NotificationsComponents/HistoryComponents/NotificationsHistoryTableComponent.vue';

import SendNotificationUserPopup from '../components/PopupComponents/NotificationsPopups/SendNotificationUserPopup.vue';
import RegisterNewNotificationPopup from '../components/PopupComponents/NotificationsPopups/RegisterNewNotificationPopup.vue';

export default {
  name: 'NotificationsView',
  components: {
    NotificationsActiveTableComponent,
    NotificationsProgramBoxComponent,
    NotificationsHistoryTableComponent,
    SendNotificationUserPopup,
    RegisterNewNotificationPopup,
  },
  data() {
    return {
      sendNotUser: false,
      newNot: [false, null],
      new_sent: {
        name: '',
        type: false,
        user: '',
      },
      new_notification: {
        name: '',
        type: '',
        user: '',
      },
    };
  },
  methods: {
    sendNotificationUser(val) {
      this.sendNotUser = val;
    },
    registerNewNotification(val) {
      this.newNot = val;
    },
  },
  beforeMount() {
    const store = useLoginStore();
    if (store.getToken === '') {
      this.$router.push({ name: 'login' });
    }
  },
};
</script>
