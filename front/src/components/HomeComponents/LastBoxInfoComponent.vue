<template>
  <div className="w-[372px] shadow-[4px_6px_30px_0px_#00000020]">
    <div className="grid grid-row-2
    h-[150px] rounded-t-[8px]
    px-[24px] py-[16px]">
      <div className="text-[16px] font-semibold text-left">
        Revenue
      </div>
      <div className="grid grid-cols-3 text-[#3F3F44] text-left font-light">
        <div className="grid grid-row-2">
          <div className="text-[12px]">
            Today
          </div>
          <div className="text-[24px]">
            $1.580
          </div>
        </div>
        <div className="grid grid-row-2">
          <div className="text-[12px]">
            Last 7 days
          </div>
          <div className="text-[24px]">
            $15.010
          </div>
        </div>
        <div className="grid grid-row-2">
          <div className="text-[12px]">
            Last 30 days
          </div>
          <div className="text-[24px]">
            $95.050
          </div>
        </div>
      </div>
    </div>
    <div className="grid grid-row-2
    h-[90px] rounded-b-[8px]
    px-[24px] py-[16px]
    bg-[#107EC4] text-white
    text-left">
      <div className="font-light text-[12px]">
        Last 12 months
      </div>
      <div className="text-[24px] font-medium">
        $1.547.687
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LastBoxInfoComponent',
};
</script>
