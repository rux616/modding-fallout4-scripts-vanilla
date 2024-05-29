;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Min01PrestonIntroTransiti_0006BA3F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; stop MinRecruit00 if stage 20 not set
If MinRecruit00.IsRunning() && MinRecruit00.GetStageDone(20) == false
	MinRecruit00.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
; try to start MinRecruit00
If MinRecruit00.IsRunning() == false
  MinRecruit00.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MinRecruit00 Auto Const
