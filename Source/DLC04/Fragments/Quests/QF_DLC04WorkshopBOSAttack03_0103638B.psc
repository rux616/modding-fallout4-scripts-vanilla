;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04WorkshopBOSAttack03_0103638B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; run timer to expire attack if player doesn't go to location
kmyQuest.StartTimerGameTime(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
; reset timer to shorter
CancelTimerGameTime()
workshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
if workshopRef.Is3DLoaded() == false && workshopRef.OwnedByPlayer
	AttackMessage.Show()
	SetObjectiveDisplayed(10)
	; set workshop alert value
	Alias_Workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 1)
else
	; now quest should shutdown when everything unloads
	kmyQuest.StopQuestWhenAliasesUnloaded = true
endif
Alias_Vertibird01.TryToEnable()
Alias_Vertibird02.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_02
Function Fragment_Stage_0020_Item_02()
;BEGIN CODE
DLC04WorkshopParent.MakeTurretsHostile(Alias_Workshop.GetRef() as WorkshopScript)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
; enable passengers
Alias_Pilot01.TryToEnable()
Alias_Gunner01.TryToEnable()
Alias_PowerArmorPassenger01.TryToEnable()
Alias_PowerArmorPassenger02.TryToEnable()

Alias_Pilot02.TryToEnable()
Alias_CoPilot02.TryToEnable()
Alias_Gunner02.TryToEnable()
Alias_Dog02.TryToEnable()
Alias_PowerArmorPassenger03.TryToEnable()
Alias_PowerArmorPassenger04.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; tell vertibird to return to airport
Alias_Vertibird01.TryToSetValue(REVertibirdLandAirport, 1)
; failsafe
setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
; tell vertibird to return to airport
Alias_Vertibird02.TryToSetValue(REVertibirdLandAirport, 1)
; failsafe
setstage(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
; failsafe - make sure registered for cleanup
kmyQuest.RegisterForCustomEvent(kmyQuest.REParent, "RECheckForCleanup")
SetObjectiveCompleted(10)
; clear workshop alert value
Alias_Workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
if kmyQuest.CheckResolveAttack()
	if IsObjectiveDisplayed(10)
		AttackLoseMessage.Show()
	endif
	FailAllObjectives()
else
	if IsObjectiveDisplayed(10) && IsObjectiveCompleted(10) == false
		AttackWinMessage.Show()
	endif
	CompleteAllObjectives()
endif

; clear workshop alert value
Alias_Workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Message Property AttackMessage Auto Const

Message Property AttackLoseMessage Auto Const

Message Property AttackWinMessage Auto Const

ReferenceAlias Property Alias_Pilot01 Auto Const Mandatory

ReferenceAlias Property Alias_Gunner01 Auto Const Mandatory

ReferenceAlias Property Alias_PowerArmorPassenger01 Auto Const Mandatory

ReferenceAlias Property Alias_Vertibird01 Auto Const Mandatory

ReferenceAlias Property Alias_PowerArmorPassenger02 Auto Const Mandatory

ActorValue Property REVertibirdLandAirport Auto Const Mandatory

ReferenceAlias Property Alias_Vertibird02 Auto Const Mandatory

ReferenceAlias Property Alias_Pilot02 Auto Const Mandatory

ReferenceAlias Property Alias_Gunner02 Auto Const Mandatory

ReferenceAlias Property Alias_Copilot02 Auto Const Mandatory

ReferenceAlias Property Alias_PowerArmorPassenger03 Auto Const Mandatory

ReferenceAlias Property Alias_PowerArmorPassenger04 Auto Const Mandatory

ReferenceAlias Property Alias_Dog02 Auto Const Mandatory

dlc04:dlc04workshopparentscript Property DLC04WorkshopParent Auto Const Mandatory
