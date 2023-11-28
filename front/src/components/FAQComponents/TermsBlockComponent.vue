<template>
  <div class="terms-box-component">
    <div className="max-w-[1500px] w-full h-[775px] py-[18px] px-[24px]
      border-1 rounded-[8px] shadow-[4px_6px_40px_0px_#00000020]
      mb-[19px]">
      <textarea v-model="question"
                placeholder="Question"
                aria-label="question"
                className="h-[723px] w-full rounded-lg bg-[#F8F8F8]
                 p-4 mb-[16px] scrollbar scrollbar-thumb-[#EDBD3A]
                  scrollbar-track-[#D9D9D9] scrollbar-thumb-rounded
                  resize-none" />
    </div>
  </div>
</template>

<script setup>
import { useFAQTermsStore } from '../../store/store';
</script>

<script>
export default {
  name: 'FAQBlockComponent',
  data() {
    return {
      question: '',
    };
  },
  methods: {
    async update(id, obj) {
      const store = useFAQTermsStore();
      await store.editFAQ(id, obj);
    },
    async delete(id) {
      const store = useFAQTermsStore();
      await store.deleteOneFAQ(id);
    },
  },
  async beforeMount() {
    const store = useFAQTermsStore();
    await store.requestTerms();

    this.question = store.getTerms.question;
  },
};
</script>
