<template>
  <div>
    <div className="w-[696px] h-[287px] p-6 shadow-[4px_6px_30px_0px_#00000020]
           rounded-lg mt-4">
      <div className="flex flex-row justify-between mb-4">
        <div className="text-[16px] font-semibold">Quiz Statistics</div>
        <div className="text-[16px] font-semibold">
          <span className="text-[#1486CA]">
            {{
              this.values.datasets[0].data.reduce((partialSum, a) => partialSum + a, 0)
            }}</span> answers
        </div>
      </div>
      <div className="flex flex-row justify-between">
        <div className="w-[345px] h-[200px] row-span-3 mr-auto">
          <Doughnut :data="values"
                    :options="options" />
        </div>
        <div className="grid grid-cols-2 gap-4 my-auto mr-4">
          <div>
            <div className="text-right text-[#1486CA]
                text-[16px] font-semibold">
              {{ this.values.datasets[0].data[0] }}
            </div>
            <div className="text-right text-[#FBC820]
                text-[16px] font-semibold">
              {{ this.values.datasets[0].data[1] }}
            </div>
            <div className="text-right text-[#79CCFF]
                text-[16px] font-semibold">
              {{ this.values.datasets[0].data[2] }}
            </div>
            <div className="text-right text-[#E5333E]
                text-[16px] font-semibold">
              {{ this.values.datasets[0].data[3] }}
            </div>
            <div className="text-right text-[#1C8E33]
                text-[16px] font-semibold">
              {{ this.values.datasets[0].data[4] }}
            </div>
          </div>
          <div>
            <div className="text-left text-[16px] font-normal">
              0% to 10%
            </div>
            <div className="text-left text-[16px] font-normal">
              10% to 30%
            </div>
            <div className="text-left text-[16px] font-normal">
              30% to 60%
            </div>
            <div className="text-left text-[16px] font-normal">
              60% to 80%
            </div>
            <div className="text-left text-[16px] font-normal">
              100%
            </div>
          </div>
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
  name: 'QuizStatisticsBoxComponent',
  components: {
    Doughnut,
  },
  data() {
    return {
      isQuiz: true,
      values: {
        labels: ['0% to 10%', '10% to 30%', '30% to 60%', '60% to 80%', '100%'],
        datasets: [
          {
            backgroundColor: ['#1486CA', '#FBC820', '#79CCFF', '#E5333E', '#1C8E33'],
            // MUDAR VALORES
            data: [332, 233, 127, 232, 350],
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
    await storeQuiz.requestStatistics();

    this.values.datasets[0].data = storeQuiz.getStatistics;
  },
};
</script>
