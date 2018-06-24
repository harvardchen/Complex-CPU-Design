#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2017.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto f69d1cf14a51445aa6b40209d802cf1d -m64 --debug typical --relax --mt 8 --maxdelay -d "MIPS_CPU_FULL_SIMU=" -L xil_defaultlib -L simprims_ver -L secureip --snapshot mips_cpu_test_time_synth -transport_int_delays -pulse_r 0 -pulse_int_r 0 -pulse_e 0 -pulse_int_e 0 xil_defaultlib.mips_cpu_test xil_defaultlib.glbl -log elaborate.log