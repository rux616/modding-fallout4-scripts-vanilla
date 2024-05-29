;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS07c_009_EddieWinter_000DD38A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;In case Nick is still in combat somehow, 
; clear his combat and start next scene

if !GetOwningQuest().GetStageDone(240) && !MS07c_010_EddieNick.IsPlaying()
  MS07c_010_EddieNick.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS07c_010_EddieNick Auto Const

Alias Property Alias_EddieWinter Auto Const

Alias Property Alias_NickValentine Auto Const
