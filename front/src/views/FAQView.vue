<!-- eslint-disable vuejs-accessibility/click-events-have-key-events -->
<template>
  <div className="home">
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          FAQ & Terms and Conditions
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
              + (isFaq ? 'font-semibold' : '')]"
                 @click="changePage(true)">
              FAQ
            </div>
            <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
            <div :className="['cursor-pointer '
              + (!isFaq ? 'font-semibold' : '')]"
                 @click="changePage(false)">
              Terms and Conditions
            </div>
          </div>
          <div class="title"
               className="text-left font-semibold
               mt-[42.5px] mb-[21.5px]">
            {{ isFaq ? 'FAQ' : 'Terms and Conditions' }}
          </div>
        </div>
        <div className="ml-auto">
          <div class="button"
               v-if="isFaq">
            <div className="px-[16px] py-[8px] font-semibold
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer"
                 @click="createFaq()">
              <v-icon name="io-add-circle-outline"
                      scale="1.25" /> Add Question
            </div>
          </div>
          <div class="subbuttons flex flex-row"
               v-if="isFaq">
            <div className="mt-[28px] mr-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer"
            @click="deleteAllFaq()">
              <v-icon name="bi-trash"
                      scale="1.25"
                      fill="#EDBD3A" /> Delete all
            </div>
            <div className="mt-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
              <v-icon name="bi-download"
                      scale="1.25"
                      fill="#EDBD3A" /> Download file
            </div>
          </div>
          <div class="subbuttons flex flex-row"
               v-if="!isFaq">
            <div className="mt-[28px] mr-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
              <v-icon name="bi-download"
                      scale="1.25"
                      fill="#EDBD3A" /> Download file
            </div>
            <div className="mt-[28px] mr-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
              <v-icon name="md-uploadfile"
                      scale="1.25"
                      fill="#EDBD3A" /> Upload a file
            </div>
            <div className="mt-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer"
            @click="editTerms()">
              <v-icon name="md-edit-outlined"
                      scale="1.25"
                      fill="#EDBD3A" /> Edit
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="faq-block">
      <f-a-q-block-component v-if="isFaq" />
      <terms-block-component v-if="!isFaq" />
    </div>
  </div>
</template>

<script setup>
import { useLoginStore, useFAQTermsStore } from '../store/store';
</script>

<script>
import FAQBlockComponent from '../components/FAQComponents/FAQBlockComponent.vue';
import TermsBlockComponent from '../components/FAQComponents/TermsBlockComponent.vue';

export default {
  name: 'FAQView',
  components: { FAQBlockComponent, TermsBlockComponent },
  data() {
    return {
      isFaq: true,
    };
  },
  methods: {
    changePage(val) {
      this.isFaq = val;
    },
    async createFaq() {
      const faqStore = useFAQTermsStore();
      await faqStore.createFAQ({
        question: '',
        answer: '',
      });
    },
    async deleteAllFaq() {
      const faqStore = useFAQTermsStore();
      await faqStore.deleteAllFAQ();
    },
    async editTerms() {
      const faqStore = useFAQTermsStore();
      await faqStore.editTerms(faqStore.getTerms().id, {
        // MUDAR TERMS
        question: '',
      });
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
