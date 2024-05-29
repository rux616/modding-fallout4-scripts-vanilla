;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS09Mission01_000503B8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_PackageBoss.GetActorRef().StartCombat(Alias_PackageRaider01.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MS09Mission01RaiderConv01.Start()
MUSDread03x.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Alias_RaiderReinforcementLeader.TryToEnable()
Alias_RaiderReinforcements.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
MS09Mission01ReinforcementsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_RaiderReinforcements.SetValue(Suspicious, 2)
Alias_RaiderReinforcements.EvaluateAll()
Alias_RaiderReinforcementLeader.TryToSetValue(Suspicious, 2)
Alias_RaiderReinforcementLeader.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_02
Function Fragment_Stage_0040_Item_02()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; set by package alias script
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
MS09.SetStage(480)
; enable raider reinforcements failsafe
SetStage(7)
; package no longer a quest item
Alias_PackageQuestItem.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Package.GetRef(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CabotHouseFrontDoor Auto Const

ObjectReference Property MS09IntroEdwardMarker001 Auto Const

ReferenceAlias Property Alias_Edward Auto Const

ReferenceAlias Property Alias_Jack Auto Const

Scene Property MS09CabotHouseIntroUninvited Auto Const

ObjectReference Property MS09IntroJackMarker001 Auto Const

Explosion Property MS09IntroExplosion Auto Const

ObjectReference Property MS09IntroExplosionMarker Auto Const

Scene Property MS09CabotHouseIntroInvited Auto Const

Quest Property MS09Intro Auto Const

ReferenceAlias Property Alias_PowerStationActivator Auto Const

ReferenceAlias Property Alias_Package Auto Const

Scene Property MS09CabotHouseMission2Looping Auto Const

LeveledItem Property Mission1Reward Auto Const

Scene Property MS09CabotHouseMission2Jack Auto Const

GlobalVariable Property XPMiscQuestSmall Auto Const

Scene Property MS09Mission01RaiderConv01 Auto Const

Quest Property MS09 Auto Const

RefCollectionAlias Property Alias_RaiderReinforcements Auto Const

ReferenceAlias Property Alias_RaiderReinforcementLeader Auto Const

ActorValue Property Suspicious Auto Const

Scene Property MS09Mission01ReinforcementsScene Auto Const

ReferenceAlias Property Alias_PackageQuestItem Auto Const

ReferenceAlias Property Alias_PackageBoss Auto Const

ReferenceAlias Property Alias_PackageRaider01 Auto Const

MusicType Property MUSDread03x Auto Const
