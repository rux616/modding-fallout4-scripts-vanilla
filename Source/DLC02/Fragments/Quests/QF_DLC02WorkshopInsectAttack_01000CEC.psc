;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC02:Fragments:Quests:QF_DLC02WorkshopInsectAttack_01000CEC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; fill attackers alias with one of the insect types
int insectType = utility.RandomInt(1, 4)
debug.trace(self + " startup: insectType=" + insectType)
if insectType == 1
	debug.trace(self + " Bloatflies")
	Alias_Attackers.RemoveAll()
	Alias_Attackers.AddRefCollection(Alias_Bloatflies)
elseif insectType == 2
	debug.trace(self + " Bloodbugs")
	Alias_Attackers.RemoveAll()
	Alias_Attackers.AddRefCollection(Alias_Bloodbugs)
elseif insectType == 3
	debug.trace(self + " Radroaches")
	Alias_Attackers.RemoveAll()
	Alias_Attackers.AddRefCollection(Alias_Radroaches)
else
	; NOTE: Alias_Attackers starts with stingwings, so that's the default attacker if something else is rolled
	debug.trace(self + " Stingwings")
endif
; update attacker count
kmyQuest.UpdateDeadCountGroupSize(0, Alias_Attackers.GetCount())

; need to recalc how many attackers by recalling onStoryScript on workshopAttackScript:
WorkshopAttackScript workshopAttack = (kmyquest as Quest) as WorkshopAttackScript
if workshopAttack
  	debug.trace(self + " call OnStoryScript again with new attacker counts")
	workshopAttack.OnStoryScript(akKeyword=NONE, akLocation=NONE, akRef1=NONE, akRef2=NONE, aiValue1=10, aiValue2=0)
endif
; startup
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
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; reset timer to shorter
CancelTimerGameTime()
workshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
if workshopRef.Is3DLoaded() == false && workshopRef.OwnedByPlayer
;	WorkshopRaiderAttack01Message.Show()
;	SetObjectiveDisplayed(10)
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
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; put everyone in "grateful" faction
;kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs)
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
;SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
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
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
kmyQuest.CheckResolveAttack()
; remove everyone from the "grateful" faction
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
CompleteAllObjectives()
alias_workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Message Property WorkshopRaiderAttack01Message Auto Const

RefCollectionAlias Property Alias_Bloatflies Auto Const Mandatory

RefCollectionAlias Property Alias_Bloodbugs Auto Const Mandatory

RefCollectionAlias Property Alias_Radroaches Auto Const Mandatory

RefCollectionAlias Property Alias_Attackers Auto Const Mandatory
