;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ202_000229E9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pMS04SetStage50Trigger.Disable()

;give player Kellogg's brain
Game.GetPlayer().AddItem(MQ201CyberBrain)

pMQ201.SetStage(150)

;move Nick to Memory Den
Alias_NickValentine.GetActorRef().MoveTo(MQ201NickMarker01)

FFGoodneighbor01.Stop()
MQ105.Stop()

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;check if the player already has Kellogg's Brain

If Game.GetPlayer().GetItemCount(MQ201CyberBrain) == 0
  SetObjectiveDisplayed(5, 1)
Else
  SetObjectiveDisplayed(10, 1)
EndIf

;enable preloader doors
MQ203MagicDoortoMemoryDen.Enable()
MQ203MemoryDenMagicDoor.Enable()

;block Nick's chair
Alias_NickChair.GetRef().BlockActivation(True, True)

;open lab doors, allow NPCs to go through
Alias_LabDoor.GetRef().Lock(false)
Alias_LabDoor.GetRef().SetOpen()

Alias_NickValentine.GetActorRef().AddToFaction(MQ202AmariDoorOwnerFaction)
Alias_Amari.GetActorRef().AddToFaction(MQ202AmariDoorOwnerFaction)
Game.GetPlayer().AddToFaction(MQ202AmariDoorOwnerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Actor NickREF = Alias_NickValentine.GetActorRef() 

;Nick can't be a companion again until we're done
NickREF.DisallowCompanion(SuppressDismissMessage=True)

;move Nick to the right spot
If NickREF.IsInFaction(CurrentCompanionFaction) == False
  NickREF.MoveTo(MQ201NickMarker01)
Else
  NickREF.MoveTo(MQ202NickIrmaMarker01B)
  ;(Followers as FollowersScript).ClearCompanion()
EndIf

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ202AmariDenAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
MQ202_001_NickIrmaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;kill the irma scene if it hasn't stopped already
MQ202_001_NickIrmaScene.Stop()
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
MQ202_001_NickIrmaScene.Stop()
MQ202_002_NickAmariScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_Amari.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(MQ201CyberBrain, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ202_005_PlugScene.Start()

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().EvaluatePackage()
Alias_Amari.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)

Alias_PlayerMemoryLounger.GetRef().BlockActivation(True, False)

;rewardXP
;Game.RewardPlayerXP(XPActTwoSmall.GetValue() as int)

Alias_NickValentine.GetActorRef().EvaluatePackage()
Alias_Amari.GetActorRef().EvaluatePackage()

MQ202_007_NicktoLounger.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE MQ202QuestScript
Quest __temp = self as Quest
MQ202QuestScript kmyQuest = __temp as MQ202QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ202EnableLayer =  InputEnableLayer.Create()
kmyquest.MQ202EnableLayer.DisablePlayerControls()

;ghost Doctor Amari
Alias_Amari.GetActorRef().SetGhost()

;ghost Nick
Alias_NickValentine.GetActorRef().SetGhost()

;player can no longer activate pod
Alias_PlayerMemoryLounger.GetRef().BlockActivation(True, True)

Alias_PlayerMemoryLounger.GetRef().Activate(Game.GetPlayer(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE MQ202QuestScript
Quest __temp = self as Quest
MQ202QuestScript kmyQuest = __temp as MQ202QuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ202_003_AmariIntroduction.Stop()
MQ202_010_MemoryLounger.Start()

Alias_Amari.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MQ202QuestScript
Quest __temp = self as Quest
MQ202QuestScript kmyQuest = __temp as MQ202QuestScript
;END AUTOCAST
;BEGIN CODE
MQ203.SetStage(10)
pMQ202CompanionPostSurgery.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE MQ202QuestScript
Quest __temp = self as Quest
MQ202QuestScript kmyQuest = __temp as MQ202QuestScript
;END AUTOCAST
;BEGIN CODE
;CompleteAllObjectives()
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

;unghost Doctor Amari
Alias_Amari.GetActorRef().SetGhost(False)

;unghost Nick
Alias_NickValentine.GetActorRef().SetGhost(False)

;swap memory loungers
MQ203LoungerInstantEnterEnableMarker.Disable()

;make sure we clear the input layer
kmyquest.MQ202EnableLayer=None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Player knows Amari is a brain surgeon 
; (Relevant for Curie's quest to become human)
pCOMCurieQuest.SetStage(150)

CompleteAllObjectives()
Game.AddAchievement(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Nick is no longer essential
;WJS - not anymore
;Alias_NickValentine.GetActorRef().GetActorBase().SetEssential(False)

;Piper can now hate you
Piper_MurderToggle.SetValueInt(1)
Piper_AffinityCondition_HatredAllowed.SetValueInt(1)

;also shutdown MQ201
MQ201.Stop()

;make sure Piper's institue enemies dialogue is over
MQ201Piper.Stop()

;clear aliases from MQ00 so they stop persisting
MQ106KelloggBrain.Clear()
MQ106KelloggCorpse.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMS04SetStage50Trigger Auto Const

Quest Property pMQ201 Auto Const

Quest Property MQ203 Auto Const

ReferenceAlias Property Alias_Amari Auto Const

Quest Property pFollowers Auto Const

ReferenceAlias Property Alias_PlayerMemoryLounger Auto Const

MiscObject Property pMQ201CyberBrain Auto Const

ReferenceAlias Property Alias_labDoor Auto Const

Quest Property pMQ202CompanionPostSurgery Auto Const

ReferenceAlias Property Alias_CyberBrain Auto Const

MiscObject Property MQ201CyberBrain Auto Const

Quest Property MQ201Piper Auto Const

ReferenceAlias Property Alias_SurgeryTable Auto Const

Scene Property MQ202_010_MemoryLounger Auto Const

Quest Property FFGoodneighbor01 Auto Const

ObjectReference Property MQ203LoungerInstantEnterEnableMarker Auto Const

ObjectReference Property MQ203MagicDoortoMemoryDen Auto Const

ObjectReference Property MQ203MemoryDenMagicDoor Auto Const

ReferenceAlias Property Alias_NickValentine Auto Const

Quest Property MQ201 Auto Const

Scene Property MQ202_001_NickIrmaScene Auto Const

Faction Property CurrentCompanionFaction Auto Const

ObjectReference Property MQ201NickMarker01 Auto Const

Quest Property Followers Auto Const

Scene Property MQ202_002_NickAmariScene Auto Const

ReferenceAlias Property Alias_NickChair Auto Const

Faction Property MQ202AmariDoorOwnerFaction Auto Const

Scene Property MQ202_005_PlugScene Auto Const

Quest Property MQ105 Auto Const

Scene Property MQ202_007_NicktoLounger Auto Const

ReferenceAlias Property MQ106KelloggBrain Auto Const

ReferenceAlias Property MQ106KelloggCorpse Auto Const

ObjectReference Property MQ202NickIrmaMarker01B Auto Const

Quest Property pCOMCurieQuest Auto Const

GlobalVariable Property Piper_MurderToggle Auto Const Mandatory

GlobalVariable Property Piper_AffinityCondition_HatredAllowed Auto Const Mandatory

ActorValue Property COMQC_MQ202AmariDenAV Auto Const

Scene Property MQ202_003_AmariIntroduction Auto Const Mandatory
