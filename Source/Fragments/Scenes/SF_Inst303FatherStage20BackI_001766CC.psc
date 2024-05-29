;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst303FatherStage20BackI_001766CC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE Inst303QuestScript
Inst303QuestScript kmyQuest = GetOwningQuest() as Inst303QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TeleportShaun()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property shaun Auto Const
