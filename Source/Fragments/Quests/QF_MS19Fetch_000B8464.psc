;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS19Fetch_000B8464 Extends Quest Hidden Const

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
Utility.Wait(12)
V81_00_Intro_IntercomInitial.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Turns on the turrets that will fire on the player.
Alias_Turret1.GetActorRef().SetUnconscious(false)
Alias_Turret2.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE V81_00_IntroScript
Quest __temp = self as Quest
V81_00_IntroScript kmyQuest = __temp as V81_00_IntroScript
;END AUTOCAST
;BEGIN CODE
;Set Vault door to play open animation
;Alias_VaultDoor.GetRef().PlayAnimation("Stage2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE V81_00_IntroScript
Quest __temp = self as Quest
V81_00_IntroScript kmyQuest = __temp as V81_00_IntroScript
;END AUTOCAST
;BEGIN CODE
;Open the Vault door.
kmyQuest.OpenGearDoor()

;Disable the Intercom so it can't be used again.
Alias_Intercom.GetRef().Disable()

;Set timer to start scene between Overseer and Calvin (worker)
Utility.Wait(30)
SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE V81_00_IntroScript
Quest __temp = self as Quest
V81_00_IntroScript kmyQuest = __temp as V81_00_IntroScript
;END AUTOCAST
;BEGIN CODE
;Show objective to retrieve Fusion Cores
SetObjectiveDisplayed(10)

;Check for current Fusion Cores and increment condition if the player already has 2 or less
If Game.GetPlayer().GetItemCount(AmmoFusionCore) == 1
   kmyQuest.ItemCollected()
EndIf

If Game.GetPlayer().GetItemCount(AmmoFusionCore) == 2
   kmyQuest.ItemCollected()
   kmyQuest.ItemCollected()
EndIf

;Disable the Intercom so it can't be used while gathering the cores.
Alias_Intercom.GetRef().Disable()
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
Alias_Intercom.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE V81_00_IntroScript
Quest __temp = self as Quest
V81_00_IntroScript kmyQuest = __temp as V81_00_IntroScript
;END AUTOCAST
;BEGIN CODE
;Set Vault door to play open animation
;Alias_VaultDoor.GetRef().PlayAnimation("Stage2")

;Open the Vault door.
kmyQuest.OpenGearDoor()

;Disable the Intercom so it can no longer be used.
Alias_Intercom.GetRef().Disable()

;Advance objectives. Complete talk to Intercom and show Talk to Gwen.
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Set timer to start scene between Overseer and Calvin (worker)
Utility.Wait(30)
SetStage(310)
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

;Set objective completed
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set stage to 1000 to complete quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " stage 1000")
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

GlobalVariable Property MS19FetchRewardXP Auto Const

Quest Property V81_01 Auto Const

ReferenceAlias Property Alias_Turret1 Auto Const

ReferenceAlias Property Alias_Turret2 Auto Const

GlobalVariable Property V81_00_Intro_FusionCoreFound Auto Const

Scene Property V81_00_Intro_IntercomInitial Auto Const

Scene Property V81_00_Intro_Overseer_EntryIntroScene Auto Const
