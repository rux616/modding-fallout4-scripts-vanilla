;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_Intro_0103389A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
ObjectReference myDoor = Alias_IntroDoor.GetReference()
myDoor.SetOpen(false)
myDoor.Lock()
myDoor.SetLockLevel(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Stage set on VaultDoorControl Alias via script.
;Enable the trigger that acts as the Intercom. 
;Sets a timer to wait for the player to finish playing the animation.
;Then starts up the scene.

Alias_Intercom.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;give the animation a second to finish
Utility.Wait(2.0)

;unblock door console
Alias_Intercom.GetRef().BlockActivation(False, False)

V118_IntercomInitial.Start()
debug.trace(self + " Scene Started")

Game.GetPlayer().Activate(Alias_Intercom.GetRef())
Game.StartDialogueCameraOrCenterOnTarget(Alias_Intercom.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_V118_LItem_ReceptionistCash1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:V118_IntroScript
Quest __temp = self as Quest
DLC03:V118_IntroScript kmyQuest = __temp as DLC03:V118_IntroScript
;END AUTOCAST
;BEGIN CODE
;Open the Vault door.
kmyQuest.OpenGearDoor()
MUSReveal.Add()

;"Destroy" the Intercom so it can't be used again.
objectReference Intercom = Alias_Intercom.GetReference()
Intercom.SetDestroyed()
Intercom.BlockActivation()


DLC03_V118_MiscObjectives.SetStage(41)


;Stop the scene with Pearl waiting at the door
If DLC03_V118_PearlVaultDoorScene.isPlaying()
DLC03_V118_PearlVaultDoorScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC03_V118_FrontDeskMessengerTravel.Start()
DLC03_V118_Quest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;DLC03_V118_FrontDesk.Stop()
;DLC03_V118_FrontDeskInvestigator.Stop()
DLC03_V118_FrontDeskMurder.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DLC03_V118_MiscObjectives.SetStage(200)
If DLC03_V118_PearlHiring.IsRunning()
DLC03_V118_PearlHiring.Stop()
endif
DLC03_V118_Quest.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Intercom Auto Const Mandatory

MusicType Property MUSReveal Auto Const Mandatory

Scene Property V118_IntercomInitial Auto Const Mandatory

Quest Property DLC03_V118_MiscObjectives Auto Const Mandatory

Quest Property DLC03_V118_PearlHiring Auto Const Mandatory

Scene Property DLC03_V118_FrontDeskMurder Auto Const Mandatory

Armor Property Armor_DLC03_Vault118_UnderwearClean Auto Const Mandatory

Scene Property DLC03_V118_FrontDesk Auto Const Mandatory

Scene Property DLC03_V118_FrontDeskInvestigator Auto Const Mandatory

ReferenceAlias Property Alias_IntroDoor Auto Const Mandatory

Scene Property DLC03_V118_FrontDeskMessengerTravel Auto Const Mandatory

Quest Property DLC03_V118_Quest Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_ReceptionistCash1 Auto Const Mandatory

Scene Property DLC03_V118_PearlVaultDoorScene Auto Const Mandatory
