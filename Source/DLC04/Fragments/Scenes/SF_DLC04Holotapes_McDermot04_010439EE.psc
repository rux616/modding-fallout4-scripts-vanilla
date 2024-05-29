;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04Holotapes_McDermot04_010439EE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(80) == 0 && PDLC04SafariAdventureQuest.getstage() < 80
  PDLC04SafariAdventureQuest.setstage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04SafariAdventureQuest Auto Const Mandatory
