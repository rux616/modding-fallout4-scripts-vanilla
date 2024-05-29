;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity09_00145676 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_PastorClements.GetActorRef().Moveto(ClementsWeddingMarker01)
Alias_Edna.GetActorRef().Moveto(EdnaWeddingMarker01)
Alias_Zwicky.GetActorRef().Moveto(ZwickyWeddingMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
FFDiamondCity09Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Zwicky Auto Const

ReferenceAlias Property Alias_PastorClements Auto Const

ReferenceAlias Property Alias_Edna Auto Const

ObjectReference Property ZwickyWeddingMarker01 Auto Const

ObjectReference Property EdnaWeddingMarker01 Auto Const

ObjectReference Property ClementsWeddingMarker01 Auto Const

Scene Property FFDiamondCity09Scene Auto Const
