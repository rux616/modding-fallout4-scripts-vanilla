;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Vault81_Tina_BobbyOD_001AC4E9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(TinaDeLucaRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TinaDeLucaRef Auto Const
workshopparentscript Property WorkshopParent Auto Const
