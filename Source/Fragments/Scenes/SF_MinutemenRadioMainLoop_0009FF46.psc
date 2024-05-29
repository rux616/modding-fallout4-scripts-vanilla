;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MinutemenRadioMainLoop_0009FF46 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE minutemencentralscript
minutemencentralscript kmyQuest = GetOwningQuest() as minutemencentralscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "phase 1 done - check for random quest start")
kmyQuest.CheckForRandomQuest()
kmyQuest.PickNextSong()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
