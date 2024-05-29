;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_WorkshopSynthInfiltrator0_001357DA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; 1.3: 87236 - update group size
Alias_Synths.AddRefCollection(Alias_SynthInfiltrators)
Alias_SynthInfiltrators.RemoveAll()
kmyQuest.UpdateDeadCountGroupSize(0, Alias_Synths.GetCount())
; 1.3 END

kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE WorkshopSynthAttackScript
Quest __temp = self as Quest
WorkshopSynthAttackScript kmyQuest = __temp as WorkshopSynthAttackScript
;END AUTOCAST
;BEGIN CODE
; run timer to expire attack if player doesn't go to location
kmyQuest.StartTimerGameTime(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; reset timer to shorter
CancelTimerGameTime()
workshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
if workshopRef.Is3DLoaded() == false && workshopRef.OwnedByPlayer
	WorkshopRaiderAttack01Message.Show()
	SetObjectiveDisplayed(10)
	workshopRef.SetValue(kmyQuest.REParent.WorkshopActorAlert, 1)
else
	; now quest should shutdown when everything unloads
	kmyQuest.StopQuestWhenAliasesUnloaded = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN AUTOCAST TYPE WorkshopSynthAttackScript
Quest __temp = self as Quest
WorkshopSynthAttackScript kmyQuest = __temp as WorkshopSynthAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartSynthAttack()

; make synth infiltrators hostile
Alias_SynthInfiltrators.RemoveFromAllFactions()
Alias_SynthInfiltrators.AddToFaction(InstituteFaction)
Alias_SynthInfiltrators.AddToFaction(WorkshopEnemyFaction)
; make unprotected
Alias_SynthInfiltrators.SetProtected(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE WorkshopSynthAttackScript
Quest __temp = self as Quest
WorkshopSynthAttackScript kmyQuest = __temp as WorkshopSynthAttackScript
;END AUTOCAST
;BEGIN CODE
; put everyone in "grateful" faction
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, attackFactionValue = 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; failsafe - make sure registered for cleanup
kmyQuest.RegisterForCustomEvent(kmyQuest.REParent, "RECheckForCleanup")
SetObjectiveCompleted(10)
; clear alert value
alias_workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE WorkshopSynthAttackScript
Quest __temp = self as Quest
WorkshopSynthAttackScript kmyQuest = __temp as WorkshopSynthAttackScript
;END AUTOCAST
;BEGIN CODE
; remove everyone from the "grateful" faction
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Make this workshop player owned
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE WorkshopSynthAttackScript
Quest __temp = self as Quest
WorkshopSynthAttackScript kmyQuest = __temp as WorkshopSynthAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
if kmyQuest.CheckResolveAttack()
	if IsObjectiveDisplayed(10)
		WorkshopSynthInfiltrator01LoseMessage.Show()
	endif
	FailAllObjectives()
else
	if IsObjectiveDisplayed(10) && IsObjectiveCompleted(10) == false
		WorkshopSynthInfiltrator01WinMessage.Show()
	endif
	CompleteAllObjectives()
endif
; remove everyone from the "grateful" faction
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
alias_workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Message Property WorkshopRaiderAttack01Message Auto Const

RefCollectionAlias Property Alias_SynthInfiltrators Auto Const

Faction Property InstituteFaction Auto Const

Faction Property WorkshopNPCFaction Auto Const

Faction Property WorkshopEnemyFaction Auto Const

Message Property WorkshopSynthInfiltrator01LoseMessage Auto Const Mandatory

Message Property WorkshopSynthInfiltrator01WinMessage Auto Const Mandatory

Message Property WorkshopSynthInfiltrator02LoseMessage Auto Const Mandatory

RefCollectionAlias Property Alias_Synths Auto Const Mandatory
