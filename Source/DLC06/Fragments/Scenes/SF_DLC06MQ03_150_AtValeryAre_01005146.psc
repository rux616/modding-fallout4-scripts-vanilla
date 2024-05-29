;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Scenes:SF_DLC06MQ03_150_AtValeryAre_01005146 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN CODE
; reset confirmation value
DLC06OverseerExpelled.SetValue(-1)

int result = DLC06MQ03OverseerExpelledConfirmation.Show()
DLC06OverseerExpelled.SetValue(result)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLC06MQ03OverseerExpelledConfirmation Auto Const Mandatory

GlobalVariable Property DLC06OverseerExpelled Auto Const Mandatory
