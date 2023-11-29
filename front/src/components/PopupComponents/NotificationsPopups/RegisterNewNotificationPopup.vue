<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[766px] h-[417px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Register new notification
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('registerNewNotification', [false, null])">
          <v-icon name="io-close"
                  scale="1.25" />
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Notification title
        <div className="ml-auto">
          <div className="w-[718px] h-fit rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
            <input v-model="new_not.title"
                   className="h-[40px] w-full rounded-lg  px-4 py-6
                      bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]">
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44]">
        Notification type
        <div className="ml-auto">
          <div className="w-[718px] h-[44px]">
            <v-select label="Users"
                      v-model="new_not.user"
                      :items="[
                        'Chat',
                        'Confirm',
                        'Negate',
                        'Other',
                      ]"
                      variant="solo"
                      density="compact"
                      bg-color="#F8F8F8" />
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
        User type to send
        <div className="w-[718px] h-[44px]">
          <v-select label="Users"
                    v-model="new_not.type"
                    :items="[
                      'client',
                      'washer',
                      'admin',
                    ]"
                    variant="solo"
                    density="compact"
                    bg-color="#F8F8F8" />
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="saveNotification()">
        Send New Notification
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  useNotificationStore,
} from '../../../store/store';
</script>

<script>
export default {
  name: 'RegisterNewNotificationPopup',
  props: ['pre_data'],
  data() {
    return {
      new_not: {},
    };
  },
  methods: {
    async saveNotification() {
      const notificationStore = useNotificationStore();

      let val = 0;
      if (this.new_not === 'Chat') {
        val = 1;
      } else if (this.new_not === 'Confirm') {
        val = 2;
      } else if (this.new_not === 'Negate') {
        val = 3;
      } else {
        val = 0;
      }

      if (this.pre_data === null) {
        await notificationStore.createNotification({
          title: this.new_not.title,
          type: val,
          destined_to: this.new_not.user,
        }).then(() => {
          this.$emit('registerNewNotification', [false, null]);
        });
      } else {
        await notificationStore.editNotification(this.pre_data.id, {
          title: this.new_not.title,
          type: val,
          destined_to: this.new_not.user,
        }).then(() => {
          this.$emit('registerNewNotification', [false, null]);
        });
      }
    },
  },
  beforeMount() {
    if (this.pre_data === null) {
      this.new_not = {
        id: 0,
        title: '',
        type: '',
        user: '',
      };
    } else {
      this.new_not = {
        id: this.pre_data.id,
        title: this.pre_data.title,
        type: this.pre_data.type,
        user: this.pre_data.destined_to,
      };
    }
  },
};
</script>
