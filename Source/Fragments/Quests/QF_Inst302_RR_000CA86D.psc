;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst302_RR_000CA86D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
(Inst302 as Inst302QuestScript).RailroadInformed = true
Inst302.SetObjectiveCompleted(30)
BunkerHillFrontGate.SetOpen()
BunkerHillFrontGate.SetLockLevel(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Inst302 Auto Const

ObjectReference Property BunkerHillFrontGate Auto Const
