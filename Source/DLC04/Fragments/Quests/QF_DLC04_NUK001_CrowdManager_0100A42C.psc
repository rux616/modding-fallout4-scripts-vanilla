;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_NUK001_CrowdManager_0100A42C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Initialize the crowd, spawning the actors and establishing their linkedrefs.
kMyQuest.ConstructCrowd()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;If a gang betrays the player while this quest is running, remove that gang from the crowd.
;(Thankfully, this can't happen while the player is actually in the arena.)

int traitorGang = DLC04EnemyGang.GetValueInt()

;Operators (2 by Global, Gang 1 for this quest)
if (traitorGang == 2)
     kMyQuest.DestructCrowdForGang(Alias_Gang1)
EndIf

;Pack (3 by Global, Gang 2 for this quest)
if (traitorGang == 3)
     kMyQuest.DestructCrowdForGang(Alias_Gang2)
EndIf

;Disciples (1 by Global, Gang 3 for this quest)
if (traitorGang == 1)
     kMyQuest.DestructCrowdForGang(Alias_Gang3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin trickle-in moving.
kMyQuest.StartTrickleIn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin low idle crowd noise.
kMyQuest.ToggleCrowdIdleNoise("IdleLow", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;EVP the Crowd, to get any actors who have already loaded in to hurry up.
kMyQuest.EVPCrowd()

;Begin rush-in moving.
kMyQuest.StartRushIn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Begin warp-in moving.
kMyQuest.StartWarpIn()

;Begin low idle crowd noise, if it isn't already running.
kMyQuest.ToggleCrowdIdleNoise("IdleLow", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Ghost the crowd to prevent them from being hit by explosions (etc.) during the fight.
kMyQuest.SetCrowdGhosted(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the high-idle crowd noise for the fight.
kMyQuest.ToggleCrowdIdleNoise("IdleLow", True)
kMyQuest.ToggleCrowdIdleNoise("IdleHigh", True)

;The using quest is responsible for calling EnableCrowdReactions, if reactions are desired.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Stop the high-idle crowd noise.
kMyQuest.ToggleCrowdIdleNoise("IdleHigh", False)

;Make sure crowd reactions are disabled.
kMyQuest.DisableCrowdReactions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;De-ghost the crowd.
kMyQuest.SetCrowdGhosted(False)

;Have the crowd start walking out.
kMyQuest.StartCrowdExit()
;kMyQuest.EVPCrowd()

;End all crowd audio.
kMyQuest.DisableAllCrowdNoise()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Make sure all of the crowd noise has stopped.
kMyQuest.ToggleCrowdIdleNoise("IdleLow", False)
kMyQuest.ToggleCrowdIdleNoise("IdleHigh", False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_NUK001_CrowdManagerQuestScript
Quest __temp = self as Quest
DLC04:DLC04_NUK001_CrowdManagerQuestScript kmyQuest = __temp as DLC04:DLC04_NUK001_CrowdManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Clean up the crowd. The quest will shut down normally once cleanup is finished.
kMyQuest.StartCrowdExit()
kMyQuest.CheckForStop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Gang1 Auto Const Mandatory

RefCollectionAlias Property Alias_Gang1_NormalMembers Auto Const Mandatory

RefCollectionAlias Property Alias_Gang1_FillerMembers Auto Const Mandatory

RefCollectionAlias Property Alias_Gang2 Auto Const Mandatory

RefCollectionAlias Property Alias_Gang2_NormalMembers Auto Const Mandatory

RefCollectionAlias Property Alias_Gang2_FillerMembers Auto Const Mandatory

RefCollectionAlias Property Alias_Gang3 Auto Const Mandatory

RefCollectionAlias Property Alias_Gang3_NormalMembers Auto Const Mandatory

RefCollectionAlias Property Alias_Gang3_FillerMembers Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderOverboss Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory
