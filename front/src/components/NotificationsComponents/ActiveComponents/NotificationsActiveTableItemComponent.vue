<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <tr>
    <td className="w-[400px] text-[#3F3F44] text-[14px] font-light pt-[24px] text-left">
      {{ this.obj.title }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.type }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center">
      {{ this.obj.destined_to }}
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1"
        @click="this.$emit('notificationSend', [true, {
          notification_id: this.obj.id,
          user_type: this.obj.type,
          user_id: null,
        }]);">
      Send
    </td>
    <td className="text-[#3F3F44] text-[14px] font-light pt-[24px] text-center
    cursor-pointer underline underline-offset-1"
        @click="this.$emit('notificationResend', [true, {
          notification_id: this.obj.id,
          user_type: this.obj.type,
          user_id: null,
        }]);">
      Resend
    </td>
    <td className="pt-[24px] text-center">
      <span className="cursor-pointer"
            @click="this.$emit(
              'registerNewNotification',
              [true, this.obj]
            );">
        <v-icon name="md-edit-outlined"
                scale="1.25" />
      </span>
      <span className="cursor-pointer"
            @click="deleteNotification(this.obj.id)">
        <v-icon name="bi-trash"
                scale="1.25" />
      </span>
    </td>
  </tr>
</template>

<script setup>
import { useNotificationStore } from '../../../store/store';
</script>

<script>
export default {
  name: 'NotificationsActiveTableItemComponent',
  props: ['obj'],
  data() {
    return {};
  },
  methods: {
    async deleteNotification(id) {
      const notificationStore = useNotificationStore();
      await notificationStore.deleteNotification(id);
    },
  },
};
</script>
