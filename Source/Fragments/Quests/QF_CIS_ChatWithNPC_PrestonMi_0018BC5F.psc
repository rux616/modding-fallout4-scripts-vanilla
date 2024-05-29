;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CIS_ChatWithNPC_PrestonMi_0018BC5F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 0 - startup")

;REMINDER! Set "Scene to Stop" data on the BailOut script attached to the Companion Alias
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 255 - shutdown")
; flag NPC as chatted with Preston
Alias_Target.TryToSetValue(MinPrestonChat, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Target Auto Const

ActorValue Property MinPrestonChat Auto Const
