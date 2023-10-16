<template>
  <div class="graph-bars"
       className="h-[311px] w-[750px]
        p-[24px] rounded-[8px]
        shadow-[4px_6px_30px_0px_#00000020]">
    <div className="w-[320px] h-[170px]">
      <Bar :data="values"
           :options="options" />
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
  name: 'GraphBarsComponent',
  components: {
    Bar,
  },
  data() {
    return {
      values: {
        labels: [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ],
        datasets: [
          {
            label: 'Washes',
            backgroundColor: '#1486CA',
            data: [3, 7, 4, 3, 7, 4, 3, 7, 4, 3, 7, 4],
          }, {
            label: 'Profit',
            backgroundColor: '#79CCFF',
            data: [4, 3, 5, 4, 3, 5, 4, 3, 5, 4, 3, 5],
          },
        ],
      },
      options: {
        responsive: false,
        maintainAspectRatio: false,
        barValueSpacing: 20,
        plugins: {
          title: {
            display: true,
            text: 'Revenue',
          },
          legend: {
            labels: {
              usePointStyle: true,
              boxHeight: 8,
            },
          },
        },
      },
    };
  },
};
</script>
