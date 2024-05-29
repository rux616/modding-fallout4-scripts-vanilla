;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_RR101DeaconMoveIntroPacka_000BBD8E Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Make Deacon play his fun idel once he gets to the right place
akActor.PlayIdle(pIdleDeaconGreet)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pIdleDeaconGreet Auto Const
