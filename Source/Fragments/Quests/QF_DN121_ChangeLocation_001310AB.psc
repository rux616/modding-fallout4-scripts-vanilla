;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN121_ChangeLocation_001310AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Start DN151 - Weston / Graygarden quest
;Send story event for the Minutemen, to make sure everything has started properly.
MinRecruitmentStart.SendStoryEvent(akLoc = FinchFarmLocation, akRef1 = FinchFarmWorkshopRef)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN121 Auto Const

Keyword Property MinRecruitmentStart Auto Const

Location Property FinchFarmLocation Auto Const

workshopscript Property FinchFarmWorkshopRef Auto Const Mandatory
