;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSR01_00064EC7 Extends Quest Hidden Const

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
Game.GetPlayer().Moveto(BoS200DanseReturnsSceneMarker02)

;Move Rhys, Haylen, and Danse to Player and set flavor scenes done
Alias_BoSR01Rhys.GetRef().Moveto(pBoS200RhysReturnsSceneMarker)
Actor Rhys = Alias_BoSR01Rhys.GetActorRef()
Rhys.EvaluatePackage()
BoSRhysBoS01Done.SetValue(1)
BoSRhysBoS02Done.SetValue(1)
Alias_BoSR01Haylen.GetRef().Moveto(BoS200HaylenReturnSceneMarker)
Actor Haylen = Alias_BoSR01Haylen.GetActorRef()
Haylen.EvaluatePackage()
BoSHaylenBoS01Done.SetValue(1)
BoSHaylenBoS02Done.SetValue(1)
BoSHaylenBoS03Done.SetValue(1)
Alias_BoSR01Danse.GetRef().Moveto(BoS200DanseReturnsSceneMarker02)
Actor Danse = Alias_BoSR01Danse.GetActorRef()
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
debug.trace(self + " STARTING")
;reset the dungeon location
Dungeon.GetLocation().Reset()

If CollegeSquareLocation == Dungeon.GetLocation()
   BoSR01CollegeSquareBoss.Reset()
EndIf

;startup the quest containing the required hello after this quest shuts down
pBoSR01PostHello.SetStage(0)

BoSRhysBoS01Done.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
BoSR01_Offered.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;show the object objective
SetObjectiveDisplayed(10)
BoSRadiantOnMission_Rhys.SetValue(1)
BoSR01_Offered.SetValue(-1)

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()

;If player has already retrieved the item, advance the quest.
If GetStageDone(40)
     ;Show objective to speak to Rhys
     SetObjectiveCompleted(10)
     SetObjectiveDisplayed(20)
EndIf

; show boss QTs if 3 or less
if Alias_DungeonBosses.GetCount() <= 3
  setStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Only update the objective if the player is actively on the quest.
If IsObjectiveDisplayed(10)
     SetObjectiveCompleted(10,1)
     SetObjectiveDisplayed(20,1)
EndIf

;Cambridge PD - Set Mid Act I stage during first radiant.
DN130.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Give player reward if training op is already completed
Game.GetPlayer().AddItem(BoSRadiantRewardCaps,1)

;Set global.
BoS200R01Done.SetValue(1)

;Let BoS200 know we've completed Rhys' radiant quest.
BoS200.SetStage(210)

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()
BoSRadiantOnMission_Rhys.SetValue(0)
debug.trace(self + " Stopping BoSR01")
Stop()
debug.trace(self + " Stop is done")
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

ReferenceAlias Property Alias_BoSR01Rhys Auto Const

ObjectReference Property pBoS200DanseReturnsSceneMarker01 Auto Const

ObjectReference Property pBoS200RhysReturnsSceneMarker Auto Const

GlobalVariable Property pBoSRhysStage Auto Const

GlobalVariable Property pBoSJoined Auto Const

GlobalVariable Property pBoSR01Global Auto Const

Quest Property pBoSR01PostHello Auto Const

GlobalVariable Property BoSRadiantOnMission_Rhys Auto Const

Quest Property DN130 Auto Const

GlobalVariable Property BoS200Done Auto Const

GlobalVariable Property BoS200R01Done Auto Const

Quest Property BoS200 Auto Const

ObjectReference Property BoSTeaganCounterPlayerMarker Auto Const

ObjectReference Property BoS200DanseReturnsSceneMarker02 Auto Const

GlobalVariable Property BoSRhysBoS01Done Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ReferenceAlias Property Alias_BoSR01Haylen Auto Const

ReferenceAlias Property Alias_BoSR01Danse Auto Const

ObjectReference Property BoS200HaylenReturnSceneMarker Auto Const

Quest Property BoSDialoguePoliceStation Auto Const

LocationAlias Property Dungeon Auto Const

GlobalVariable Property BoSR01_Offered Auto Const

GlobalVariable Property BoSRadiantRewardXP Auto Const

LeveledItem Property BoSRadiantRewardCaps Auto Const

GlobalVariable Property BoSRhysBoS02Done Auto Const

GlobalVariable Property BoSHaylenBoS01Done Auto Const

GlobalVariable Property BoSHaylenBoS02Done Auto Const

GlobalVariable Property BoSHaylenBoS03Done Auto Const

Door Property BoSVertibirdGroundDoor Auto Const

Quest Property BoS000 Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

RefCollectionAlias Property Alias_DungeonBosses Auto Const

ObjectReference Property BoSR01CollegeSquareBoss Auto Const

Location Property CollegeSquareLocation Auto Const
