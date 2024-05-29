;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN035_CallInRobotsScene_0100396B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DN035QuestScript
DN035QuestScript kmyQuest = GetOwningQuest() as DN035QuestScript
;END AUTOCAST
;BEGIN CODE
if (!Raider01.GetActorRef().IsDead())
     kmyQuest.SetStage(21)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Raider01 Auto Const
