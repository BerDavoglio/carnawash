<template>
  <div>
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Orders and Appointments
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
    <div class="submenu"
         className="mt-[21px]">
      <div className="grid grid-cols-2">
        <div className="mr-auto">
          <div class="menu"
               className="flex flex-row
               text-[16px] font-normal">
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['mr-[57px] cursor-pointer '
              + (this.isGeral ? 'font-semibold' : '')]"
                 @click="changePage(true)">
              Appointment
            </div>
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['cursor-pointer '
              + (!this.isGeral ? 'font-semibold' : '')]"
                 @click="changePage(false)">
              Appointment History
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="subpage">
      <geral-orders-subpage-component />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore } from '../store/store';
</script>

<script>
import GeralOrdersSubpageComponent from '../components/OrdersComponents/GeralOrdersSubpageComponent.vue';

export default {
  name: 'OrdersView',
  components: { GeralOrdersSubpageComponent },
  data() {
    return {
      isGeral: true,
    };
  },
  methods: {
    changePage(val) {
      this.isGeral = val;
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
