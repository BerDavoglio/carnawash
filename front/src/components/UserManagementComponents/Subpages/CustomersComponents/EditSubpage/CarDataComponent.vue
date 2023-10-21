<template>
  <div class="car-data">
    <div class="header"
         className="grid grid-cols-2 justify-between
         mt-[40px] mb-[16px]">
      <div className="font-semibold text-[16px] text-left">
        Registered Cars
      </div>
      <div className="flex flex-row justify-end">
        <div className="text-[#EDBD3A] font-medium text-[16px]
      cursor-pointer text-right mr-4">
          <v-icon name="bi-trash"
                  scale="1.25"
                  fill="#EDBD3A" />
          Delete
        </div>
        <div className="text-[#EDBD3A] font-medium text-[16px]
      cursor-pointer text-right">
          <v-icon name="md-edit-outlined"
                  scale="1.25"
                  fill="#EDBD3A" />
          Edit
        </div>
      </div>
    </div>
    <div className="scrollbar scrollbar-thumb-[#EDBD3A]
      scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded">
      <car-block-component />
    </div>
  </div>
</template>

<script>
import CarBlockComponent from './CarBlockComponent.vue';

export default {
  name: 'CarDataComponent',
  components: { CarBlockComponent },
};
</script>
