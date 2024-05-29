;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13FindPhoto_000457C6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
  SetObjectiveDisplayed(10, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 500)
kmyQuest.SetBlackmailReward(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
GoodneighborMarowskiFaction.SetEnemy(PlayerFaction)
; just to kick things off
Alias_Marowski.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MarowskiPhotoPaul.GetRef())
setStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN CODE
SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_01
Function Fragment_Stage_0320_Item_01()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 250)
kmyQuest.SetBlackmailReward(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_02
Function Fragment_Stage_0320_Item_02()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 500)
kmyQuest.SetBlackmailReward(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
; player has shown Marowski the photo
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_01
Function Fragment_Stage_0400_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
setStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
; register for change location events
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
; objective to Marowski if both are now dead
if IsObjectiveCompleted(110) || IsObjectiveDisplayed(110) == false
  setObjectiveDisplayed(120)
endif
; remove "talk to Cooke" objective if active
if IsObjectiveDisplayed(20)
  SetObjectiveDisplayed(20, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
; objective to Marowski if both are now dead
if IsObjectiveCompleted(100) || IsObjectiveDisplayed(100) == false
  setObjectiveDisplayed(120)
endif

; fail "talk to Latimer" objective if active
if IsObjectiveDisplayed(30)
  SetObjectiveDisplayed(30, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if GetStageDone(410)
	Game.GetPlayer().AddItem(Caps001, 400)
else
	Game.GetPlayer().AddItem(Caps001, 300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
SetObjectiveCompleted(120)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
if GetStageDone(410)
	Game.GetPlayer().AddItem(Caps001, 300)
else
	Game.GetPlayer().AddItem(Caps001, 400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_01
Function Fragment_Stage_0510_Item_01()
;BEGIN CODE
SetObjectiveCompleted(120)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MarowskiPhotoPaul.GetRef())
setStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 250)
kmyQuest.SetBlackmailReward(250)
setstage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(630)
	kmyQuest.SetBlackmailReward(600)
else
	kmyQuest.SetBlackmailReward(400)
endif
Game.GetPlayer().AddItem(Caps001, kmyQuest.BlackmailReward)
setstage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MarowskiPhotoPaul.GetRef())
setStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 200)
kmyQuest.SetBlackmailReward(200)

setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN AUTOCAST TYPE MS13FindPhotoScript
Quest __temp = self as Quest
MS13FindPhotoScript kmyQuest = __temp as MS13FindPhotoScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(730)
	kmyQuest.SetBlackmailReward(500)
else
	kmyQuest.SetBlackmailReward(300)
endif
Game.GetPlayer().AddItem(Caps001, kmyQuest.BlackmailReward)
setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HenryCooke Auto Const

ReferenceAlias Property Alias_MalcolmLatimer Auto Const

MiscObject Property Caps001 Auto Const

Faction Property GoodneighborMarowskiFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_Marowski Auto Const

ReferenceAlias Property Alias_MarowskiPhotoPaul Auto Const

Quest Property MS13 Auto Const
