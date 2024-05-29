;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_ChatWithNPC_Hancock_S_0105EE19 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_ChatWithNPC_HancockScript
CIS_ChatWithNPC_HancockScript kmyQuest = GetOwningQuest() as CIS_ChatWithNPC_HancockScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.iDialougeSet += 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
