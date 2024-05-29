;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RESceneKMK08AssignHomeSce_0019433B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE rescript
rescript kmyQuest = GetOwningQuest() as rescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.REParent.WorkshopParent.AddActorToWorkshopPlayerChoice(Alias_Dog.GetActorRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Dog Auto Const
