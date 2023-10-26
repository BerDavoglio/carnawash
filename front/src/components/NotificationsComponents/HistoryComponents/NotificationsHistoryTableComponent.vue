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
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
          <notifications-history-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import NotificationsHistoryTableItemComponent from './NotificationsHistoryTableItemComponent.vue';

export default {
  name: 'NotificationsHistoryTableComponent',
  components: { NotificationsHistoryTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        title: 'RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - v',
        user_type: 'Clients',
        name: 'Client A',
        type: 'Congratulations',
        date: '25-08-2023 07:55',
      },
    };
  },
};
</script>
