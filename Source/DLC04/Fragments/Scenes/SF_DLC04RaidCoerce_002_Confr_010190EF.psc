;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidCoerce_002_Confr_010190EF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
DLC04:DLC04RaidCoerceScript kmyQuest = GetOwningQuest() as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CalculateIntimidationValue(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
DLC04:DLC04RaidCoerceScript kmyQuest = GetOwningQuest() as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CalculateIntimidationValue(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
