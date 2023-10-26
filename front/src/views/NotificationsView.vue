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
            cursor-pointer">
        <v-icon name="bi-send"
                scale="1.25" /> Send notification to user
      </div>
      <div className="w-[237px] h-[44px]
        px-[16px] py-[8px] font-semibold
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
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
  </div>
</template>

<script>
import NotificationsActiveTableComponent from '../components/NotificationsComponents/ActiveComponents/NotificationsActiveTableComponent.vue';
import NotificationsProgramBoxComponent from '../components/NotificationsComponents/NotificationsProgramBoxComponent.vue';
import NotificationsHistoryTableComponent from '../components/NotificationsComponents/HistoryComponents/NotificationsHistoryTableComponent.vue';

export default {
  name: 'NotificationsView',
  components: {
    NotificationsActiveTableComponent,
    NotificationsProgramBoxComponent,
    NotificationsHistoryTableComponent,
  },
};
</script>
