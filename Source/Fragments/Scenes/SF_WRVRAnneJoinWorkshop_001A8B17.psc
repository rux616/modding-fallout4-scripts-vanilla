;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_WRVRAnneJoinWorkshop_001A8B17 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(AnnHargravesRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


workshopparentscript Property WorkshopParent Auto Const

ObjectReference Property AnnHargravesRef Auto Const
