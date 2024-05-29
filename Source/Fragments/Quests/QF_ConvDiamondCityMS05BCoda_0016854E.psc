;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_ConvDiamondCityMS05BCoda_0016854E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;debug.trace(self + "Player has changed locations.")

Alias_Wellingham.GetActorRef().EvaluatePackage()
Alias_CodaTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Firing Codman and Wellingham scene if they're still both with us
if !Alias_Wellingham.GetActorRef().IsDead() && !Alias_ClarenceCodman.GetActorRef().IsDead()
  pCodmanCodaScene.Start()
else
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pWellinghamMarker Auto Const

ObjectReference Property pCodmanMarker Auto Const

ReferenceAlias Property Alias_Wellingham Auto Const

ReferenceAlias Property Alias_ClarenceCodman Auto Const

Scene Property pCodmanCodaScene Auto Const

ReferenceAlias Property Alias_CodaTrigger Auto Const Mandatory
