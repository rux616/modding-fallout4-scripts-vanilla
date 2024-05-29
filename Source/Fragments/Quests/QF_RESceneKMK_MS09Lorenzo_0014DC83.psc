;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneKMK_MS09Lorenzo_0014DC83 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move NPCs into position
Alias_Lorenzo.TryToMoveTo(Alias_SceneMarkerA1.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
RESceneKMK_MS09LorenzoLooping.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
; move Lorenzo home (if player isn't in Cabot house)
if Alias_CabotHouseMarker.GetRef().GetParentCell() != Game.GetPlayer().GetParentCell()
	actor lorenzo = Alias_Lorenzo.GetActorRef()
	objectReference marker = Alias_CabotHouseMarker.GetRef()
	if lorenzo.IsDead() == false
		lorenzo.MoveTo(marker)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

Scene Property RESceneKMK_MS09LorenzoLooping Auto Const

ReferenceAlias Property Alias_Lorenzo Auto Const

ReferenceAlias Property Alias_SceneMarkerA1 Auto Const

ReferenceAlias Property Alias_CabotHouseMarker Auto Const
