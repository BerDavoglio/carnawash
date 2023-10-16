<template>
  <div class="graph-stars"
       className="w-[340px] h-[311px]
        p-[24px] rounded-[8px] shadow-[4px_6px_30px_0px_#00000020]
        grid grid-rows-4">
    <div className="grid grid-cols-2">
      <div className="text-[18px] font-semibold text-[#3F3F44] text-left">
        Total rating
      </div>
      <div className="text-[24px] font-semibold text-[#3F3F44] text-right">
        1080
      </div>
    </div>
    <div className="w-full h-[170px] row-span-3 m-auto">
      <div className="grid grid-cols-2">
        <div>
          <div className="grid grid-rows-5 gap-[18px]">
            <div className="grid grid-cols-7 w-[130px] h-4">
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <div className="col-span-2">687</div>
            </div>
            <div className="grid grid-cols-7 w-[130px] h-4">
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <div className="col-span-2">232</div>
            </div>
            <div className="grid grid-cols-7 w-[130px] h-4">
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <div className="col-span-2">103</div>
            </div>
            <div className="grid grid-cols-7 w-[130px] h-4">
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <div className="col-span-2">32</div>
            </div>
            <div className="grid grid-cols-7 w-[130px] h-4">
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star" fill="#EDBD3A" />
              <v-icon name="bi-star-fill" fill="#EDBD3A" />
              <div className="col-span-2">26</div>
            </div>
          </div>
        </div>
        <div className="grid grid-cols-5 mt-auto">
          <div className="text-[28px] text-[#EDBD3A] font-medium col-span-4 text-right">
            4.8
          </div>
          <v-icon name="bi-star-fill" fill="#EDBD3A" scale="1.8" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'GraphStarsComponent',
};
</script>
