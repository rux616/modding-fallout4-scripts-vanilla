;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01Gauntlet_GasTrap_0102D83A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.PlayGasTrapScene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
