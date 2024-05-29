;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01009B71 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player is in range of Varham's pulser. Update BoSM01.
BoSM01.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Player has taken the pulser. Shut down the radio.
BoSM01RadioVarham.Stop()

;If all pulsers taken, shut down the quest.
if (GetStageDone(61) && GetStageDone(71) && GetStageDone(81))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Player is in range of Astlin's pulser. Update BoSM01.
BoSM01.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
;Player has taken the pulser. Shut down the radio.
BoSM01RadioAstlin.Stop()

;If all pulsers taken, shut down the quest.
if (GetStageDone(61) && GetStageDone(71) && GetStageDone(81))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Player is in range of Faris' pulser. Update BoSM01.
BoSM01.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
;Player has taken the pulser. Shut down the radio.
BoSM01RadioFaris.Stop()

;If all pulsers taken, shut down the quest.
if (GetStageDone(61) && GetStageDone(71) && GetStageDone(81))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Shut down the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Scene Property BoSM01RadioVarham Auto Const
Scene Property BoSM01RadioAstlin Auto Const
Scene Property BoSM01RadioFaris Auto Const

Quest Property BoSM01 Auto Const
