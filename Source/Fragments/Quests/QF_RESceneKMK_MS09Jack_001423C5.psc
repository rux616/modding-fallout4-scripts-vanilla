;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneKMK_MS09Jack_001423C5 Extends Quest Hidden Const

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
Alias_JackCabot.TryToMoveTo(Alias_SceneMarkerA1.GetRef())
Alias_EdwardDeegan.TryToMoveTo(Alias_SceneMarkerA2.GetRef())
; pick a vendor faction for Jack
Alias_JackCabot.GetActorRef().AddToFaction(JackVendorFactions[RESceneKMK_MS09JackLastFaction.GetValueInt()])
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
; clear vendor faction and update for next time
Alias_JackCabot.GetActorRef().RemoveFromFaction(JackVendorFactions[RESceneKMK_MS09JackLastFaction.GetValueInt()])
; increment faction index
RESceneKMK_MS09JackLastFaction.SetValue(RESceneKMK_MS09JackLastFaction.GetValueInt() + 1)
if RESceneKMK_MS09JackLastFaction.GetValueInt() >= JackVendorFactions.Length
	RESceneKMK_MS09JackLastFaction.SetValue(0)
endif
; move Jack and Edward home (if player isn't in Cabot house)
if Alias_CabotHouseMarker.GetRef().GetParentCell() != Game.GetPlayer().GetParentCell()
	actor jack = Alias_JackCabot.GetActorRef()
	actor edward = Alias_EdwardDeegan.GetActorRef()
	objectReference marker = Alias_CabotHouseMarker.GetRef()
	if jack.IsDead() == false
		jack.MoveTo(marker)
	endif
	if edward && edward.IsDead() == false
		edward.MoveTo(marker)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_JackCabot Auto Const

ReferenceAlias Property Alias_EdwardDeegan Auto Const

ReferenceAlias Property Alias_SceneMarkerA1 Auto Const

ReferenceAlias Property Alias_SceneMarkerA2 Auto Const

Faction[] Property JackVendorFactions Auto Const

GlobalVariable Property RESceneKMK_MS09JackLastFaction Auto Const

ReferenceAlias Property Alias_CabotHouseMarker Auto Const
