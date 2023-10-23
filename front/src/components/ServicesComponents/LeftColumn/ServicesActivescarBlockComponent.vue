<template>
  <div>
    <div className="w-[742px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4">
      <div className="text-left font-semibold text-[16px]">
        Active vehicle sizes
      </div>
      <car-size-subbox-component />
      <car-size-subbox-component />
      <car-size-subbox-component />
      <car-size-subbox-component />
      <div>
        <div className="w-[272px] h-[44px] mt-6
        px-[26px] py-[8px] font-semibold m-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
          Confirm Changes
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CarSizeSubboxComponent from './CarSizeSubboxComponent.vue';

export default {
  name: 'ServicesActivescarBlockComponent',
  components: { CarSizeSubboxComponent },
};
</script>
