;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRTerm_0024A39E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;call to parent quest to initiate attacks
VRAttackQuest.StartVRAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;call to parent quest to stop attacks
VRAttackQuest.StopVRAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Generate VR Settler
VRWorkshopParent.AddVRSettler()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript Property VRAttackQuest Auto Const Mandatory
CreationClub:VRWorkshops:VRWorkshopParentScript Property VRWorkshopParent Auto Const Mandatory
