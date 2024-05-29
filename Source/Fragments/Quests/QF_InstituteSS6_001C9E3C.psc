;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstituteSS6_001C9E3C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Run on quest start

;Move Dean Volkert to scene marker
DeanVolkertRef.MoveTo(InstituteSS6VolkertMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Start the scene (set when the player enters InstituteSS6SetStageTrigger)
InstituteSS6Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property InstituteSS3Scene Auto Const

Scene Property InstituteSS4Scene Auto Const

Scene Property InstituteSS6Scene Auto Const

ObjectReference Property DeanVolkertRef Auto Const

ObjectReference Property InstituteSS6VolkertMarker Auto Const
