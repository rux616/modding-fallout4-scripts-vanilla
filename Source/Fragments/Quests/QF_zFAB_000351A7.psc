;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_zFAB_000351A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
; If the quest hasn't started
if ( Quest_SilverShroud.GetCurrentStageID() < 100 )
  ;Debug.Trace("1st check")
  Game.GetPlayer().MoveTo(pMemoryDenStart)

; If the PC is on the quest to get the Shroud of Ages
elseif ( Quest_SilverShroud.GetCurrentStageID() < 200 )
  ;Debug.Trace("2nd check")
  Game.GetPlayer().MoveTo(pGNNStart)

; If the PC has the Shroud of Ages and needs to turn it in
elseif ( Quest_SilverShroud.GetCurrentStageID() < 300 )
  Game.GetPlayer().MoveTo(pMemoryDenStart)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Quest_SilverShroud Auto Const

ObjectReference Property pMemoryDenStart Auto Const

ObjectReference Property pGNNStart Auto Const
