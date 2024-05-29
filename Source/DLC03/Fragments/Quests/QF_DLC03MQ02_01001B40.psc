;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ02_01001B40 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Get the player in the right state
pDLC03MQ01.SetStage(400)

; Move the player to the right spot
Game.GetPlayer().MoveTo(pDLC03NakanoResidenceMapMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq02script
Quest __temp = self as Quest
dlc03:dlc03mq02script kmyQuest = __temp as dlc03:dlc03mq02script
;END AUTOCAST
;BEGIN CODE
; Open the Hull gate
pHullGateREF.SetOpen(TRUE)
pHullGateREF.Lock(FALSE)

; Move Old Longfellow to Mitch
Alias_OldLongfellow.GetActorRef().MoveTo(Alias_Mitch.GetActorRef())

;Start up DLC03MQ02Fight as well.
DLC03MQ02Fight.SetStage(10)

; Move Allen and Avery to their spot
Alias_AllenLee.GetActorRef().MoveTo(pMQ01AllenInitialMarker)
Alias_CaptainAvery.GetActorRef().MoveTo(pMQ01AveryInitialMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Added by Matt D during companion interjection pass
;Set if Nick responds to the player failing a speech challenge when first meeting Old Longfellow
;Set in Nick's dialogue,and used to condition the following phase where Old Longfellow reacts to Nick
;This happens in Phase 3 of Scene "DLC03MQ02_0500a_CompassionLongfellow"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

WorkshopVendorWeapons01_LL.Addform(DLC03_LL_Ammo_Harpoon,7,5)
WorkshopVendorWeapons01_LL.Addform(DLC03_LL_Ammo_4570,8,5)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Move Allen and Avery to their spot
;Alias_AllenLee.GetActorRef().MoveTo(pMQ01AllenInitialMarker)
;Alias_CaptainAvery.GetActorRef().MoveTo(pMQ01AveryInitialMarker)

; Start the scene when you hit the trigger
pDLC03MQ02_0100_AmbientBoatApproach.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Play some music
pMUSDread01.Add()

; Get the Fog rolling in
pDLC03_RadFogWeather.SetActive(FALSE, TRUE)

; Play Avery's escort conversation.
pDLC03MQ02_0200c_AveryToWall.Start()

; Handoff to DLC03MQ02Fight.
DLC03MQ02Fight.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set by the PreFight scene. Tells DLC03MQ02Fight to enable Jared and his Survivors.
DLC03MQ02Fight.SetStage(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Set when the PreFight scene ends. Pass control to the Fight quest's PreFight scene.
DLC03MQ02Fight.SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Set by DLC03MQ02Fight when the first wave of enemies spawn.

; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set by DLC03MQ02Fight when the fight has ended.
; DLC03MQ02Fight still has to handle the Survivors and its own cleanup. It'll do this the next time the
; Far Harbor exterior unloads.

; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; Update Avery & Allen's packages.
Alias_CaptainAvery.TryToEvaluatePackage()
Alias_AllenLee.TryToEvaluatePackage()

; Signal that the town is now acting normal
pDLC03FarHarborUnderAttack.SetValue(0)

; Enable the trail encounters
pMQ02AnimalEnableMarker.Enable()
pMQ02MirelurkAmbushTrigger.Enable()

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Flag this so that everyone acts normally
pDLC03FarHarborAbnormalState.SetValue(0)

; Start the quest pointers
;pDLC03FarHarborFF01_Misc.Start()
;pDLC03FarHarborFF03a_Misc.Start()
pDLC03FarHarborM02.SetStage(100)
pDLC03FarHarborM02.SetStage(150)

; Enable the Trappers
pMQ02TrapperEnableMarker.Enable()

; Now let all of the ambient scenes in town play
pFarHarborAmbientEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; The player gets a reward
;Game.GetPlayer().AddItem(pDLC03_AmmoHarpoon, 24)
;Game.GetPlayer().AddItem(pDLC03_LL_HarpoonGun)
Game.GivePlayerCaps(275)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
; Remove whiskey from player
if ( GetStageDone(475) )
  Game.GetPlayer().RemoveItem(pWhiskey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(475)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

; Enable the Trappers on the trail
Alias_Trappers.EnableAll()

; Enable the Children of Atom Preacher
Alias_ChildrenPreacher.GetActorRef().Enable()

; Make Old Longfellow ignore combat
Actor aTarg = Alias_OldLongfellow.GetActorRef()
aTarg.IgnoreFriendlyHits()
aTarg.GetActorBase().SetEssential(TRUE)
aTarg.AddToFaction(pPlayerFaction)
aTarg.SetValue(pFollowerDistance, 0)

; Have Old Longfellow do his escort
pDLC03MQ02_0600_OldLongfellowEscort.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
; The player gets some yummy jerky
Game.GetPlayer().AddItem(pDLC03MirelurkJerky)

; Player now knows how to make jerky
pDLC03PlayerKnowsMirelurkJerky.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0508_Item_00
Function Fragment_Stage_0508_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq02script
Quest __temp = self as Quest
dlc03:dlc03mq02script kmyQuest = __temp as dlc03:dlc03mq02script
;END AUTOCAST
;BEGIN CODE
; If Longfellow isn't with the player - let the game know
if ( !Alias_OldLongfellow.GetActorRef().Is3DLoaded() )
  kmyQuest.bKilledTrappersWithoutLongfellow = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0512_Item_00
Function Fragment_Stage_0512_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq02script
Quest __temp = self as Quest
dlc03:dlc03mq02script kmyQuest = __temp as dlc03:dlc03mq02script
;END AUTOCAST
;BEGIN CODE
; If Longfellow isn't with the player - let the game know
if ( !Alias_OldLongfellow.GetActorRef().Is3DLoaded() )
  kmyQuest.bKilledCrittersWithoutLongfellow = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
; You finish the escort section then Old Longfellow talks with the Child of Atom
if ( !Alias_ChildrenPreacher.GetActorRef().IsDead() )    ; Well, only if the preacher is alive
  pDLC03MQ02_0650a_ChildrenLongfellow.Start()
else   ; Otherwise continue the escort
  pDLC03MQ02_0600b_OldLongfellowEscortEnd.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
if ( GetStageDone(540) )
  ; Longfellow's conversation continues
  pDLC03MQ02_0600b_OldLongfellowEscortEnd.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
; Get the Map Marker for the Nucleus
Alias_NucleusMapMarker.GetRef().AddtoMap()

SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0565_Item_00
Function Fragment_Stage_0565_Item_00()
;BEGIN CODE
; Old Longfellow will resume the escort
if ( Alias_OldLongfellow.GetActorRef().Is3DLoaded() )   ; Is Longfellow loaded?
  pDLC03MQ02_0600b_OldLongfellowEscortEnd.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
; The Child attacks the player
pDLC03MQ02LoneChildAtomFaction.SetPlayerEnemy()

; You did talk with the Child (even if she attacked you)
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; FIRST CASE - Old Longfellow is not present, end this quest
if ( Game.GetPlayer().GetDistance(Alias_OldLongfellow.GetActorRef()) > 2000 )
  ; "Where You Belong" now starts (talk to the leader of Acadia)
  pDLC03MQ03.SetStage(10)

  ; Clear all objectives you skipped
  if !IsObjectiveCompleted(100)
    SetObjectiveDisplayed(100, FALSE)
  endif
  if !IsObjectiveCompleted(200)
    SetObjectiveDisplayed(200, FALSE)
  endif
  if !IsObjectiveCompleted(300)
    SetObjectiveDisplayed(300, FALSE)
  endif
  if !IsObjectiveCompleted(400)
    SetObjectiveDisplayed(400, FALSE)
  endif
  if !IsObjectiveCompleted(475)
    SetObjectiveDisplayed(475, FALSE)
  endif
  if !IsObjectiveCompleted(500)
    SetObjectiveDisplayed(500, FALSE)
  endif
  if !IsObjectiveCompleted(600)
    SetObjectiveDisplayed(600, FALSE)
  endif


  SetStage(700)    ; End the quest

else    ; SECOND CASE - Old Longfellow is present
  SetStage(625)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Start the end conversation with Longfellow
pDLC03MQ02_0700_LongfellowEnd.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; "Where You Belong" now starts (talk to the leader of Acadia)
pDLC03MQ03.SetStage(10)

SetStage(675)
SetStage(700)    ; End the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
Alias_OldLongfellow.GetActorRef().SetAvailableToBeCompanion()
; workshop now available
DLC03LongfellowsCabinWorkshopRef.SetOwnedByPlayer(true)
DLC03_LongfellowsCabinMapMarker.AddToMap()

; Update the DLC03 workshop achievement on progress
pDLC03_Achievements.SetStage(674)

DLC03VisitLongFellowsCabin.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Make sure that "Living on the Edge" fires (even though it's a bit without context in this case)
pDLC03FarHarborM02.SetStage(100)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Unlock the Hull
pHullGateREF.Lock(FALSE)

; Restore the Nav Mesh
pHullBlockCollisionMarker.Disable()

; Disable the Children of Atom Preacher
Alias_ChildrenPreacher.GetActorRef().Disable()

; Now let all of the ambient scenes in town play
pFarHarborAmbientEnableMarker.Enable()

; Make Old Longfellow normal now
Actor aTarg = Alias_OldLongfellow.GetActorRef()
aTarg.IgnoreFriendlyHits(FALSE)
aTarg.RemoveFromFaction(pPlayerFaction)

; Signal that the town is now acting normal
pDLC03FarHarborUnderAttack.SetValue(0)
pDLC03FarHarborAbnormalState.SetValue(0)

; Kill the fight quest just in case
DLC03MQ02Fight.SetStage(1000)

; Update master quest
pDLC03FarHarborM02.SetStage(300)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(300)
endif
if ( !GetStageDone(400) )   ; If you haven't defended the Hull - progress M02
  pDLC03FarHarborM02.SetStage(160)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDLC03MQ02_0100_AmbientBoatApproach Auto Const Mandatory

ObjectReference Property pMQ01AllenInitialMarker Auto Const Mandatory

ReferenceAlias Property Alias_AllenLee Auto Const Mandatory

ReferenceAlias Property Alias_CaptainAvery Auto Const Mandatory

ObjectReference Property pMQ01AveryInitialMarker Auto Const Mandatory

ObjectReference Property pHullGateREF Auto Const Mandatory

Scene Property pDLC03MQ02_0300_CombatSequence Auto Const Mandatory

RefCollectionAlias Property Alias_Wave01 Auto Const Mandatory

RefCollectionAlias Property Alias_Wave02 Auto Const Mandatory

ReferenceAlias Property Alias_MirelurkQueen Auto Const Mandatory

RefCollectionAlias Property Alias_Trappers Auto Const Mandatory

ReferenceAlias Property Alias_ChildrenPreacher Auto Const Mandatory

Faction Property pDLC03MQ02LoneChildAtomFaction Auto Const Mandatory

ObjectReference Property pMQ02M07StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Male07Runner Auto Const Mandatory

ObjectReference Property pHullBlockCollisionMarker Auto Const Mandatory

ObjectReference Property pMQ02TrapperEnableMarker Auto Const Mandatory

ObjectReference Property pMQ02AnimalEnableMarker Auto Const Mandatory

ObjectReference Property pMQ02MirelurkAmbushTrigger Auto Const Mandatory

ObjectReference Property pFarHarborAmbientEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_OldLongfellow Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory

ObjectReference Property pDLC03MQ01PlayerFarHarborStartMarker Auto Const Mandatory

ObjectReference Property pDLC03NakanoResidenceMapMarkerREF Auto Const Mandatory

Quest Property pDLC03MQ01 Auto Const Mandatory

ActorValue Property pFollowerDistance Auto Const Mandatory

Potion Property pWhiskey Auto Const Mandatory

Scene Property pDLC03MQ02_0200c_AveryToWall Auto Const Mandatory

ReferenceAlias Property Alias_Mitch Auto Const Mandatory

ReferenceAlias Property Alias_F04Shopper Auto Const Mandatory

RefCollectionAlias Property Alias_LeftDefenders Auto Const Mandatory

RefCollectionAlias Property Alias_RightDefenders Auto Const Mandatory

ReferenceAlias Property Alias_Mariner Auto Const Mandatory

LeveledItem Property pDLC03_LL_HarpoonGun Auto Const Mandatory

Ammo Property pDLC03_AmmoHarpoon Auto Const Mandatory

Scene Property pDLC03MQ02_0220_HullWarning Auto Const Mandatory

Scene Property pDLC03MQ02_0600_OldLongfellowEscort Auto Const Mandatory

Quest Property pDLC03MQ03 Auto Const Mandatory

Scene Property pDLC03MQ02_0700_LongfellowEnd Auto Const Mandatory

ReferenceAlias Property Alias_NucleusMapMarker Auto Const Mandatory

Quest Property pDLC03_CustomItemQuest Auto Const Mandatory

GlobalVariable Property pDLC03PlayerKnowsMirelurkJerky Auto Const Mandatory

Potion Property pDLC03MirelurkJerky Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborUnderAttack Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborAbnormalState Auto Const Mandatory

Scene Property pDLC03MQ02_0600b_OldLongfellowEscortEnd Auto Const Mandatory

Scene Property pDLC03MQ02_0650a_ChildrenLongfellow Auto Const Mandatory

workshopscript Property DLC03LongfellowsCabinWorkshopRef Auto Const Mandatory

Quest Property pDLC03FarHarborFF03a_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborFF01_Misc Auto Const Mandatory

Scene Property DLC03MQ02_0200_AveryGreeting Auto Const Mandatory

Quest Property DLC03MQ02Fight Auto Const Mandatory

Scene Property pDLC03MQ02_0650c_PreacherKilled Auto Const Mandatory

MusicType Property pMUSDread01 Auto Const

Quest Property DLC03VisitLongFellowsCabin Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Weather Property pDLC03_RadFogWeather Auto Const Mandatory

ObjectReference Property DLC03_LongfellowsCabinMapMarker Auto Const Mandatory

LeveledItem Property WorkshopVendorWeapons01_LL Auto Const Mandatory

LeveledItem Property DLC03_LL_Ammo_Harpoon Auto Const Mandatory

LeveledItem Property DLC03_LL_Ammo_4570 Auto Const Mandatory

Quest Property pDLC03_Achievements Auto Const Mandatory
