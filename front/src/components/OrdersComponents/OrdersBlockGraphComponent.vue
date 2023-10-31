<template>
  <div>
    <div className="flex flex-row justify-between mt-4">
      <div class="graph">
        <div className="h-[482px] w-[979px]
        p-[24px] rounded-[8px]
        shadow-[4px_6px_30px_0px_#00000020]">
          <div className="flex flex-col justify-between h-full">
            <div className="flex flex-row justify-between">
              <div className="text-[16px] font-semibold text-[#3F3F44]">
                Washes
              </div>
              <div className="text-[16px] font-normal text-[#3F3F44] flex flex-row">
                <div className="flex flex-row">
                  <div className="w-2 h-2 rounded-full bg-[#1486CA] mx-2"
                       style="margin-top: auto;
                  margin-bottom: auto;" />
                  Done
                </div>
                <div className="flex flex-row">
                  <div className="w-2 h-2 rounded-full bg-[#79CCFF] mx-2"
                       style="margin-top: auto;
                  margin-bottom: auto;" />
                  Rescheduled
                </div>
                <div className="flex flex-row">
                  <div className="w-2 h-2 rounded-full bg-[#E5E5E5] mx-2"
                       style="margin-top: auto;
                  margin-bottom: auto;" />
                  Cancelled
                </div>
              </div>
              <div className="text-[12px] font-semibold text-[#3F3F44]">
                Last 12 months
              </div>
            </div>
            <div className="">
              <Bar :data="values"
                   :options="options"
                   style="height: 353px; width: 100%;" />
            </div>
          </div>
        </div>
      </div>
      <div class="date-picker">
        <div className="h-[482px] w-[499px]
        py-[24px] rounded-[8px]
        shadow-[4px_6px_30px_0px_#00000020]">
          <div className="text-[16px] font-semibold text-left ml-[40px]">Date Filter</div>
          <div className="h-[390px]">
            <v-date-picker v-model="date"
                           style="width: 100%;" />
          </div>
        </div>
      </div>
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
  name: 'OrdersBlockGraphComponent',
  components: {
    Bar,
  },
  data() {
    return {
      date: new Date(),
      values: {
        labels: [
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday',
          'Sunday',
        ],
        datasets: [
          {
            label: 'Done',
            backgroundColor: '#1486CA',
            data: [60, 30, 50, 80, 10, 50, 60],
          }, {
            label: 'Rescheduled',
            backgroundColor: '#79CCFF',
            data: [30, 15, 25, 40, 3, 35, 40],
          }, {
            label: 'Cancelled',
            backgroundColor: '#E5E5E5',
            data: [4, 3, 5, 4, 3, 5, 4, 3],
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
