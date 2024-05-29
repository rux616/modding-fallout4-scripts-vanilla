;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSR04_AO_SetStage_000CF3E3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 0: Start up")

;Setting stage in BoSR04 for protect scribe objective
pBoSR04.SetStage(50)
Alias_myActor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Setting stage in BoSR04 for return objective
pBoSR04.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pBoSR04 Auto Const

ReferenceAlias Property Alias_myObject Auto Const

ReferenceAlias Property Alias_myActor Auto Const
