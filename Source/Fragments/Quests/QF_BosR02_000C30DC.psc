;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BosR02_000C30DC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;set prereqs for the quest
BoS100Fight.SetStage(2)


;Player is in BoS at Initiate rank
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
pBoSJoined.SetValue(1)
BoSPlayerRank.SetValue(1)

;Start BoS200 Semper Invicta
BoS200.SetStage(200)

;Move Player to Cambridge PD
Game.GetPlayer().Moveto(pBoS200DanseReturnsSceneMarker01)

;place actors
;Move Rhys, Haylen, and Danse to Player
Alias_BoSR02Rhys.GetRef().Moveto(pBoS200RhysReturnsSceneMarker)
Actor Rhys = Alias_BoSR02Rhys.GetActorRef()
Rhys.EvaluatePackage()
BoSRhysBoS01Done.SetValue(1)
BoSRhysBoS02Done.SetValue(1)
Alias_BoSR02Haylen.GetRef().Moveto(pBoS200HaylenReturnsSceneMarker)
Actor Haylen = Alias_BoSR02Haylen.GetActorRef()
Haylen.EvaluatePackage()
BoSHaylenBoS01Done.SetValue(1)
BoSHaylenBoS02Done.SetValue(1)
BoSHaylenBoS03Done.SetValue(1)
Alias_BoSR02Danse.GetRef().Moveto(pBoS200DanseReturnsSceneMarker01)
Actor Danse = Alias_BoSR02Danse.GetActorRef()
Danse.EvaluatePackage()

BoS100.SetStage(255)
BoS101.SetStage(555)
BoSDialoguePoliceStation.SetStage(20)

;move to startup tasks
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;startup the quest containing the required hello after this quest shuts down
pB0SR01PostHello.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
BoSR02_Offered.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;show the object objective
SetObjectiveDisplayed(10)
BoSRadiantOnMission_Haylen.SetValue(1)
BoSR02_Offered.SetValue(-1)

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()

;If player has already retrieved the item, advance the quest.
If GetStageDone(40)
     ;Show objective to speak to Haylen
     SetObjectiveCompleted(10)
     SetObjectiveDisplayed(20)
EndIf

debug.trace(self + " STARTING")
;reset the dungeon location
Dungeon.GetLocation().Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Only update the objective if the player is actively on the quest.
If IsObjectiveDisplayed(10)
     ;complete object objective
     SetObjectiveCompleted(10)

     ;show turn in objective
     SetObjectiveDisplayed(20)
EndIf

;Cambridge PD - Set Mid Act I stage during first radiant.
DN130.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Remove the quest item
Game.GetPlayer().RemoveItem(Alias_TechItem01.GetRef(), 1)

;Complete the quest
SetObjectiveCompleted(20)
CompleteAllObjectives()
CompleteQuest()

;Set global.
BoS200R02Done.SetValue(1)

;Let BoS200 know we've completed Haylen's radiant quest.
BoS200.SetStage(220)

;Give player reward
Game.GetPlayer().AddItem(BoSRadiantRewardCaps,1)

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
BoSRadiantOnMission_Haylen.SetValue(0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSR02Rhys Auto Const

GlobalVariable Property pBoSRhysStage Auto Const

GlobalVariable Property pBoSJoined Auto Const

ObjectReference Property pBoS200DanseReturnsSceneMarker01 Auto Const

ObjectReference Property pBoS200RhysReturnsSceneMarker Auto Const

ReferenceAlias Property Alias_TechItem01 Auto Const

GlobalVariable Property BoSRadiantOnMission_Haylen Auto Const

Quest Property DN130 Auto Const

Quest Property pB0SR01PostHello Auto Const

GlobalVariable Property BoS200Done Auto Const

GlobalVariable Property BoS200R02Done Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoSDialoguePoliceStation Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

ObjectReference Property pBoS200HaylenReturnsSceneMarker Auto Const

ReferenceAlias Property Alias_BoSR02Haylen Auto Const

ReferenceAlias Property Alias_BoSR02Danse Auto Const

LocationAlias Property Dungeon Auto Const

GlobalVariable Property BoSR02_Offered Auto Const

GlobalVariable Property BoSRadiantRewardXP Auto Const

LeveledItem Property BoSRadiantRewardCaps Auto Const

GlobalVariable Property BoSRhysBoS01Done Auto Const

GlobalVariable Property BoSRhysBoS02Done Auto Const

GlobalVariable Property BoSHaylenBoS01Done Auto Const

GlobalVariable Property BoSHaylenBoS02Done Auto Const

GlobalVariable Property BoSHaylenBoS03Done Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const
