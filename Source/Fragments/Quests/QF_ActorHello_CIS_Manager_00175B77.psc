;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_ActorHello_CIS_Manager_00175B77 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE CIS_ManagerScript
Quest __temp = self as Quest
CIS_ManagerScript kmyQuest = __temp as CIS_ManagerScript
;END AUTOCAST
;BEGIN CODE
FollowersScript.Trace(self, "Stage 0, startup")
FollowersScript.Trace(self, "Stage 0, myActor: " + Alias_myActor.getActorReference())
FollowersScript.Trace(self,  "Stage 0, myObject: " + Alias_myObject.getReference())

FollowersScript.Trace(self, "Stage 0, calling StartCompanionInteractionScene()")
kmyquest.StartCompanionInteractionScene(Alias_myActor, Alias_myObject, Alias_myLocation)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 255, shutdown")
(Alias_myObject.GetReference() as AttractionObjectScript).DoMyThing(Alias_myActor.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

ReferenceAlias Property Alias_myActor Auto Const

LocationAlias Property Alias_myLocation Auto Const
