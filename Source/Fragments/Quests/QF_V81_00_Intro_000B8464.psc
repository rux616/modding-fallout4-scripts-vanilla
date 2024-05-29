;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_V81_00_Intro_000B8464 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.trace(self + " starting")
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

V81_00_Intro_IntercomInitial.Start()
debug.trace(self + " Scene Started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Turned off turrets per discussion with Emil.

;Turns on the turrets that will fire on the player.
;Alias_Turret1.GetActorRef().SetUnconscious(false)
;Alias_Turret2.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE v81_00_introscript
Quest __temp = self as Quest
v81_00_introscript kmyQuest = __temp as v81_00_introscript
;END AUTOCAST
;BEGIN CODE
;Open the Vault door.
kmyQuest.OpenGearDoor()
MUSReveal.Add()

;Disable the Intercom so it can't be used again.
;Alias_Intercom.GetRef().Disable()

SetObjectiveDisplayed(31, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE v81_00_introscript
Quest __temp = self as Quest
v81_00_introscript kmyQuest = __temp as v81_00_introscript
;END AUTOCAST
;BEGIN CODE
;Show objective to retrieve Fusion Cores
SetObjectiveDisplayed(10)

;Check for current Fusion Cores and increment condition if the player already has 2 or less
If Game.GetPlayer().GetItemCount(AmmoFusionCore) <= 2
   kmyQuest.ItemCollected()
EndIf

;Disable the Intercom so it can't be used while gathering the cores.
;Alias_Intercom.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Advance objectives. Complete collection objective and show return to intercom.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Enable the intercom so the player can inform that they've gotten the cores
;Alias_Intercom.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE v81_00_introscript
Quest __temp = self as Quest
v81_00_introscript kmyQuest = __temp as v81_00_introscript
;END AUTOCAST
;BEGIN CODE
;Open the Vault door.
SetStage(55)

;Disable the Intercom so it can no longer be used.
Alias_Intercom.GetRef().BlockActivation(True,True)

;Advance objectives. Complete talk to Intercom and show Talk to Gwen.
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Start initial entry scene between Gwen and worker
V81_00_Intro_Overseer_EntryIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Remove fusion cores from player inventory
Game.GetPlayer().RemoveItem(AmmoFusionCore, 3)

;Give player reward
Game.GetPlayer().AddItem(MS19FetchRewardCaps,1)

;Set objective completed
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Unlock the door
Alias_ElevatorDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set stage to 1000 to complete quest
Alias_ScottEdwards.GetActorRef().GetActorBase().SetEssential(False)
Alias_ElevatorDoor.GetRef().Unlock()
DialogueVault81.SetStage(101)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " stage 1000")
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Intercom Auto Const

ReferenceAlias Property Alias_VaultDoor Auto Const

ReferenceAlias Property Alias_VaultDoorControl Auto Const

Ammo Property AmmoFusionCore Auto Const

LeveledItem Property MS19FetchRewardCaps Auto Const

Quest Property V81_01 Auto Const

ReferenceAlias Property Alias_Turret1 Auto Const

ReferenceAlias Property Alias_Turret2 Auto Const

GlobalVariable Property V81_00_Intro_FusionCoreFound Auto Const

Scene Property V81_00_Intro_IntercomInitial Auto Const

Scene Property V81_00_Intro_Overseer_EntryIntroScene Auto Const

ReferenceAlias Property Alias_ElevatorDoor Auto Const

Quest Property DialogueVault81 Auto Const

MusicType Property MUSReveal Auto Const

ReferenceAlias Property Alias_ScottEdwards Auto Const Mandatory
