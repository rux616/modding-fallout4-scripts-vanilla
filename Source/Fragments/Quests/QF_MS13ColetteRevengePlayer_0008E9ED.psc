;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13ColetteRevengePlayer_0008E9ED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; move Colette to interior marker and enable
Alias_Colette.GetRef().MoveTo(Alias_InteriorCenterMarker.GetRef())
Alias_Colette.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MS13ColetteFaction.SetEnemy(PlayerFaction, false, true)
Alias_Colette.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if !GetStageDone(20)
	; never encountered Colette, stop quest so it can run again
	Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; if still alive, disable
if Alias_Colette.GetActorRef().IsDead() == false
	Alias_Colette.TryToDisable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Colette Auto Const

ReferenceAlias Property Alias_InteriorCenterMarker Auto Const

Faction Property MS13ColetteFaction Auto Const

Faction Property PlayerFaction Auto Const
