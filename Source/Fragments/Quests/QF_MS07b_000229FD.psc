;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07b_000229FD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(MartyBullfinchHolotape, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;Shut down MS07 Grasshopper quest
pMS07bGrasshopper.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
NickReachesFaneuilHall.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
NickMartyCommentScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
pMS07b_002_NickSeesMartyCorpse.Start()

;If Nick was present and has already received intro to MS07a, start up MS07b Post-quest
if MS07a.GetStageDone(10)
  MS07bPostQuest.SetStage(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

;Add Shem's note, key to player
(Alias_ShemsGrave.GetActorRef()).RemoveItem(Alias_ShemsNote.GetRef(), 1)
Game.GetPlayer().AddItem(Alias_ShemsNote.GetRef(), 1)

;Close out any lingering objectives from MS07
MS07.SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

;Enable grave trigger
Alias_ShemGraveTrigger.GetRef().Enable()

;If Nick is still in his Marty scene, kill it
if pMS07b_002_NickSeesMartyCorpse.IsPlaying()
  pMS07b_002_NickSeesMartyCorpse.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE MS07bScript
Quest __temp = self as Quest
MS07bScript kmyQuest = __temp as MS07bScript
;END AUTOCAST
;BEGIN CODE
;Disable grave trigger
Alias_ShemGraveTrigger.GetRef().Disable()

;Disable player controls
kmyquest.BlockPlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
QSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())

Utility.Wait(2.5)

self.SetStage(37)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
;Disable mound and trigger, enable grave
Alias_GraveEnableMarker.GetRef().Disable()
Game.GetPlayer().MoveTo(MS07bDigMarker)

Game.FadeOutGame(False, True, 0.0, 2.5)
Utility.Wait(2.5)

;Wrap-up quest
self.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MS07bScript
Quest __temp = self as Quest
MS07bScript kmyQuest = __temp as MS07bScript
;END AUTOCAST
;BEGIN CODE
;Wrap up quest
CompleteAllObjectives()

;Reenable player controls
kmyquest.UnblockPlayerControls()

;setup the connection to the next quest
MS07.SetStage(90)

;Check to see if the player has spoken to Ellie prior to finishing this quest. If so, point back to her
if MS07.GetStageDone(65) && !MS07.getStageDone(10) && !MS07.GetStageDone(97) && !MS07.GetStageDone(40) && !MS07.GetStageDone(500)
  MS07.SetStage(95)
endif

;If Nick was present when player recovered sword, play scene. Otherwise, mark stage 50
If Alias_Nick.GetActorRef().GetCurrentLocation() == pNorthEndGraveyard
  pNickPresentScene.Start()

  ;Send affinity event for Nick
  FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineLikes)
else
  self.setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
self.setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ShemGraveTrigger Auto Const

Quest Property MS07 Auto Const

Holotape Property MartyBullfinchHolotape Auto Const

ReferenceAlias Property Alias_ShemsNote Auto Const

ReferenceAlias Property Alias_ShemsGrave Auto Const

Quest Property pMS07bGrasshopper Auto Const

Location Property pNorthEndGraveyard Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Scene Property pNickPresentScene Auto Const

Scene Property pMS07b_002_NickSeesMartyCorpse Auto Const

Quest Property MS07bPostQuest Auto Const

Quest Property MS07a Auto Const

Scene Property NickReachesFaneuilHall Auto Const

Scene Property NickMartyCommentScene Auto Const

ReferenceAlias Property Alias_GraveEnableMarker Auto Const

ObjectReference Property MS07bDigMarker Auto Const

Sound Property QSTMS07BPlayerGraveExhume2D Auto Const

Keyword Property CA_CustomEvent_ValentineLikes Auto Const
