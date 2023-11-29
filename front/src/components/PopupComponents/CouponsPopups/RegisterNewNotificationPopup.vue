<!-- eslint-disable vuejs-accessibility/form-control-has-label -->
<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div>
    <div className="w-[742px] h-[330px] bg-white
      rounded-lg flex flex-col justify-between
      p-6">
      <div className="flex flex-row justify-between">
        <div className="font-semibold text-[16px]">
          Send notification to user
        </div>
        <div className="cursor-pointer"
             @click="this.$emit('newNotification', false)">
          <v-icon name="io-close" scale="1.25"/>
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
          Coupon
          <div className="w-[340px] h-[40px]">
            <v-select label="Coupon"
                      v-model="new_notification.name"
                      :items="this.listCoupons"
                      variant="solo"
                      density="compact"
                      bg-color="#F8F8F8" />
          </div>
        </div>
        <div className="text-left text-[16px] font-normal text-[#3F3F44]">
          Send to all users
          <div className="ml-auto">
            <div className="w-[340px] h-[47px] rounded-lg
              bg-[#F8F8F8] border-1 border-solid border-[#EBF0ED]
              flex flex-row justify-between">
              <div className="my-auto ml-[16px] text-[14px] font-light text-[#3F3F44]">
                Send to all
              </div>
              <input type="checkbox"
                     v-model="new_notification.type"
                     className="mr-2 w-[24px] h-[24px] my-auto" />
            </div>
          </div>
        </div>
      </div>
      <div className="text-left text-[16px] font-normal text-[#3F3F44] mb-2">
        Send to specific user/users
        <div className="w-[691px] h-[40px]">
          <v-select label="Search or input user"
                    v-model="new_notification.user"
                    :items="this.listClients"
                    variant="solo"
                    density="compact"
                    bg-color="#F8F8F8" />
        </div>
      </div>
      <div className="w-[241px] p-[12.5px] bg-[#EDBD3A]
            text-black rounded-[8px] cursor-pointer
            mx-auto font-semibold text-center"
           @click="saveNotification()">
        Send notification
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  useCouponsStore,
  useNotificationStore,
  useClientStore,
} from '../../../store/store';
</script>

<script>
export default {
  name: 'RegisterNewNotificationPopup',
  data() {
    return {
      new_notification: {
        name: '',
        type: false,
        user: '',
      },
      listClients: [],
      listCoupons: [],
    };
  },
  methods: {
    async saveNotification() {
      const notificationStore = useNotificationStore();
      const couponStore = useCouponsStore();
      const clientStore = useClientStore();

      const especificCoupon = couponStore.getCoupons.find(
        (item) => item.name === this.new_notification.name,
      );

      const especificUser = clientStore.getClients.find(
        (item) => item.name === this.new_notification.user,
      );

      await notificationStore.createSent({
        notification_id: especificCoupon.id,
        user_type: (this.new_notification.type ? 'client' : null),
        user_id: especificUser.id,
      }).then(() => {
        this.$emit('newNotification', false);
      });
    },
  },
  async beforeMount() {
    const couponStore = useCouponsStore();
    const clientStore = useClientStore();

    await couponStore.requestCoupons();
    await clientStore.requestClients();

    const cliAux = clientStore.getClients;
    cliAux.forEach((user) => {
      this.listClients.push(user.name);
    });

    const copuAux = couponStore.getCoupons;
    copuAux.forEach((cou) => {
      this.listCoupons.push(cou.name);
    });
  },
};
</script>
