<template>
  <div>
    <div class="header">
      <div className="grid grid-cols-2 justify-between
         mb-4">
        <div className="text-[30px] text-left font-semibold">
          Washer Quiz and Training
        </div>
      </div>
      <div className="h-[0.5px] w-full mr-70 bg-[#C9C9C9]" />
    </div>
    <div class="submenu"
         className="mt-[21px]">
      <div className="mr-auto">
        <div class="menu"
             className="flex flex-row
               text-[16px] font-normal">
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div :className="['mr-[57px] cursor-pointer '
            + (this.isQuiz ? 'font-semibold' : '')]"
               @click="changePage(true)">
            Quiz
          </div>
          <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
          <div :className="['cursor-pointer '
            + (!this.isQuiz ? 'font-semibold' : '')]"
               @click="changePage(false)">
            Training
          </div>
        </div>
      </div>
    </div>
    <div class="boxes">
      <div className="flex flex-row justify-between">
        <quiz-statistics-box-component />
        <quiz-average-box-component />
      </div>
    </div>
    <div>
      <div className="my-4">
        <div className="w-[237px] h-[44px]
        px-[16px] py-[8px] font-semibold  ml-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
          <v-icon name="bi-plus-circle"
                  scale="1.25"
                  fill="black" />Add question
        </div>
      </div>
      <div className="flex flex-row mb-4">
        <div className="text-[16px] font-semibold">Questionare</div>
        <div class="subbuttons flex flex-row ml-auto">
          <div className="mr-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
            <v-icon name="bi-trash"
                    scale="1.25"
                    fill="#EDBD3A" /> Delete all
          </div>
          <div className="font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
            <v-icon name="bi-download"
                    scale="1.25"
                    fill="#EDBD3A" /> Download file
          </div>
        </div>
      </div>
      <quiz-question-block-component />
    </div>
  </div>
</template>

<script>
import QuizStatisticsBoxComponent from '../components/QuizComponents/QuizStatisticsBoxComponent.vue';
import QuizAverageBoxComponent from '../components/QuizComponents/QuizAverageBoxComponent.vue';
import QuizQuestionBlockComponent from '../components/QuizComponents/QuizQuestionBlockComponent.vue';

export default {
  name: 'QuizView',
  components: {
    QuizStatisticsBoxComponent,
    QuizAverageBoxComponent,
    QuizQuestionBlockComponent,
  },
  data() {
    return {
      isQuiz: true,
    };
  },
  methods: {
    changePage(val) {
      this.isQuiz = val;
    },
  },
};
</script>
