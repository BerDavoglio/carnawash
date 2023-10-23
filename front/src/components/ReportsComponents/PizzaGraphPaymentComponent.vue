<template>
  <div>
    <div className="w-[296px] h-[281px] p-6
    shadow-[4px_6px_30px_0px_#00000020] flex flex-col justify-between">
      <div className="text-[16px] font-semibold text-[#3F3F44] text-center">
        Payments
      </div>
      <div className="w-[128px] h-[128px] m-auto">
        <Doughnut :data="values"
                  :options="options" />
      </div>
      <div className="text-[22px] font-normal text-[#3F3F44] text-center">
        27%
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
  name: 'PizzaGraphPaymentComponent',
  components: {
    Doughnut,
  },
  data() {
    return {
      values: {
        labels: ['Payment'],
        datasets: [
          {
            backgroundColor: ['#1C8E33', '#EBF0ED'],
            data: [27, 73],
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          },
        },
      },
    };
  },
};
</script>
