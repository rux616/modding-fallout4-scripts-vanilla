;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ00Radio_01007D20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Turn on Radio.
;Stage set on DLC01MQ00 Stage 10.
DLC04MQ00PromotionalRadioRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player listened to radio and heard location. Advance main quest.
;Stage set in DLC04MQ00RadioScene Phase 3.
DLC04MQ00.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Radio was turned off.
DLC04MQ00PromotionalRadioRef.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04MQ00PromotionalRadioRef Auto Const Mandatory

Quest Property DLC04MQ00 Auto Const Mandatory
