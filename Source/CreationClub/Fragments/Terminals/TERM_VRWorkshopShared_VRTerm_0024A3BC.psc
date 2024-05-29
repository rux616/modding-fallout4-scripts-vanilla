;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRTerm_0024A3BC Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopParentQuest.ExitVRSettlement()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:VRWorkshops:VRWorkshopParentScript Property VRWorkshopParentQuest Auto Const Mandatory
