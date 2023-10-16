<template>
  <div class="graph-pizza"
       className="w-[370px] h-[311px]
        p-[24px] rounded-[8px] shadow-[4px_6px_30px_0px_#00000020]
        grid grid-rows-4">
    <div className="text-[16px] font-semibold text-[#3F3F44] text-left">
      Most used<br />Aditional Services
    </div>
    <div className="w-[320px] h-[170px] row-span-3 m-auto">
      <Doughnut :data="values"
                :options="options" />
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
  name: 'GraphPizzaComponent',
  components: {
    Doughnut,
  },
  data() {
    return {
      values: {
        labels: ['Pet Hair', 'Extra dirty', 'Seats wiped', 'Heavy dirty'],
        datasets: [
          {
            backgroundColor: ['#FBC820', '#1486CA', '#1C8E33', '#E5333E'],
            data: [40, 20, 80, 10],
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
