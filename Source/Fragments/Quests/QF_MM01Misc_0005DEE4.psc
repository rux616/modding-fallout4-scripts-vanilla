;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MM01Misc_0005DEE4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ102.setStage(130)
MQ102.setStage(52)
MQ102.setStage(55)
MQ102.setStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
setStage(0)
MQ102.SetStage(90)
MQ102.SetStage(140)
MQ102.SetStage(150)
MQ102.SetStage(200)
Min00.SetStage(100) ; objective to meet Preston in Sanctuary
DialogueConcordArea.SetStage(200) ; shut down
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;SetObjectiveDisplayed(10)
; this objective has moved to the end of Min00 now
Min00.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
debug.trace(self + " STAGE 50")
Min01ConcordTravel01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; evp Sturges to get him moving
Alias_Sturges.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; add NPCs to workshop
; first, get workshop
WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
int workshopID = workshopRef.GetWorkshopID()

WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_MarcyLong.GetActorRef(), workshopID)
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_GrandmaMonk.GetActorRef(), workshopID)
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Sturges.GetActorRef(), workshopID)
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_JunLong.GetActorRef(), workshopID)
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Preston.GetActorRef(), workshopID)
; reset happiness to current target
WorkshopParent.ResetHappiness(workshopRef)

if DialogueCodsworthPostWar.GetStageDone(300) == false && DialogueCodsworthPostWar.GetStageDone(200) == true
	DialogueCodsworthPostWar.SetStage(5)
endif

; turn off Codsworth patrol
DialogueCodsworthPostWar.CodsworthPatrol = 0

; turn on Preston forcegreet
; MOVED to stage 120 - make it more likely for Sturges/Codsworth conversation to play
;Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)

;turn on Mama Murphy's The Sight quest
MQ00MamaMurphy.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
; if player is in Sanctuary too
setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; failsafe: kill Concord travel scenes
Min01ConcordTravel02.Stop()
Min01ConcordTravel01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if GetStageDone(205) == false
	; turn ON Preston forcegreet
	Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)

SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
MinutemenCentralQuest.PrestonKnowsPlayerIsPrewar = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
MinutemenCentralQuest.PrestonKnowsSonIsMissing = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
MinRecruit00.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(10)
; this objective is now the end of Min00:
Min00.SetStage(200)

; make sure workshop is player owned before starting MinRecruit00
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)

MinRecruit00.Start()
MinRecruit00.SetStage(50)

; make sure:
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(FlareGun)
Game.GetPlayer().AddItem(AmmoFlareGun, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(10) ; this is moved to stage 220

; talk to Sturges:
;SetObjectiveDisplayed(50)
; CHANGE TO MISC OBJECTIVE:
Min01Misc.SetStage(10)

; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)

SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
; start receiving workshop build events
kmyQuest.RegisterForWorkshopEvents()
; complete objective
Min01Misc.SetStage(100)
;SetObjectiveCompleted(50)
; beds objective
setStage(1000)
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1000)
; initialize bed count
kmyQuest.InitializeBedsObjective()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
setObjectiveCompleted(1000)

; turn on Preston forcegreet
;Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)
; Sturges objective
SetObjectiveDisplayed(1050)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1050)
SetObjectiveDisplayed(1100)
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
; check rating
if kmyQuest.GetPowerRating() > 0
  setStage(1110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
setObjectiveCompleted(1100)
; reward XP
Game.RewardPlayerXP(XPFactionSmall.GetValue() as int)
; turn on Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)
; Preston objective
SetObjectiveDisplayed(1150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1050) ; for now
SetObjectiveCompleted(1150)
SetObjectiveDisplayed(1200)
; turn off Preston forcegreet
;Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
kmyQuest.InitializeWaterObjective()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
setObjectiveCompleted(1200)

; turn on Preston forcegreet
;Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)
; Sturges objective
SetObjectiveDisplayed(1250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1250)
SetObjectiveDisplayed(1300)
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
kmyQuest.InitializeFoodObjective()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
setObjectiveCompleted(1300)

; turn on Preston forcegreet
;Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 1)
; Sturges objective
SetObjectiveDisplayed(1350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN AUTOCAST TYPE Min01Script
Quest __temp = self as Quest
Min01Script kmyQuest = __temp as Min01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1350)
SetObjectiveDisplayed(1400)
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
kmyQuest.InitializeSafetyObjective()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1410_Item_00
Function Fragment_Stage_1410_Item_00()
;BEGIN CODE
setObjectiveCompleted(1400)
; Sturges objective
SetObjectiveDisplayed(1450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.AddAchievement(22)

; Patch 1.8: 82928
WorkshopNPCScript jun = Alias_JunLong.GetActorRef() as WorkshopNPCScript
WorkshopNPCScript marcy = Alias_MarcyLong.GetActorRef() as WorkshopNPCScript
Patch_1_8.JunMarcyUnessential_1_8(jun, marcy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_01
Function Fragment_Stage_1500_Item_01()
;BEGIN CODE
; if Preston part of quest is done, close quest out
; failsafe
setstage(2010)
; stop quest
setstage(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
; turn off Preston forcegreet
Alias_Preston.GetActorRef().SetValue(ForceGreetOn, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; make sure Min00 is complete (if skipped MinRecruit00)
Min00.SetStage(200)

; reward XP
Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)
Game.AddAchievement(13)

; update overall status
MinutemenCentralQuest.SetProgress(1)

; Preston now commandable, movable
WorkshopNPCScript preston = Alias_Preston.GetActorRef() as workshopNPCScript
preston.SetCommandable(true)
preston.SetAllowMove(true)

; turn on companion functionality (without forcing him as a follower)
preston.SetAvailableToBeCompanion()

; player is in faction
Game.GetPlayer().AddToFaction(MinutemenFaction)
; global flag
PlayerMinutemen_JoinedFaction.SetValue(1)
; allow power armor paintjob
PA_Global_Material_Minuteman.SetValue(1)

;Update Global for Radio News
RadioDCMin01Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
; complete intro recruitment quest
MinRecruit00.setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property SanctuaryHillsLocation Auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

workshopparentscript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_GrandmaMonk Auto Const

ReferenceAlias Property Alias_Preston Auto Const

ReferenceAlias Property Alias_Sturges Auto Const

ReferenceAlias Property Alias_MarcyLong Auto Const

ReferenceAlias Property Alias_JunLong Auto Const

Quest Property MQ102 Auto Const

ReferenceAlias Property Alias_Codsworth Auto Const

ActorValue Property ForceGreetOn Auto Const

Faction Property HasBeenCompanionFaction Auto Const

GlobalVariable Property PlayerMinutemen_JoinedFaction Auto Const

GlobalVariable Property XPFactionSmall Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Scene Property Min01ConcordTravel01 Auto Const

Quest Property MinRecruit00 Auto Const

DialogueCodsworthPostWarScript Property DialogueCodsworthPostWar Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMin01Ready Auto Const

Quest Property MQ00MamaMurphy Auto Const

Faction Property MinutemenFaction Auto Const

Quest Property Min00 Auto Const

Quest Property Min01Misc Auto Const

Quest Property DialogueConcordArea Auto Const

Weapon Property FlareGun Auto Const

Ammo Property AmmoFlareGun Auto Const

Scene Property Min01ConcordTravel02 Auto Const Mandatory

GlobalVariable Property PA_Global_Material_Minuteman Auto Const Mandatory

Patch_1_6_Script Property Patch_1_6 Auto Const Mandatory

Patch_1_8_Script Property Patch_1_8 Auto Const Mandatory
