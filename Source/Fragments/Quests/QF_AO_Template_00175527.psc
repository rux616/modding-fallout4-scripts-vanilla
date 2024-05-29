;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_Template_00175527 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 0, startup")
debug.trace(self + "Stage 0, myActor: " + Alias_myActor.getActorReference())
debug.trace(self + "Stage 0, myObject: " + Alias_myObject.getReference())
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
