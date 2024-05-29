;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_EE_NoticeFriendlyCorpseCo_000795A4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; set stage 50 if any allies found
if Alias_Allies.GetCount() > 0
  setStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
actor myActor = Alias_Actor1.GetActorRef()
EEScript.GetScript().IncrementSuspicionEventCount(myActor, 2)
myActor = Alias_Actor2.GetActorRef()
EEScript.GetScript().IncrementSuspicionEventCount(myActor, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; make suspicious if this has happened multiple times
actor myActor = Alias_Actor1.GetActorRef()
ObjectReference myObject = Alias_Corpse.GetRef()
EEScript.GetScript().CheckSuspicionFaction(myActor, myObject, Alias_Allies)
; actor2 also suspicious
Alias_Actor2.GetActorRef().SetValue(Game.GetSuspiciousAV(), 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Allies Auto Const

ReferenceAlias Property Alias_Actor1 Auto Const

ReferenceAlias Property Alias_Actor2 Auto Const

ReferenceAlias Property Alias_Corpse Auto Const

ActorValue Property Suspicious auto Const
