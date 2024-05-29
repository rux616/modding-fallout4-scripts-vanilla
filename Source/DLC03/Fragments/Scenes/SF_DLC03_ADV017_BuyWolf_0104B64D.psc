;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03_ADV017_BuyWolf_0104B64D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE DLC03:ADV017QuestScript
DLC03:ADV017QuestScript kmyQuest = GetOwningQuest() as DLC03:ADV017QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.WorkshopParent.AddActorToWorkshopPlayerChoice(Alias_Wolf.GetActorRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Wolf Auto Const
