;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM00_00142EDC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug quest start.
;Normal starting stage for BoSM01.
MQ102.SetStage(15)
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(555)
;Skip BoS200 (Semper Invicta), 201 (Shadow of Steel), 202 (Show No Mercy)
BoS200.SetStage(10)
BoS200.SetStage(40)
BoS200.SetStage(100)
BoS200.SetStage(255)
BoS201.SetStage(255)
BoS202.SetStage(255)

;Player in BoS; Training missions, if any, done.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSKellsIntroDone.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)

;Warp to Kells
Actor Kells = Alias_BoSCaptainKells.GetActorRef()
Kells.EvaluatePackage()
Kells.MoveToPackageLocation()
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)

;Move Danse to the bridge as well.
Alias_BoSPaladinDanse.TryToMoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;When this starts up, queue up BoSM01 as the first available misc quest.

;If BoSM01 has not been completed, re-enable its dialogue. Kells now takes over as the questgiver.
if (!BoSM01.GetStageDone(255))
     ;The quest is normally started by MQ102 Stage 15, but call Start here for debugging safety.
     BoSM01.Start()
     ;Have Kells take over as the questgiver.
     BoSM01.EnableBoSM01Act2()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Just shut down this quest.
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Send Kells back to the bridge.
BoSM00_Kells_BoS305ReturnToBridge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Remove the block on Kells' greetings.
BoSMKellsDialogueBlocked.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Because BoSR03 relies on this quest, BoSM00 now shuts down only on kickout.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ102 Auto Const
Quest Property BoSEnable Auto Const
Quest Property BoS100Fight Auto Const
Quest Property BoS100 Auto Const
Quest Property BoS101 Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS202 Auto Const
BoSM01QuestScript Property BoSM01 Auto Const

ReferenceAlias Property Alias_BoSCaptainKells Auto Const
ReferenceAlias Property Alias_BoSPaladinDanse Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const
GlobalVariable Property BoSTraining Auto Const
GlobalVariable Property BoSJoined Auto Const
GlobalVariable Property BoSPrydwenArrived Auto Const
GlobalVariable Property BoSKellsIntroDone Auto Const
GlobalVariable Property BoSPlayerRank Auto Const

ObjectReference Property BoSMQuickstartMarker Auto Const

GlobalVariable Property BoSMKellsDialogueBlocked Auto Const Mandatory

Scene Property BoSM00_Kells_BoS305ReturnToBridge Auto Const Mandatory
