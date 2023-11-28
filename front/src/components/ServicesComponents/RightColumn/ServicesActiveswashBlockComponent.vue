<template>
  <div>
    <div className="w-[742px] p-6
    shadow-[4px_6px_30px_0px_#00000020] mt-4">
      <div className="text-left font-semibold text-[16px]">
        Active regular washes
      </div>
      <regular-wash-subbox-component />
    </div>
  </div>
</template>

<script>
import RegularWashSubboxComponent from './RegularWashSubboxComponent.vue';

export default {
  name: 'ServicesActiveswashBlockComponent',
  components: { RegularWashSubboxComponent },
};
</script>
