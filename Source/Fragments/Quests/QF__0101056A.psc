;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0101056A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Start DN151 - Weston / Graygarden quest.
if (!DN151.IsRunning())
     DN151.Start()
EndIf

;Send story event for the Minutemen, to make sure everything has started properly.
MinRecruitmentStart.SendStoryEvent(akLoc = GraygardenLocation)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN151 Auto Const

Location Property GraygardenLocation Auto Const

Keyword Property MinRecruitmentStart Auto Const
