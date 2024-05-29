;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst302_000A8258 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;quickstart
Game.GetPlayer().AddToFaction(InstituteFaction)
InstituteMapMarker.AddToMap(True)


SetObjectiveDisplayed(10)

F633.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
B257.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Y915.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Z322.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
X688.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)

;disable Bunker Hill "Caravan Workers"
CaravanWorker1.Disable()
CaravanWorker2.Disable()
CaravanWorker3.Disable()
CaravanWorker4.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;update main path objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(40)

;enable Courser
X688.GetReference().MoveTo(CourserBHStartMarker)
X688.GetReference().Enable()
X688.GetActorReference().EvaluatePackage()

;enable synths in Bunker Hill
B257.GetReference().Enable()
F633.GetReference().Enable()
Y915.GetReference().Enable()
Z322.GetReference().Enable()
;add optional objective to talk to BoS
if BoS201.GetStageDone(255)==1
If PlayerBoS_KickedOut.GetValue()!=1
SetObjectiveDisplayed(20)
Inst302_BOS.Start()
endif
else
;BunkerHillBoSFaction.SetEnemy(PlayerFaction)
;RYAN NOTE: switching this out to fix something real quick
endif
;add optional objective to talk to RR
if PlayerRailroad_IsInFaction.GetValue() ==1
SetObjectiveDisplayed(30)
pRR201.bBlockRR201 = 1    ; Make Inst302RR a blocking topic
Inst302_RR.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
if IsObjectiveDisplayed(20) ==1
SetObjectiveDisplayed(20,0)
endif
if kmyquest.BoSInformed==0
Inst302_BoS.SetStage(150)
endif
if IsObjectiveDisplayed(30)==1
SetObjectiveDisplayed(30,0)
endif
if kmyquest.RailroadInformed==0
Inst302_RR.SetStage(200)
endif
X688.GetActorReference().EvaluatePackage()
Inst302BunkerHillTrapDoorRef.Unlock()
Inst302Combat.SetStage(10)
Game.GetPlayer().AddItem(RecallNote.GetReference())
DialogueInstituteShaunKid.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
if IsObjectiveDisplayed(20) ==1
SetObjectiveDisplayed(20,0)
endif
if kmyquest.BoSInformed==0
Inst302_BoS.SetStage(150)
endif
if IsObjectiveDisplayed(30)==1
SetObjectiveDisplayed(30,0)
endif
if kmyquest.RailroadInformed==0
Inst302_RR.SetStage(200)
endif
X688.GetActorReference().EvaluatePackage()
Inst302BunkerHillTrapDoorRef.Unlock()
Inst302Combat.SetStage(10)
Game.GetPlayer().AddItem(RecallNote.GetReference())
DialogueInstituteShaunKid.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_02
Function Fragment_Stage_0050_Item_02()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
if IsObjectiveDisplayed(20) ==1
SetObjectiveDisplayed(20,0)
endif
if kmyquest.BoSInformed==0
Inst302_BoS.SetStage(150)
endif
if IsObjectiveDisplayed(30)==1
SetObjectiveDisplayed(30,0)
endif
if kmyquest.RailroadInformed==0
Inst302_RR.SetStage(200)
endif
X688.GetActorReference().EvaluatePackage()
Inst302BunkerHillTrapDoorRef.Unlock()
Inst302Combat.SetStage(10)
Game.GetPlayer().AddItem(RecallNote.GetReference())
DialogueInstituteShaunKid.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_03
Function Fragment_Stage_0050_Item_03()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
if IsObjectiveDisplayed(20) ==1
SetObjectiveDisplayed(20,0)
endif
if kmyquest.BoSInformed==0
Inst302_BoS.SetStage(150)
endif
if IsObjectiveDisplayed(30)==1
SetObjectiveDisplayed(30,0)
endif
if kmyquest.RailroadInformed==0
Inst302_RR.SetStage(200)
endif
X688.GetActorReference().EvaluatePackage()
Inst302BunkerHillTrapDoorRef.Unlock()
Inst302Combat.SetStage(10)
Game.GetPlayer().AddItem(RecallNote.GetReference())
DialogueInstituteShaunKid.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
Inst302Stage55Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Inst302AssaultedBunkerHillAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;update objectives so capturings synths is no longer valid
if IsObjectiveDisplayed(60) == 1
setObjectiveDisplayed(60,0)
endif
if IsObjectiveDisplayed(70) == 0
SetObjectiveDisplayed(70,1)
endif
;make Institute faction hostile to player
BunkerHillInstituteFaction.SetEnemy(PlayerFaction)
BunkerHillInstituteFaction.SetEnemy(InstituteFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
Inst302Stage90CourserScene.Start()
kmyquest.DoneWithSynths=True
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
BunkerHillInstituteFaction.SetEnemy(PlayerFaction)
BunkerHillInstituteFaction.SetEnemy(InstituteFaction)
X688.GetActorReference().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(40)
SetObjectiveDisplayed(40,0)
endif
If IsObjectiveDisplayed(50)
SetObjectiveDisplayed(50,0)
endif
if IsObjectiveDisplayed(60)
SetObjectiveDisplayed(60,0)
endif

Inst302BunkerHillTrapDoorRef.Unlock()
SetObjectiveCompleted(70)
BunkerHillRRFaction.SetAlly(PlayerFaction)
Game.GetPlayer().StopCombatAlarm()
if kmyquest.synthsfreed == 0
kmyquest.synthsfreed=1
endif
SetStage(100)

;Ryan's addition
Inst302Combat.setstage(5)
Inst302combat.setstage(10)
Inst302Combat.setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE Inst302QuestScript
Quest __temp = self as Quest
Inst302QuestScript kmyQuest = __temp as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
BHCombatTriggerEnableMarker.disable()
if GetStageDone(90)==1
SetObjectiveCompleted(60)
elseif kmyquest.DoneWithSynths==False
SetObjectivedisplayed(110)
endif

;If player has used reset codes

if GetStageDone(90) == 1


endif

;Move Father to exterior marker
shaun.GetReference().MoveTo(Inst302FatherExteriorMarker)
shaun.GetActorReference().EvaluatePackage()

;Disable nearby CIT encounters
CITNearbyEncountersMarker.disable()

; Make it so that RR201 plays normally again
pRR201.bBlockRR201 = 0    ; Make this no longer a blocking topic

;Ryan's script
if (getstagedone(95) == False)
   BHCombatTriggerEnableMarker.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
B257.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
F633.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
B257.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Y915.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Z322.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
X688.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)

(B257 as TeleportReferenceAlias).teleportOut()
;B257.GetReference().Disable()

(F633 as TeleportReferenceAlias).teleportOut()
;F633.GetReference().Disable()

(X688 as TeleportReferenceAlias).teleportOut()
;X688.GetReference().Disable()

(Y915 as TeleportReferenceAlias).teleportOut()
;Y915.GetReference().Disable()

(Z322 as TeleportReferenceAlias).teleportOut()
;Z322.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)

B257.GetReference().Disable()
F633.GetReference().Disable()
Y915.GetReference().Disable()
Z322.GetReference().Disable()
;InstM04.Start()
Inst302Combat.Stop()
Inst303.Start()

;re-enable Caravan Workers
CaravanWorker1.Enable()
CaravanWorker2.Enable()
CaravanWorker3.Enable()
CaravanWorker4.Enable()

;Update Global for Radio News
RadioDCInst302Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Tell Bunker Hill settlement the battle is over
pDialogueBunkerHill.SetStage(600)

;Ryan's Additions
BHCombatTriggerEnableMarker.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;re-enable Caravan Workers
CaravanWorker1.Enable()
CaravanWorker2.Enable()
CaravanWorker3.Enable()
CaravanWorker4.Enable()

FailAllObjectives()

;Ryan's Additions
BHCombatTriggerEnableMarker.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS201 Auto Const

GlobalVariable Property PlayerRailroad_IsInFaction Auto Const

Quest Property Inst302_BOS Auto Const

Quest Property Inst302_RR Auto Const

Quest Property InstM03 Auto Const

Quest Property InstM04 Auto Const

ReferenceAlias Property B257 Auto Const

ReferenceAlias Property F633 Auto Const

ReferenceAlias Property Y915 Auto Const

ReferenceAlias Property Z322 Auto Const

ReferenceAlias Property X688 Auto Const

ObjectReference Property CourserBHStartMarker Auto Const

Scene Property Inst302Stage55Scene Auto Const

Scene Property Inst302Stage90CourserScene Auto Const

Quest Property Inst303 Auto Const

Quest Property Inst302Combat Auto Const

Int Property BOSInformed Auto Const

Faction Property BunkerHillInstituteFaction Auto Const

Faction Property PlayerFaction Auto Const

Quest Property DN084 Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Quest Property InstM02 Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCInst302Ready Auto Const

ActorValue Property TeleportRefCollOptionalRequired Auto Const

Faction Property BunkerHillRRFaction Auto Const

ObjectReference Property Inst302BunkerHillTrapDoorRef Auto Const

GlobalVariable Property XPFactionFinal Auto Const

RR201Script Property pRR201 Auto Const

ObjectReference Property Inst302FatherExteriorMarker Auto Const

ReferenceAlias Property shaun Auto Const

Faction Property BunkerHillBoSFaction Auto Const

ObjectReference Property CITNearbyEncountersMarker Auto Const

Quest Property DialogueInstituteShaunKid Auto Const

ReferenceAlias Property RecallNote Auto Const

ObjectReference Property BHCombatTriggerEnableMarker Auto Const

ObjectReference Property CaravanWorker1 Auto Const

ObjectReference Property CaravanWorker2 Auto Const

ObjectReference Property CaravanWorker3 Auto Const

ObjectReference Property CaravanWorker4 Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const Mandatory

ActorValue Property COMQC_Inst302AssaultedBunkerHillAV Auto Const

Quest Property pDialogueBunkerHill Auto Const Mandatory
