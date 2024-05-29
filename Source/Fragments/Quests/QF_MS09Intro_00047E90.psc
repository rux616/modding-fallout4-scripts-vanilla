;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS09Intro_00047E90 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; clear crime on Parsons guard faction
ParsonsGuardFaction.SetPlayerEnemy(false)
; move Edward to center marker and enable
Alias_Edward.GetRef().MoveTo(Alias_InteriorCenterMarker.GetRef())
Alias_Edward.GetRef().Enable()

; update respawn count from DN031 - how many NPCs player killed
MS09.DN031RespawnCount = math.max( (DN031 as defaultQuestRespawnScript).respawnCount,  (DN031 as DN031Script).respawnCountMax ) as int
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MS09.setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
(MS09 as MS09Script).IntroTalkedAboutParsons = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
(MS09 as MS09Script).IntroExtraReward = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
MS09.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; player leaves area, shut down the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;/
; never talked to Edward
if MS09.GetStage() < 100
	; move Edward home
	Alias_Edward.GetRef().MoveToMyEditorLocation()
endif
/;
; changing to always move him home - he can't path through door
; move Edward home
Alias_Edward.GetRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SettlementCenterMarker Auto Const

ReferenceAlias Property Alias_Edward Auto Const

MS09Script Property MS09 Auto Const

ReferenceAlias Property Alias_InteriorCenterMarker Auto Const

Quest Property DN031 Auto Const

Faction Property ParsonsGuardFaction Auto Const Mandatory
