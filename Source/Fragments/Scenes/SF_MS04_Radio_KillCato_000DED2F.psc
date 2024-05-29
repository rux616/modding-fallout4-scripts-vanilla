;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS04_Radio_KillCato_000DED2F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
; Stop the radio station temporarily
pRadioSilverShroudQuest_Music.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; Play the radio music again
Utility.Wait(0.1)
pRadioSilverShroudQuest_Music.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
pQSTMS04RecordScratchNeedleUp.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
pQSTMS04RecordScratchNeedleDown.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pRadioSilverShroudQuest_Music Auto Const

Sound Property pQSTMS04RecordScratchNeedleUp Auto Const

Sound Property pQSTMS04RecordScratchNeedleDown Auto Const
