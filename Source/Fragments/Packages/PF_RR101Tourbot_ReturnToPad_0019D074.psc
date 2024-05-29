;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_RR101Tourbot_ReturnToPad_0019D074 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
;akActor.SetValue(RR101_TourbotState, 1)
;if ( akActor.GetSitState() == 3 )
;  akActor.SetUnconscious(TRUE)
;endif

Debug.Trace("Working")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property RR101_TourbotState Auto Const
