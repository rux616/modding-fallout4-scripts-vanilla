;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CIS_ChatWithNPC_Deacon_0018778C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 0 - startup")

;REMINDER! Set "Scene to Stop" data on the BailOut script attached to the Companion Alias
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; No longer in the chat faction (so this is said only once)
Alias_Target.GetActorRef().RemoveFromFaction(pCIS_ChatWithNPCFaction_Deacon)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 255 - shutdown")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pCIS_ChatWithNPCFaction_Deacon Auto Const

ReferenceAlias Property Alias_target Auto Const
