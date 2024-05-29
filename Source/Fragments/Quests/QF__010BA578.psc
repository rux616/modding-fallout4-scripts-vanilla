;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__010BA578 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_RexGoodman.GetRef().MoveTo(Alias_RexStartPosition.GetRef())
alias_ElevatorButton.GetRef().BlockActivation(true, true)
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

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
MS10RadioAct1Scene2.Start()
MS10RadioControl02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
MS10RadioAct1Scene3.Start()
MS10RadioControl03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
MS10RadioAct1Scene4.Start()
MS10RadioControl04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
MS10RadioAct1Scene5.Start()
MS10RadioControl05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
MS10RadioAct1Scene7.Start()
MS10RadioControl07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MS10EscortToTop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
game.GetPlayer().AddItem(MS10MacbethScript, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MS10.SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(200, true)
MS10.SetObjectiveDisplayed(300, true)

Game.RewardPlayerXP(XPMiscQuestSmall.GetValue() as int)
Alias_RexGoodman.GetActorReference().FollowerFollow()
game.GetPlayer().AddToFaction(MS10RexFriendFaction)

alias_ElevatorButton.GetRef().BlockActivation(false, false)
alias_ElevatorButton.GetRef().Activate(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
MS10.SetObjectiveCompleted(200, true)
MS10.SetObjectiveDisplayed(320, true)

Game.RewardPlayerXP(XPMiscQuestSmall.GetValue() as int)

game.GetPlayer().AddToFaction(MS10RexFriendFaction)
alias_Strong.GetActorReference().AddToFaction(MS10RexFriendFaction)
MS10SupermutantRoofFaction.SetAlly(PlayerFaction, true, true)

Alias_SupermutantEscort01.GetRef().MoveTo(MS10StrongGuard01)
Alias_SupermutantEscort02.GetRef().MoveTo(MS10StrongGuard02)

Alias_SupermutantEscort01.GetActorReference().FollowerFollow()
Alias_SupermutantEscort02.GetActorReference().FollowerFollow()
Alias_RexGoodman.GetActorReference().FollowerFollow()

alias_ElevatorButton.GetRef().BlockActivation(false, false)
alias_ElevatorButton.GetRef().Activate(game.GetPlayer())
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
MS10.SetObjectiveCompleted(400, true)
MS10.SetObjectiveDisplayed(410, true)

MS10MacbethScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
MS10.SetObjectiveFailed(410, true)
MS10.SetObjectiveDisplayed(600, true)

MS10SupermutantRoofFaction.SetEnemy(PlayerFaction)
alias_Strong.GetActorRef().RemoveFromFaction(MS10RexFriendFaction)
game.GetPlayer().RemoveFromFaction(MS10RexFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
MS10.SetObjectiveFailed(410, true)
MS10.SetObjectiveDisplayed(600, true)

MS10SupermutantRoofFaction.SetEnemy(PlayerFaction)
alias_Strong.GetActorRef().RemoveFromFaction(MS10RexFriendFaction)
game.GetPlayer().RemoveFromFaction(MS10RexFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
Alias_LiftBox01.GetRef().PlayAnimation("play01")
Alias_LiftBox02.GetRef().PlayAnimation("play01")
Alias_Strong.GetActorRef().AddItem(LLI_SuperMutant_Autorifle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by MS10RexToolBox01a package

MS10.SetObjectiveCompleted(410, true)
MS10.SetObjectiveDisplayed(550, true)

MS10SupermutantRoofFaction.SetEnemy(PlayerFaction)
Alias_Strong.GetActorRef().RemoveFromFaction(MS10SupermutantRoofFaction)
Alias_Fist.GetActorRef().StartCombat(game.GetPlayer())
Alias_LiftButton.GetRef().BlockActivation(False, False)
Alias_LiftBox01.GetRef().PlayAnimationAndWait("play01","done")
Alias_RexGoodman.GetActorRef().SetAlpha(0)
Alias_RexGoodman.GetActorRef().SetGhost(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script

MS10.SetObjectiveCompleted(550, true)
MS10.SetObjectiveDisplayed(600, true)

alias_Strong.GetActorRef().RemoveFromFaction(MS10SupermutantRoofFaction)
Alias_RexGoodman.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Set by M10RexLiftScript on Rex Alias
;Checked by MS10RexToolBox01b package

Alias_BottomOfLift01Marker.GetRef().EnableNoWait()
Alias_RexGoodman.GetRef().MoveTo(Alias_BottomOfLift01Marker.GetRef())

MS10RexLeavesFirstLift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script
;Listened to by MS10StrongJumpToLift Package
Alias_Strong.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0618_Item_00
Function Fragment_Stage_0618_Item_00()
;BEGIN CODE
;Set by MS10StrongLiftScript
;Listed to by MS10StrongFollowPC

MS10StrongJump.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script
;Listened to by MS10StrongJumpToLift Package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script

Alias_BottomOfLift01Marker.GetRef().DisableNoWait()
Alias_RexGoodman.GetActorRef().SetAlpha(1)
Alias_RexGoodman.GetActorRef().SetGhost(FALSE)
Alias_LiftBox01.GetRef().PlayAnimation("play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
;Set by MS10RexToolBox02a package

Alias_LiftButton2.GetRef().BlockActivation(False, False)
Alias_LiftBox02.GetRef().PlayAnimationAndWait("play01","done")
Alias_RexGoodman.GetActorRef().SetAlpha(0)
Alias_RexGoodman.GetActorRef().SetGhost(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_RexGoodman.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Set by M10RexLiftScript on Rex Alias
;Checked by MS10RexToolBox02b package

Alias_BottomOfLift02Marker.GetRef().EnableNoWait()
Alias_RexGoodman.GetRef().MoveTo(Alias_BottomOfLift02Marker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Set by DN161PowerLiftButton script

Alias_BottomOfLift02Marker.GetRef().DisableNoWait()
Alias_RexGoodman.GetActorRef().SetAlpha(1)
Alias_RexGoodman.GetActorRef().SetGhost(FALSE)
Alias_LiftBox02.GetRef().PlayAnimation("play01")

MS10RexLeavesSecondLift.Start()
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
MS10.SetObjectiveCompleted(600, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(XPMiscQuestFinal.GetValue() as int)
Game.GetPlayer().Additem(MS10ClothesRewardM, 1)

Alias_Strong.GetActorRef().AddToFaction(HasBeenCompanionFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(XPMiscQuestFinal.GetValue() as int)
Game.GetPlayer().Additem(MS10ClothesRewardF, 1)

Alias_Strong.GetActorRef().AddToFaction(HasBeenCompanionFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS10 Auto Const

Faction Property MS10SupermutantRoofFaction Auto Const

ReferenceAlias Property Alias_Fist Auto Const

ReferenceAlias Property Alias_RexStartPosition Auto Const

ReferenceAlias Property Alias_RexGoodman Auto Const

GlobalVariable Property XPMiscQuestSmall Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Scene Property MS10RadioAct1Scene2 Auto Const

Scene Property MS10RadioAct1Scene3 Auto Const

Scene Property MS10RadioAct1Scene4 Auto Const

Scene Property MS10RadioAct1Scene5 Auto Const

Scene Property MS10RadioAct1Scene7 Auto Const

Scene Property MS10RadioControl02 Auto Const

Scene Property MS10RadioControl03 Auto Const

Scene Property MS10RadioControl04 Auto Const

Scene Property MS10RadioControl05 Auto Const

Scene Property MS10RadioControl07 Auto Const

ActorValue Property Charisma Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property MS10StrongGuard01 Auto Const

ObjectReference Property MS10StrongGuard02 Auto Const

ReferenceAlias Property Alias_SupermutantEscort01 Auto Const

ReferenceAlias Property Alias_SupermutantEscort02 Auto Const

Scene Property MS10EscortToTop Auto Const

Scene Property MS10MacBethScene Auto Const

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
