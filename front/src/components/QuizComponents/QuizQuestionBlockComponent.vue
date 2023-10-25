<template>
  <div class="faq-box-component">
    <div className="max-w-[1500px] w-full py-[18px] px-[24px]
      border-1 rounded-[8px] shadow-[4px_6px_40px_0px_#00000020]
      mb-[19px]">
      <div class="menu"
           className="flex flex-row mb-[16px]">
        <div className="font-semibold">Question 1</div>
        <div className="flex flex-row ml-auto">
          <div className="ml-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
            <v-icon name="md-edit-outlined"
                    scale="1.25"
                    fill="#EDBD3A" /> Edit
          </div>
          <div className="ml-[28px] font-medium
            rounded-[10px] text-[#EDBD3A] text-[16px]
            cursor-pointer">
            <v-icon name="bi-trash"
                    scale="1.25"
                    fill="#EDBD3A" /> Delete
          </div>
        </div>
      </div>
      <input v-model="question"
             placeholder="Question"
             className="h-[16px] w-full rounded-lg bg-[#F8F8F8]
                 px-4 py-6 mb-[16px]">
      <div className="font-semibold text-left mb-[16px]">Right Answer</div>
      <input v-model="right_answer"
             placeholder="Right Answer"
             className="h-[16px] w-full rounded-lg bg-[#F8F8F8]
                 px-4 py-6 mb-[16px]">
      <div className="font-semibold text-left mb-[16px]">Other Alternatives</div>
      <input v-for="i in 4"
             v-bind:key="i"
             v-model="other[i]"
             :placeholder="'Alternative #' + i"
             className="h-[16px] w-full rounded-lg bg-[#F8F8F8]
                 px-4 py-6 mb-[16px]">
      <div className="mb-4 ml-auto">
        <div className="w-[237px] h-[44px]
        px-[16px] py-[8px] font-semibold  ml-auto
            rounded-[10px] bg-[#EDBD3A] text-black text-[16px]
            cursor-pointer">
          Save question
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'QuizQuestionBlockComponent',
  data() {
    return {
      question: '',
      right_answer: '',
      other: ['', '', '', ''],
    };
  },
};
</script>
