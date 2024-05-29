;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS11_0920_IronsidesCountd_00096EA8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE ms11script
ms11script kmyQuest = GetOwningQuest() as ms11script
;END AUTOCAST
;BEGIN CODE
; Increment the timing on when Ironsides keeps talking
kmyQuest.nCountdownWaiting += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE ms11script
ms11script kmyQuest = GetOwningQuest() as ms11script
;END AUTOCAST
;BEGIN CODE
; Zero out the dialogue counter
kmyQuest.nCountdownWaiting = 0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
