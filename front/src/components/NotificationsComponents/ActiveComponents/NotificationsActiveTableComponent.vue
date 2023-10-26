<template>
  <div>
    <div className="w-[1210px] h-[406px] my-6
      shadow-[4px_6px_30px_0px_#00000020] rounded-lg
      py-[16px] px-[24px] overflow-y-auto
      scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <div class="title"
           className="flex flex-row justify-between h-[56px] mb-6">
        <div className="flex flex-row">
          <div className="text-[16px] font-semibold text-left mb-[16px] mr-[20px] my-auto">
            Active notifications
          </div>
        </div>
        <div className="flex flex-row">
          <div className="w-fit h-fit
               rounded-[10px] border-2
               border-solid border-[#C9C9C9]
               pl-3 my-auto">
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
      <table class="table-auto w-full
        text-[16px] text-[#3F3F44]
        text-left">
        <thead className="font-normal
          border-b-[1px] border-[#C9C9C9]">
          <tr>
            <th className="pb-[12px] w-[400px] text-left">Notification Title</th>
            <th className="pb-[12px] text-center">Destined to</th>
            <th className="pb-[12px] text-center">Notification type</th>
            <th className="pb-[12px] text-center">Send Notification</th>
            <th className="pb-[12px] text-center">Resend Notification</th>
            <th className="pb-[12px] text-center">Actions</th>
          </tr>
        </thead>
        <tbody className="font-light">
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
          <notifications-active-table-item-component :obj="this.objeto" />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import NotificationsActiveTableItemComponent from './NotificationsActiveTableItemComponent.vue';

export default {
  name: 'NotificationsActiveTableComponent',
  components: { NotificationsActiveTableItemComponent },
  data() {
    return {
      objeto: {
        id: 1,
        title: 'RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - RESCHEDULE ALL WASHES - v',
        destinated: 'Clients',
        type: 'Congratulations',
      },
    };
  },
};
</script>
