;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS10b_00146C84 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_RexGoodman.GetRef().MoveTo(Alias_RexStartPosition.GetRef())
;alias_ElevatorButton.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(caps001, 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MS10Loudspeaker01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
MS10Loudspeaker02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
MS10Loudspeaker03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
MS10Loudspeaker04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;MS10TriggerRadio.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
MS10RexInCage.Start()
Alias_Strong.GetRef().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(15, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
MUSRewardShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_Strong.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_RexGoodman.GetActorRef().RemoveFromFaction(CaptiveFaction)

SetObjectiveCompleted(15, true)

MS10RexOutOfCage.Start()

SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MS10.SetObjectiveDisplayed(100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(100, true)
MS10.SetObjectiveDisplayed(150, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(100, true)
MS10.SetObjectiveCompleted(150, true)
MS10.SetObjectiveDisplayed(200, true)

MS10RadioScene1.Stop()
MS10MiscTrinityTower.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(320, true)
MS10.SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(200, true)
MS10.SetObjectiveCompleted(100, true)
MS10.SetObjectiveDisplayed(410, true)

Alias_StrongPostTalkEnableMarker.GetReference().EnableNoWait()

Alias_DisableFastTravelTrigger.GetReference().EnableNoWait()

game.GetPlayer().AddToFaction(MS10RexFriendFaction)
alias_Strong.GetActorReference().AddToFaction(MS10RexFriendFaction)

;Alias_LiftButton.GetReference().BlockActivation(FALSE)
Alias_LiftButton.GetReference().GetNthLinkedRef(2).PlayAnimation("startdown")
(MS10SwitchActivationHandlerRef01 as MS10HandleSwitchActivationScript).GoToState("StartHandlingActivation")
Alias_Strong.GetActorReference().EvaluatePackage(TRUE)
Alias_RexGoodman.GetActorReference().EvaluatePackage(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Alias_Strong.GetReference().MoveTo(MS10StrongFirstLiftMarker)
Alias_RexGoodman.GetReference().MoveTo(MS10RexFirstLiftMarker)

Alias_Strong.GetReference().AddItem(LLI_Supermutant_Autorifle)

(MS10SwitchActivationHandlerRef01 as MS10HandleSwitchActivationScript).GoToState("DoNothing")

MS10RexInFirstLift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
MS10RexExitsFirstLift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Alias_LiftButton2.GetReference().BlockActivation(FALSE)
Alias_LiftButton2.GetReference().GetNthLinkedRef(2).PlayAnimation("startdown")
Alias_Strong.GetActorReference().StopCombat()
Alias_Strong.GetActorReference().StopCombatAlarm()
Alias_RexGoodman.GetActorReference().StopCombat()
Alias_RexGoodman.GetActorReference().StopCombatAlarm()
Game.GetPlayer().StopCombatAlarm()
Alias_Strong.GetActorReference().EvaluatePackage(TRUE)
Alias_RexGoodman.GetActorReference().EvaluatePackage(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
Alias_Strong.GetReference().MoveTo(MS10StrongSecondLiftMarker)
Alias_RexGoodman.GetReference().MoveTo(MS10RexSecondLiftMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
Alias_DisableFastTravelTrigger.GetReference().DisableNoWait()
(Alias_DisableFastTravelTrigger.GetReference() as DN084_DisableFastTravelTriggerScript).FastTravelFailsafe()
Alias_SpecialWeatherTrigger.GetReference().DisableNoWait()

MS10RexExitsSecondLift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
Alias_Strong.GetActorReference().StopCombat()
Alias_Strong.GetActorReference().StopCombatAlarm()
Alias_RexGoodman.GetActorReference().StopCombat()
Alias_RexGoodman.GetActorReference().StopCombatAlarm()
Game.GetPlayer().StopCombatAlarm()
Alias_Strong.GetActorReference().EvaluatePackage(TRUE)
Alias_RexGoodman.GetActorReference().EvaluatePackage(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(410, true)
MS10.SetObjectiveDisplayed(1000,true)
Alias_Strong.GetRef().IgnoreFriendlyHits(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(1000,true)
MS10RadioSwitch.Disable()

If Game.GetPlayer().GetActorBase().GetSex() == 0
    Game.GetPlayer().Additem(MS10ClothesRewardM, 1)
else
    Game.GetPlayer().Additem(MS10ClothesRewardF, 1)
endif

Alias_Strong.GetActorRef().SetAvailableToBeCompanion()

; Update Global for Radio News
RadioDCMS10Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS10 Auto Const

Faction Property MS10SupermutantRoofFaction Auto Const

ReferenceAlias Property Alias_RexStartPosition Auto Const

ReferenceAlias Property Alias_RexGoodman Auto Const

ActorValue Property Charisma Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property MS10StrongGuard01 Auto Const

ObjectReference Property MS10StrongGuard02 Auto Const



ReferenceAlias Property Alias_Strong Auto Const

ReferenceAlias Property Alias_LiftButton Auto Const

Armor Property MS10ClothesRewardM Auto Const

Armor Property MS10ClothesRewardF Auto Const

Faction Property MS10RexFriendFaction Auto Const

ReferenceAlias Property Alias_ElevatorButton Auto Const

ReferenceAlias Property Alias_LiftBox01 Auto Const

ReferenceAlias Property Alias_BottomOfLift01Marker Auto Const

ReferenceAlias Property Alias_LiftBox02 Auto Const

ReferenceAlias Property Alias_BottomOfLift02Marker Auto Const

ReferenceAlias Property Alias_LiftButton2 Auto Const

LeveledItem Property LLI_Supermutant_Autorifle Auto Const

Scene Property MS10Loudspeaker01 Auto Const

Scene Property MS10LoudSpeaker02 Auto Const

Scene Property MS10Loudspeaker03 Auto Const

Scene Property MS10Loudspeaker04 Auto Const

Book Property MS10MacbethScript Auto Const

Scene Property MS10StrongJump Auto Const

Scene Property MS10RexLeavesFirstLift Auto Const

Scene Property MS10RexLeavesSecondLift Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Faction Property CaptiveFaction Auto Const

ObjectReference Property MS10RexFirstLiftMarker Auto Const

ObjectReference Property MS10RexSecondLiftMarker Auto Const

ObjectReference Property MS10StrongFirstLiftMarker Auto Const

ObjectReference Property MS10StrongSecondLiftMarker Auto Const

Scene Property MS10RadioScene1 Auto Const

Scene Property MS10RexOutOfCage Auto Const

ObjectReference Property MS10SwitchActivationHandlerRef01 Auto Const

Quest Property MS10MiscTrinityTower Auto Const

Scene Property MS10RexInCage Auto Const

Scene Property MS10RexExitsFirstLift Auto Const

Scene Property MS10RexExitsSecondLift Auto Const

ReferenceAlias Property Alias_StrongPostTalkEnableMarker Auto Const

ReferenceAlias Property Alias_DisableFastTravelTrigger Auto Const

ObjectReference Property MS10RadioSwitch Auto Const

GlobalVariable Property RadioDCMS10Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

ReferenceAlias Property Alias_SpecialWeatherTrigger Auto Const

MusicType Property MUSRewardShort Auto Const

Scene Property MS10RexInFirstLift Auto Const Mandatory
