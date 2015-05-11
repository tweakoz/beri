# TCL File Generated by Component Editor 12.1
# Sun Mar 24 22:16:37 GMT 2013
# DO NOT MODIFY


# 
# PixelStreamHDMI "Pixel Stream HDMI" v1.0
# Simon Moore 2013.03.24.22:16:37
# Stream pixels from DDR2 memory to HDMI output
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module PixelStreamHDMI
# 
set_module_property DESCRIPTION "Stream pixels from DDR2 memory to HDMI output"
set_module_property NAME PixelStreamHDMI
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP Cheri_Video
set_module_property AUTHOR "Simon Moore"
set_module_property DISPLAY_NAME "Pixel Stream HDMI"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL mkPixelStream
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file mkPixelStream.v VERILOG PATH mkPixelStream.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clockreset
# 
add_interface clockreset clock end
set_interface_property clockreset clockRate 0
set_interface_property clockreset ENABLED true

add_interface_port clockreset csi_clockreset_clk clk Input 1


# 
# connection point clockreset_reset
# 
add_interface clockreset_reset reset end
set_interface_property clockreset_reset associatedClock clockreset
set_interface_property clockreset_reset synchronousEdges DEASSERT
set_interface_property clockreset_reset ENABLED true

add_interface_port clockreset_reset csi_clockreset_reset_n reset_n Input 1


# 
# connection point slave_parameters
# 
add_interface slave_parameters avalon end
set_interface_property slave_parameters addressUnits WORDS
set_interface_property slave_parameters associatedClock clockreset
set_interface_property slave_parameters associatedReset clockreset_reset
set_interface_property slave_parameters bitsPerSymbol 8
set_interface_property slave_parameters burstOnBurstBoundariesOnly false
set_interface_property slave_parameters burstcountUnits WORDS
set_interface_property slave_parameters explicitAddressSpan 0
set_interface_property slave_parameters holdTime 0
set_interface_property slave_parameters linewrapBursts false
set_interface_property slave_parameters maximumPendingReadTransactions 0
set_interface_property slave_parameters readLatency 0
set_interface_property slave_parameters readWaitTime 1
set_interface_property slave_parameters setupTime 0
set_interface_property slave_parameters timingUnits Cycles
set_interface_property slave_parameters writeWaitTime 0
set_interface_property slave_parameters ENABLED true

add_interface_port slave_parameters avs_s0_address address Input 4
add_interface_port slave_parameters avs_s0_writedata writedata Input 32
add_interface_port slave_parameters avs_s0_write write Input 1
add_interface_port slave_parameters avs_s0_read read Input 1
add_interface_port slave_parameters avs_s0_readdata readdata Output 32
add_interface_port slave_parameters avs_s0_waitrequest waitrequest Output 1
set_interface_assignment slave_parameters embeddedsw.configuration.isFlash 0
set_interface_assignment slave_parameters embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment slave_parameters embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment slave_parameters embeddedsw.configuration.isPrintableDevice 0


# 
# connection point master_burstreads
# 
add_interface master_burstreads avalon start
set_interface_property master_burstreads addressUnits WORDS
set_interface_property master_burstreads associatedClock clockreset
set_interface_property master_burstreads associatedReset clockreset_reset
set_interface_property master_burstreads bitsPerSymbol 8
set_interface_property master_burstreads burstOnBurstBoundariesOnly true
set_interface_property master_burstreads burstcountUnits WORDS
set_interface_property master_burstreads doStreamReads false
set_interface_property master_burstreads doStreamWrites false
set_interface_property master_burstreads holdTime 0
set_interface_property master_burstreads linewrapBursts false
set_interface_property master_burstreads maximumPendingReadTransactions 8
set_interface_property master_burstreads readLatency 0
set_interface_property master_burstreads readWaitTime 1
set_interface_property master_burstreads setupTime 0
set_interface_property master_burstreads timingUnits Cycles
set_interface_property master_burstreads writeWaitTime 0
set_interface_property master_burstreads ENABLED true

add_interface_port master_burstreads avm_m0_readdata readdata Input 256
add_interface_port master_burstreads avm_m0_readdatavalid readdatavalid Input 1
add_interface_port master_burstreads avm_m0_waitrequest waitrequest Input 1
add_interface_port master_burstreads avm_m0_writedata writedata Output 256
add_interface_port master_burstreads avm_m0_address address Output 29
add_interface_port master_burstreads avm_m0_read read Output 1
add_interface_port master_burstreads avm_m0_write write Output 1
add_interface_port master_burstreads avm_m0_burstcount burstcount Output 4


# 
# connection point video
# 
add_interface video clock end
set_interface_property video clockRate 0
set_interface_property video ENABLED true

add_interface_port video csi_video_clk clk Input 1


# 
# connection point conduit_end_0
# 
add_interface conduit_end_0 conduit end
set_interface_property conduit_end_0 associatedClock video
set_interface_property conduit_end_0 associatedReset ""
set_interface_property conduit_end_0 ENABLED true

add_interface_port conduit_end_0 coe_hdmi_r export Output 12
add_interface_port conduit_end_0 coe_hdmi_g export Output 12
add_interface_port conduit_end_0 coe_hdmi_b export Output 12
add_interface_port conduit_end_0 coe_hdmi_hsd export Output 1
add_interface_port conduit_end_0 coe_hdmi_vsd export Output 1
add_interface_port conduit_end_0 coe_hdmi_de export Output 1
