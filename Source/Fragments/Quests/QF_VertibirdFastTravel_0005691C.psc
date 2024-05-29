;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_VertibirdFastTravel_0005691C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Debug.Trace("GrenadeThrown")
Alias_VertibirdVFT.GetActorRef().SetGhost()
Alias_PilotVFT.GetActorRef().SetGhost()
utility.wait(2)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_PilotVFT.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE VFTQuestScript
Quest __temp = self as Quest
VFTQuestScript kmyQuest = __temp as VFTQuestScript
;END AUTOCAST
;BEGIN CODE
; run timer to leave if player doesn't board
kmyQuest.StartWaitTimer()
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Fire off tutorial stage if we haven't before

if !Tutorial.GetStageDone(2300)
  Tutorial.SetStage(2300)
endif

SetObjectiveCompleted(10,1)

;unghost on landing
Alias_VertibirdVFT.GetActorRef().SetGhost(false)
Alias_PilotVFT.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;unghost on landing
Alias_VertibirdVFT.GetActorRef().SetGhost()
Alias_PilotVFT.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; block activation of vertibird, and force passengers to dismount
actor vertibird = Alias_VertibirdVFT.GetActorRef()
vertibird.BlockActivation(true, true)

actor player = Game.GetPlayer()
if vertibird.IsBeingRiddenBy(player)
	player.Dismount()
endif

actor companion = Alias_companionvft.GetActorRef()
actor dogmeat = Alias_dogmeatvft.GetActorRef()
if companion && vertibird.IsBeingRiddenBy(companion)
	companion.dismount()
endif
if dogmeat && vertibird.IsBeingRiddenBy(dogmeat)
	dogmeat.dismount()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
Quest __temp = self as Quest
companionvertibirdquestscript kmyQuest = __temp as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
Alias_VertibirdVFT.GetActorRef().EvaluatePackage()

if IsObjectiveCompleted(10) == 0
SetObjectiveDisplayed(10,0)
endif

kmyQuest.EndSceneGhostCheck()

;Clear from Followers
if (Alias_VertibirdVFT.GetActorRef() == Alias_FollowerQuestVBird.GetActorRef())
Alias_FollowerQuestVBird.Clear()
endif

; block activation of vertibird, and force passengers to dismount
actor vertibird = Alias_VertibirdVFT.GetActorRef()
vertibird.BlockActivation(true, true)

actor player = Game.GetPlayer()
if vertibird.IsBeingRiddenBy(player)
	player.Dismount()
endif

actor companion = Alias_companionvft.GetActorRef()
actor dogmeat = Alias_dogmeatvft.GetActorRef()
if companion && vertibird.IsBeingRiddenBy(companion)
	companion.dismount()
endif
if dogmeat && vertibird.IsBeingRiddenBy(dogmeat)
	dogmeat.dismount()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;This is for the Player getting kicked from faction only - don't call otherwise
;Kill Global for VFT
BoSFastTravelCanUse.SetValue(-1)

;Force Dismount Player if he's on board
Actor Player = Game.GetPlayer()
if Alias_VertibirdVFT.GetActorRef().IsBeingRiddenBy(Player)
Player.Dismount()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PilotVFT Auto Const

ReferenceAlias Property Alias_VertibirdVFT Auto Const

Scene Property VertibirdFastTravelScene Auto Const

GlobalVariable Property BoSFastTravelCanUse Auto Const

Quest Property Tutorial Auto Const

ReferenceAlias Property Alias_CompanionVFT Auto Const

ReferenceAlias Property Alias_PilotVFTRailroad Auto Const

ReferenceAlias Property Alias_DogmeatVFT Auto Const

ReferenceAlias Property Alias_FollowerQuestVBird Auto Const
