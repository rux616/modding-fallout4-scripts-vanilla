;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_V81_03TinaEnd_001810C4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(TinaDeLucaRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TinaDeLucaRef Auto Const
workshopparentscript Property WorkshopParent Auto Const
