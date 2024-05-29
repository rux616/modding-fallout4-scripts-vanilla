;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS303LL_00162A3E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Player has arrived at the airport

if BoS302.GetStageDone(255) == 1
BoS303.SetStage(200)
endif

if BoS201.GetStageDone(255) == 1 && BoS301.GetStageDone(10) == 0
BoS303.SetStage(210)
endif

if BoS302.GetStageDone(255) == 0 &&  BoS301.GetStageDone(10) == 1
BoS303.SetStage(220)
endif

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS303 Auto Const

Quest Property BoS302 Auto Const

Quest Property BoS301 Auto Const

Quest Property BoS201 Auto Const
