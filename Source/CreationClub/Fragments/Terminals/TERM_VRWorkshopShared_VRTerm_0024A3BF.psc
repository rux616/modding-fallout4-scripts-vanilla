;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRTerm_0024A3BF Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Go back to worldspace default weather
Weather.ReleaseOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthClear.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthMisty.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthFoggy.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthOvercast.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopShared_CommonwealthGSRadstormNoHazard.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthRain.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopShared_CommonwealthGSOvercastNoHazard.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
CommonwealthMistyRainy.ForceActive(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weather Property CommonwealthClear Auto Const

Weather Property CommonwealthFoggy Auto Const

Weather Property CommonwealthMisty Auto Const

Weather Property CommonwealthMistyRainy Auto Const

Weather Property CommonwealthOvercast Auto Const

Weather Property CommonwealthRain Auto Const

Weather Property VRWorkshopShared_CommonwealthGSOvercastNoHazard Auto Const

Weather Property VRWorkshopShared_CommonwealthGSRadstormNoHazard Auto Const
