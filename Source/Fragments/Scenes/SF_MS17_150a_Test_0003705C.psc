;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS17_150a_Test_0003705C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE ms17questscript
ms17questscript kmyQuest = GetOwningQuest() as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Make it so the player can move again
kmyQuest.LockPCControls(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
