<template>
  <div>
    <div className="w-full h-[318px] p-6 shadow-[4px_6px_30px_0px_#00000020]
    flex flex-col justify-between">
      <div className="flex flex-row justify-between">
        <div className="text-[16px] font-semibold text-[#3F3F44]">
          Composition
        </div>
        <div className="text-[16px] font-normal text-[#3F3F44] flex flex-row">
          <div>Washes</div>
          <div>Profit</div>
        </div>
        <div className="text-[12px] font-semibold text-[#3F3F44]">
          Last 12 months
        </div>
      </div>
      <Bar :data="values"
           :options="options"
           style="height:215px; width: 100%" />
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
  name: 'BarsGraphComponent',
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
          legend: {
            display: false,
          },
        },
      },
    };
  },
};
</script>
