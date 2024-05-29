;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01Pointer_01006635 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;During Act I, when the player completes BoSR01 or R02 for the first time,
;if BoSM01 is available, Rhys/Haylen refer the player to Paladin Danse. This objective handles that.

;Display 'Report to Paladin Danse'
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If this quest is running when the player is kicked out of the Brotherhood, just shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Complete 'Report to Paladin Danse'
SetObjectiveCompleted(10)

;Shut down the quest.
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Hide 'Report to Paladin Danse' if it wasn't completed.
;(This quest shuts down when BoSKickout occurs, or when the Prydwen arrives, and speaking to
;Danse at that point is no longer an option.)
;
if (!GetStageDone(20))
     SetObjectiveDisplayed(10, 0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
