;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRPodN_0024A39D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;GNR Plaza
VRWorkshopParentScript.SetVRPodDestination(1, akTerminalRef, LinkTerminalVRWorkshopPod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Desert Island
VRWorkshopParentScript.SetVRPodDestination(2, akTerminalRef, LinkTerminalVRWorkshopPod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Atomic Crater
VRWorkshopParentScript.SetVRPodDestination(3, akTerminalRef, LinkTerminalVRWorkshopPod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
;Grid World
VRWorkshopParentScript.SetVRPodDestination(0, akTerminalRef, LinkTerminalVRWorkshopPod)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Group QuestData
	CreationClub:VRWorkshops:VRWorkshopParentScript Property VRWorkshopParentScript Auto Const Mandatory
EndGroup

Group Keywords
	Keyword Property LinkTerminalVRWorkshopPod Auto Const Mandatory
EndGroup
