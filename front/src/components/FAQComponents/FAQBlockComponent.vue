<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div class="faq-box-component"
       v-for="faq in listFaq"
       v-bind:key="faq">
    <div className="max-w-[1500px] w-full h-[383px] py-[18px] px-[24px]
      border-1 rounded-[8px] shadow-[4px_6px_40px_0px_#00000020]
      mb-[19px]">
      <div class="menu"
           className="flex flex-row mb-[16px]">
        <div className="font-semibold">Question</div>
        <div className="flex flex-row ml-auto">
          <div className="ml-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer"
               @click="update(faq.id, faq)">
            <v-icon name="md-edit-outlined"
                    scale="1.25"
                    fill="#EDBD3A" /> Edit
          </div>
          <div className="ml-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer"
               @click="this.delete(faq.id)">
            <v-icon name="bi-trash"
                    scale="1.25"
                    fill="#EDBD3A" /> Delete
          </div>
        </div>
      </div>
      <input v-model="faq.question"
             placeholder="Question"
             className="h-[16px] w-full rounded-lg bg-[#F8F8F8]
                 px-4 py-6 mb-[16px]">
      <div className="font-semibold text-left mb-[16px]">Answer</div>
      <textarea v-model="faq.answer"
                placeholder="Question"
                aria-label="question"
                className="h-[200px] w-full rounded-lg bg-[#F8F8F8]
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
      listFaq: [],
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
    await store.requestFAQs();

    this.listFaq = store.getFAQ;
  },
};
</script>
