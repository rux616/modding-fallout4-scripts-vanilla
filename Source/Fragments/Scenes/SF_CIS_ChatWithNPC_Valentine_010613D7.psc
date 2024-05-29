;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_ChatWithNPC_Valentine_010613D7 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_ChatWithNPC_ValentineScript
CIS_ChatWithNPC_ValentineScript kmyQuest = GetOwningQuest() as CIS_ChatWithNPC_ValentineScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.iDialogueCount += 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
