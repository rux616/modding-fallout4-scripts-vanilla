;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN101_0004AD05 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Spawn Pickmans' Knife in the safe
CustomItemQuest.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Swap paintings
DN101_SafeEnable.Enable()
;Move safe to position, avoiding enable to avoid losing quest items
Alias_PickmanSafe.GetRef().MoveTo(DN101_SafeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;if we're on the goodneigbhor quest, update
If FFGoodneighbor05.GetStageDone(10) == 1
  FFGoodneighbor05.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
DN101_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_IntroRaider01.GetActorRef().SetValue(Aggression, 2)
Alias_IntroRaider02.GetActorRef().SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Starts running on cell load
DN101_DoorKickScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Open the door
pDN101_PickmansDoor.Unlock()
pDN101_PickmansDoor.SetOpen()

;Enable the raiders rushing into the basement
pDN101_EnableBasement.Enable()

;Play the scene line
DN101_RaiderOpensBasement.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Play the Raider searching scene
pDN101_RaiderSearching.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Play the 2nd Raider searching scene
pDN101_RaiderSearching02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Enable Raiders in the final scene
pDN101_EnableFinalRoom.Enable()

;Enable Pickman separately so we can disable him separately
Alias_Pickman.GetActorRef().Enable()

;Add the Raiders to player friendly faction Faction to eavesdrop closer
Alias_BossRaider01.GetActorRef().AddToFaction(DN101_RaiderFaction)
Alias_EndRaider01.GetActorRef().AddToFaction(DN101_RaiderFaction)
Alias_EndRaider02.GetActorRef().AddToFaction(DN101_RaiderFaction)

;Put Pickman in the Hold Up pose
;Alias_Pickman.GetActorRef().SetValue(testHoldupAV, 1)
Alias_Pickman.GetActorRef().changeAnimFlavor(pAnimFlavorHandsUp)
Alias_Pickman.GetActorRef().EvaluatePackage()

;Play scene of Raiders taunting captured Pickman
pDN101_RaidersTauntPickman.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Set special Raider faction hostile to player because they approached
DN101_RaiderFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set special Raider faction hostile to player
DN101_RaiderFaction.SetEnemy(PlayerFaction)

;Remove Pickman from the CaptiveFaction so Raiders attack
Alias_Pickman.GetActorRef().RemoveFromFaction(pCaptiveFaction)

;Turn off Pickman Hold Up pose
Alias_Pickman.GetActorRef().ChangeAnimFlavor()
Alias_Pickman.GetActorRef().SetValue(testHoldupAV, 0)
Alias_Pickman.GetActorRef().EvaluatePackage()

;Eval the Boss Raider to get him attacking
Alias_BossRaider01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Turn off Pickman Hold Up pose
Alias_Pickman.GetActorRef().ChangeAnimFlavor()
Alias_Pickman.GetActorRef().SetValue(testHoldupAV, 0)
Alias_Pickman.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; give player Pickman's Key
Game.GetPlayer().AddItem(DN101_PickmanKey)
Alias_Pickman.GetActorRef().RemoveItem(DN101_PickmanKey)

; update quest objective
SetObjectiveDisplayed(10)

;if we're on the goodneigbhor quest, update
If FFGoodneighbor05.GetStageDone(10) == 1
  FFGoodneighbor05.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;if we're on the goodneigbhor quest, update
If FFGoodneighbor05.GetStageDone(10) == 1
  FFGoodneighbor05.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Once the player leaves the cell, Xmarker with script calls this OnCellDetach

;Check if Pickman is still alive and disable him and add the note to the safe
if !Alias_Pickman.GetActorRef().IsDead()
    Alias_Pickman.GetActorRef().Disable()
    Alias_PickmanSafe.GetReference().AddItem(DN101_PickmanNote)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
CompleteQuest()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pickman Auto Const

Key Property DN101_PickmanKey Auto Const

ObjectReference Property pDN101_EnableBasement Auto Const

ObjectReference Property pDN101_PickmansDoor Auto Const

Scene Property pDN101_RaiderSearching Auto Const

Scene Property pDN101_RaidersTauntPickman Auto Const

ObjectReference Property pDN101_EnableFinalRoom Auto Const

Scene Property pDN101_RaiderSearching02 Auto Const

Keyword Property pAnimFlavorHandsUp Auto Const

Faction Property pCaptiveFaction Auto Const

ActorValue Property testHoldupAV Auto Const

ActorValue Property LeftMobilityCondition Auto Const

ReferenceAlias Property Alias_BossRaider01 Auto Const

ReferenceAlias Property Alias_EndRaider01 Auto Const

ReferenceAlias Property Alias_EndRaider02 Auto Const

Faction Property DN101_RaiderFaction Auto Const

Faction Property PlayerFaction Auto Const

Scene Property DN101_RaiderOpensBasement Auto Const

Quest Property FFGoodneighbor05 Auto Const

ReferenceAlias Property Alias_PickmanSafe Auto Const

Book Property DN101_PickmanNote Auto Const

ReferenceAlias Property Alias_IntroRaider01 Auto Const

ReferenceAlias Property Alias_IntroRaider02 Auto Const

ActorValue Property Aggression Auto Const

Scene Property DN101_IntroScene Auto Const

Scene Property DN101_DoorKickScene Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

ObjectReference Property DN101_SafeEnable Auto Const Mandatory

ObjectReference Property DN101_SafeMarker Auto Const Mandatory
