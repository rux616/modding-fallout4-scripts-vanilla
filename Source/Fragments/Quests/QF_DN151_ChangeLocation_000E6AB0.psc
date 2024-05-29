;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN151_ChangeLocation_000E6AB0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Start DN151 - Weston / Graygarden quest
;Send story event for the Minutemen, to make sure everything has started properly.
MinRecruitmentStart.SendStoryEvent(akLoc = GraygardenLocation, akRef1 = GraygardenWorkshopRef)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN151 Auto Const

Location Property GraygardenLocation Auto Const

Keyword Property MinRecruitmentStart Auto Const

workshopscript Property GraygardenWorkshopRef Auto Const Mandatory
