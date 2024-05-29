;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_ScriptEvent_CIS_Manager_00176108 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE CIS_ManagerScript
Quest __temp = self as Quest
CIS_ManagerScript kmyQuest = __temp as CIS_ManagerScript
;END AUTOCAST
;BEGIN CODE
FollowersScript.trace(self,"Stage 0, startup")
FollowersScript.trace(self, "Stage 0, myActor: " + Alias_myActor.getActorReference())

;SEE CIS_ScriptEventSenderActorScript which sends the story event that starts this quest
;Piper's get discounts from vendors used to be fired off from here, but that is not longer in game
;AT THE MOMENT, NOTHING IS STARTING THIS QUEST
;AND NOTHING IS DONE BY THIS QUEST
;Keeping this around in case there's some other CIS thing that needs to be fired off by CIS_ScriptEventSenderActorScript 

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 255, shutdown")
;(Alias_myObject.GetReference() as AttractionObjectScript).DoMyThing(Alias_myActor.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myActor Auto Const

LocationAlias Property Alias_myLocation Auto Const

ReferenceAlias Property Alias_myNearbyVendor Auto Const

GlobalVariable Property CIS_Type_PiperVendorDiscountReminder Auto Const
