;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_DLC03MQ04VREnterTermina_01007520 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04_01.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04_02.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; play holotape
DLC03MQ04Memory01Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04Memory02Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04_03.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04Memory03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04_04.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04_05.EnterVR(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04Memory04Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03MQ04Memory05Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:MQ04Script Property DLC03MQ04_02 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_01 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_03 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_04 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_05 Auto Const Mandatory

Scene Property DLC03MQ04Memory01Scene Auto Const Mandatory

Scene Property DLC03MQ04Memory02Scene Auto Const Mandatory

Scene Property DLC03MQ04Memory03Scene Auto Const Mandatory

Scene Property DLC03MQ04Memory04Scene Auto Const Mandatory

Scene Property DLC03MQ04Memory05Scene Auto Const Mandatory
