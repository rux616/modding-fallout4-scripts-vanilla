;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN089OperatingTheaterTe_00145074 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
pMedfordOperatingTheaterLightEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
pMedfordOperatingTheaterLightEnabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if pMedfordOperatingRadio.IsRadioOn()
   pMedfordOperatingRadio.setRadioOn(false)
elseif pMedfordOperatingRadio.IsRadioOn() == false
   pMedfordOperatingRadio.setRadioOn()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMedfordOperatingTheaterLightEnabler Auto Const

ObjectReference Property pMedfordOperatingRadio Auto Const
