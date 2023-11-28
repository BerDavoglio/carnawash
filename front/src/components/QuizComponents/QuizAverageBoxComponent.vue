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
          <span className="text-[#1486CA]">
            {{
              this.values.datasets[0].data.reduce((partialSum, a) => partialSum + a, 0)
            }}</span> answers
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="flex flex-row mr-auto my-auto">
          <div>
            <div className="text-right text-[#1486CA]
                text-[16px] font-semibold mb-4">
              {{ this.values.datasets[0].data[0] }}
            </div>
            <div className="text-right text-[#79CCFF]
                text-[16px] font-semibold mb-4">
              {{ this.values.datasets[0].data[1] }}
            </div>
          </div>
          <div>
            <div className="text-left text-[16px] font-normal mb-4 ml-4">
              Approved
            </div>
            <div className="text-left text-[16px] font-normal mb-4 ml-4">
              Reproved
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
import { useQuizStore } from '../../store/store';

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
        labels: ['Approved', 'Reproved'],
        datasets: [
          {
            backgroundColor: ['#1486CA', '#79CCFF'],
            // MUDAR VALORES
            data: [332, 127],
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
  async beforeMount() {
    const storeQuiz = useQuizStore();
    await storeQuiz.requestAverage();

    this.values.datasets[0].data = storeQuiz.getAverage;
  },
};
</script>
