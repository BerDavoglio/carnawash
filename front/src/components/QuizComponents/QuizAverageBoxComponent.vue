<template>
  <div>
    <div className="w-[696px] h-[287px] p-6 shadow-[4px_6px_30px_0px_#00000020]
           rounded-lg mt-4">
      <div className="flex flex-row justify-between mb-4">
        <div className="text-[16px] font-semibold">
          Average grade 80%
          <v-icon name="la-get-pocket"
                    scale="1.5"
                    fill="#EDBD3A" />
        </div>
        <div className="text-[16px] font-semibold">
          <span className="text-[#1486CA]">1560</span> answers
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="flex flex-row mr-auto my-auto">
          <div>
            <div className="text-right text-[#1486CA]
                text-[16px] font-semibold mb-4">
              332
            </div>
            <div className="text-right text-[#79CCFF]
                text-[16px] font-semibold mb-4">
              127
            </div>
            <div className="text-right text-[#1C8E33]
                text-[16px] font-semibold">
              350
            </div>
          </div>
          <div>
            <div className="text-left text-[16px] font-normal mb-4 ml-4">
              Approved
            </div>
            <div className="text-left text-[16px] font-normal mb-4 ml-4">
              Reproved
            </div>
            <div className="text-left text-[16px] font-normal ml-4">
              Retake
            </div>
          </div>
        </div>
        <div className="w-[345px] h-[200px] row-span-3 ml-auto">
          <Doughnut :data="values"
                    :options="options" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  Chart as ChartJS, ArcElement, Tooltip, Legend,
} from 'chart.js';
import { Doughnut } from 'vue-chartjs';

ChartJS.register(ArcElement, Tooltip, Legend);

export default {
  name: 'QuizAverageBoxComponent',
  components: {
    Doughnut,
  },
  data() {
    return {
      isQuiz: true,
      values: {
        labels: ['Approved', 'Reproved', 'Retake'],
        datasets: [
          {
            backgroundColor: ['#1486CA', '#79CCFF', '#1C8E33'],
            data: [332, 127, 350],
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'right',
            labels: {
              usePointStyle: true,
              boxWidth: 10,
              boxHeight: 8,
            },
          },
        },
      },
    };
  },
};
</script>
