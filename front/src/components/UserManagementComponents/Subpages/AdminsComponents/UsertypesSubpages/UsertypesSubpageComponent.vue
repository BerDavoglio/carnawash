<template>
  <div>
    <usertypes-table-component @editUsertype="(val) => { this.$emit('editUsertype', val); }"
                               @deleteUsertype="(val) => { this.$emit('deleteUsertype', val); }" />
  </div>
</template>

<script>
import UsertypesTableComponent from './UsertypesTableComponent.vue';

export default {
  name: 'UsertypesSubpageComponent',
  components: { UsertypesTableComponent },
};
</script>
