<template>
  <div class="profissional-view">
    <div className="text-2xl font-bold">
      Profissionais:
    </div>
    <div v-if="useProfissionalStore().getList.length > 0">
      <div v-for="(obj, index) in useProfissionalStore().getList"
           :key="obj"
           className="font-mono">
        <profissional-box-component :obj="obj"
                                    :i="index"
                                    :isCell="isCell" />
      </div>
    </div>
    <div v-else className="py-36 font-bold text-2xl">
      Infelizmente, nenhum doutor(a) foi cadastrado!
    </div>
  </div>
</template>

<script setup>
import { useProfissionalStore } from '../store/store';
</script>

<script>
import ProfissionalBoxComponent from '../components/profissional/ProfissionalBoxComponent.vue';

export default {
  nome: 'ProfissionalView',
  components: {
    ProfissionalBoxComponent,
  },
  data() {
    return {
      isCell: false,
      windowWidth: window.innerWidth,
    };
  },
  methods: {
    onResize() {
      this.windowWidth = window.innerWidth;
    },
    verifyResize(i) {
      if (i < 768) {
        return true;
      } return false;
    },
  },
  watch: {
    windowWidth(newWidth) {
      this.isCell = this.verifyResize(newWidth);
    },
  },
  async beforeMount() {
    this.isCell = this.verifyResize(window.innerWidth);

    const store = useProfissionalStore();
    await store.requestProfissional();
  },
  mounted() {
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize);
    });
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.onResize);
  },
};
</script>
