;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueVault111_0001ED62 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_CryoPod.GetRef().Activate(Game.GetPlayer())

Alias_BlockedDoor.GetRef().BlockActivation()
Alias_OverseerDoor.GetRef().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE DialogueVault111Script
Quest __temp = self as Quest
DialogueVault111Script kmyQuest = __temp as DialogueVault111Script
;END AUTOCAST
;BEGIN CODE
kmyquest.StartBreathing()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN AUTOCAST TYPE DialogueVault111Script
Quest __temp = self as Quest
DialogueVault111Script kmyQuest = __temp as DialogueVault111Script
;END AUTOCAST
;BEGIN CODE
p003_OpenCyropodScene.Start()

ObjectReference SpousePodREF = Alias_SpouseCryopod.GetRef()

;wait for pod to open
kmyquest.RegisterForAnimationEvent(SpousePodREF, "TransitionComplete")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
If GetStageDone(56) == 0
  ActivateCryopodScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
;don't player if player fast activates spouse
If GetStageDone(60) == 0 && Game.GetPlayer().HasDirectLOS(Alias_SpouseCryopod.GetRef())
  p004_SpousePodOpenScene.Start()
EndIf

ObjectReference CorpseREF = Alias_SpouseCorpseActivator.GetRef()

If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1
  Alias_SpouseMaleName.ForceRefTo(CorpseREF)
Else
   Alias_SpouseFemaleName.ForceRefTo(CorpseREF)
EndIf

CorpseREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Actor FemaleSpouseREF = Alias_FemaleSpouse.GetActorRef()
Actor MaleSpouseREF = Alias_MaleSpouse.GetActorRef()

Alias_SpouseCorpseActivator.GetRef().BlockActivation(True, True)

FemaleSpouseREF.BlockActivation(True, True)
FemaleSpouseREF.UnequipItem(Armor_SpouseWeddingRing)
;FemaleSpouseREF.RemoveItem(Armor_SpouseWeddingRing, 1)

;MaleSpouseREF.RemoveItem(Armor_SpouseWeddingRing, 1)
MaleSpouseREF.BlockActivation(True, True)
MaleSpouseREF.UnequipItem(Armor_SpouseWeddingRing)

Game.GetPlayer().AddItem(Armor_SpouseWeddingRing, 1)
p003_ActivateSpouseScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
DialogueVault111_RadRoach.Start()

;don't need the roach collection anymore
Alias_RadRoachCollection.RemoveAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
p004_PlayerAudible01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN CODE
p005_PlayerAudible02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0074_Item_00
Function Fragment_Stage_0074_Item_00()
;BEGIN CODE
p006_PlayerAudible03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;If Alias_Cryolater.GetRef().IsLocked()
;  PlayerCryolater.Start()
;EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
p007_PlayerLoop.Stop()
VaultDoorOpening.Start()

Alias_BlockedDoor.GetRef().BlockActivation(False)
Alias_OverseerDoor.GetRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
Game.RequestSave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
PlayerRespecScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
PlayerRespecScene.Stop()
p004_ExitVaultScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
p011_OutsideVaultScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property p004_ExitVaultScene Auto Const

Scene Property p003_ActivateSpouseScene Auto Const

Scene Property p005_PlayerAudible02 Auto Const

Scene Property p004_PlayerAudible01 Auto Const

Scene Property p006_PlayerAudible03 Auto Const

Scene Property p011_OutsideVaultScene Auto Const

Scene Property p002_LoopingCryoScene Auto Const

Scene Property p007_PlayerLoop Auto Const

ReferenceAlias Property Alias_CryoPod Auto Const

Idle Property pCoughingEnd Auto Const

Keyword Property AnimCoughing Auto Const
{The keyword put on the actor to make him cough.}

Scene Property p003_OpenCyropodScene Auto Const

Scene Property p004_SpousePodOpenScene Auto Const

ReferenceAlias Property Alias_SpouseCryopod Auto Const

ReferenceAlias Property Alias_BlockedDoor Auto Const

ReferenceAlias Property Alias_BlockedDoorOverseer Auto Const

Scene Property p006_PlayerDoorTerminal Auto Const

Scene Property p006_PlayerBeds Auto Const

ReferenceAlias Property Alias_OverseerDoor Auto Const

Scene Property ActivateCryopodScene Auto Const

Scene Property PlayerCryolater Auto Const

ReferenceAlias Property Alias_Cryolater Auto Const

Scene Property VaultDoorOpening Auto Const

Scene Property PlayerRespecScene Auto Const

Armor Property Armor_WeddingRing Auto Const

Armor Property Armor_SpouseWeddingRing Auto Const

ReferenceAlias Property Alias_FemaleSpouse Auto Const

ReferenceAlias Property Alias_MaleSpouse Auto Const

Outfit Property Vault111SuitNoPipboy Auto Const

Scene Property DialogueVault111_RadRoach Auto Const

RefCollectionAlias Property Alias_RadRoachCollection Auto Const

ReferenceAlias Property Alias_SpouseCorpseActivator Auto Const Mandatory

ReferenceAlias Property Alias_SpouseMaleName Auto Const Mandatory

ReferenceAlias Property Alias_SpouseFemaleName Auto Const Mandatory
