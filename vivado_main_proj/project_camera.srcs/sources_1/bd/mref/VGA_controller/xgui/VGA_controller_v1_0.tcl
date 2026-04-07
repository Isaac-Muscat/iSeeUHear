# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HF" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HMAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VF" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VMAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VR" -parent ${Page_0}


}

proc update_PARAM_VALUE.HB { PARAM_VALUE.HB } {
	# Procedure called to update HB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HB { PARAM_VALUE.HB } {
	# Procedure called to validate HB
	return true
}

proc update_PARAM_VALUE.HD { PARAM_VALUE.HD } {
	# Procedure called to update HD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HD { PARAM_VALUE.HD } {
	# Procedure called to validate HD
	return true
}

proc update_PARAM_VALUE.HF { PARAM_VALUE.HF } {
	# Procedure called to update HF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HF { PARAM_VALUE.HF } {
	# Procedure called to validate HF
	return true
}

proc update_PARAM_VALUE.HMAX { PARAM_VALUE.HMAX } {
	# Procedure called to update HMAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HMAX { PARAM_VALUE.HMAX } {
	# Procedure called to validate HMAX
	return true
}

proc update_PARAM_VALUE.HR { PARAM_VALUE.HR } {
	# Procedure called to update HR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HR { PARAM_VALUE.HR } {
	# Procedure called to validate HR
	return true
}

proc update_PARAM_VALUE.VB { PARAM_VALUE.VB } {
	# Procedure called to update VB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VB { PARAM_VALUE.VB } {
	# Procedure called to validate VB
	return true
}

proc update_PARAM_VALUE.VD { PARAM_VALUE.VD } {
	# Procedure called to update VD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VD { PARAM_VALUE.VD } {
	# Procedure called to validate VD
	return true
}

proc update_PARAM_VALUE.VF { PARAM_VALUE.VF } {
	# Procedure called to update VF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VF { PARAM_VALUE.VF } {
	# Procedure called to validate VF
	return true
}

proc update_PARAM_VALUE.VMAX { PARAM_VALUE.VMAX } {
	# Procedure called to update VMAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VMAX { PARAM_VALUE.VMAX } {
	# Procedure called to validate VMAX
	return true
}

proc update_PARAM_VALUE.VR { PARAM_VALUE.VR } {
	# Procedure called to update VR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VR { PARAM_VALUE.VR } {
	# Procedure called to validate VR
	return true
}


proc update_MODELPARAM_VALUE.HD { MODELPARAM_VALUE.HD PARAM_VALUE.HD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HD}] ${MODELPARAM_VALUE.HD}
}

proc update_MODELPARAM_VALUE.HF { MODELPARAM_VALUE.HF PARAM_VALUE.HF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HF}] ${MODELPARAM_VALUE.HF}
}

proc update_MODELPARAM_VALUE.HB { MODELPARAM_VALUE.HB PARAM_VALUE.HB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HB}] ${MODELPARAM_VALUE.HB}
}

proc update_MODELPARAM_VALUE.HR { MODELPARAM_VALUE.HR PARAM_VALUE.HR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HR}] ${MODELPARAM_VALUE.HR}
}

proc update_MODELPARAM_VALUE.HMAX { MODELPARAM_VALUE.HMAX PARAM_VALUE.HMAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HMAX}] ${MODELPARAM_VALUE.HMAX}
}

proc update_MODELPARAM_VALUE.VD { MODELPARAM_VALUE.VD PARAM_VALUE.VD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VD}] ${MODELPARAM_VALUE.VD}
}

proc update_MODELPARAM_VALUE.VF { MODELPARAM_VALUE.VF PARAM_VALUE.VF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VF}] ${MODELPARAM_VALUE.VF}
}

proc update_MODELPARAM_VALUE.VB { MODELPARAM_VALUE.VB PARAM_VALUE.VB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VB}] ${MODELPARAM_VALUE.VB}
}

proc update_MODELPARAM_VALUE.VR { MODELPARAM_VALUE.VR PARAM_VALUE.VR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VR}] ${MODELPARAM_VALUE.VR}
}

proc update_MODELPARAM_VALUE.VMAX { MODELPARAM_VALUE.VMAX PARAM_VALUE.VMAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VMAX}] ${MODELPARAM_VALUE.VMAX}
}

