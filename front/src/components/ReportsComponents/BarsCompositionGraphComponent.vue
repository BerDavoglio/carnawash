<template>
  <div>
    <div className="w-[815px] h-[281px] p-6
    shadow-[4px_6px_30px_0px_#00000020] flex flex-col justify-between">
      <div className="text-[16px] font-semibold text-[#3F3F44] text-left">
        Composition
      </div>
      <Bar :data="values"
           :options="options"
           style="height:174px;" />
    </div>
  </div>
</template>

<script>
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from 'chart.js';
import { Bar } from 'vue-chartjs';

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

export default {
  name: 'BarsCompositionGraphComponent',
  components: {
    Bar,
  },
  data() {
    return {
      values: {
        labels: [
          'Washes Total',
          'Payments',
          'Profit Total',
        ],
        datasets: [
          {
            label: 'Values',
            backgroundColor: ['#1486CA', '#EDBD3A', '#1C8E33'],
            data: [80000, 70000, 50000],
          },
        ],
      },
      options: {
        indexAxis: 'y',
        responsive: false,
        maintainAspectRatio: false,
        barValueSpacing: 20,
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
