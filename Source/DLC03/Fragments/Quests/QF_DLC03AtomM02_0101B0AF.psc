;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AtomM02_0101B0AF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of the introductory conversation with Richter

SetObjectiveDisplayed(10)

;Alias_Holotape.GetRef().AddKeyword(FeaturedItem)

;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Update Objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

; Enable Sister Gwyneth & anything else that needs to be enabled
DLC03AtomM02_CabinEnableMarker.Enable()
DLC03AtomM02_SisterGwynethRef.Enable()

; Start Sister Gwyneth's Sermon scene (will not play until player is near her)
DLC03AtomM02_GwynethScene4Sermon.Start()

; Remove block activation on the two ransom note signs
Alias_POI38FlyerQT.GetReference().BlockActivation(False, False)
Alias_POI39FlyerQT.GetReference().BlockActivation(False, False)

; Move the holotape from the alias container to the cabin
Alias_Holotape.GetReference().MoveTo(DLC03AtomM02_HolotapeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Damage the POI 38 sign, using its destruction data to change art to the version w/o banner pieces
DLC03AtomM02_POI38RansomNote.DamageObject(50)

;Block activation on the POI 38 sign
DLC03AtomM02_POI38RansomNote.BlockActivation(True,True)

if GetStageDone(220) == True
;if the player has already collected the flyer pieces from the other holy site (POI 39)
      Game.GetPlayer().AddItem(Alias_FlyerWhole.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap1Wake.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap3Tak.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap4Stat.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap2Ion.GetReference(), 1)
      DLC03AtomM02_PlayerScene3FlyerWhole.Start()
      SetStage(300)
else
      Game.GetPlayer().AddItem(Alias_FlyerScrap1Wake.GetReference(), 1)
      Game.GetPlayer().AddItem(Alias_FlyerScrap2Ion.GetReference(), 1)     
      DLC03AtomM02_PlayerScene2FlyerHalf.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Damage the POI 39 sign, using its destruction data to change art to the version w/o banner pieces
DLC03AtomM02_POI39RansomNote01.DamageObject(50)

;Block activation on the POI 39 sign
DLC03AtomM02_POI39RansomNote01.BlockActivation(True,True)

if GetStageDone(210) == True
;if the player has already collected the flyer pieces from the other holy site (POI 38)
      Game.GetPlayer().AddItem(Alias_FlyerWhole.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap1Wake.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap3Tak.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap4Stat.GetReference(), 1)
      Game.GetPlayer().RemoveItem(Alias_FlyerScrap2Ion.GetReference(), 1)
      DLC03AtomM02_PlayerScene3FlyerWhole.Start()
      SetStage(300)
else
      Game.GetPlayer().AddItem(Alias_FlyerScrap4Stat.GetReference(), 1)
      Game.GetPlayer().AddItem(Alias_FlyerScrap3Tak.GetReference(), 1)     
      DLC03AtomM02_PlayerScene2FlyerHalf.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Updateo objectives
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;If the Kawaketak Station objective is displayed, re-flash it
;Set when the player enters the Kawaketak Station campground 

If GetStageDone(325) == False
   SetObjectiveDisplayed(30, abForce = true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
;Set when the player enters a trigger volume around the holotape
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Set in the end data of the scene DLC03AtomM02_GwynethJournal in DLC03HolotapesQuest

; if the player has not already dealt with Gwyneth (usually by killing her from outside the church),
; update the quest objectives to point the player to the church

if GetStageDone(600) == False
   ; Update objectives
   SetObjectiveCompleted(20)
   SetObjectiveCompleted(30)
   SetObjectiveDisplayed(35)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set in the end data of the scene DLC03AtomM02_GwynethJournal in DLC03HolotapesQuest

; if the player has not already dealt with Gwyneth (usually by killing her from outside the church),
; update the quest objectives to point the player to the church

if GetStageDone(600) == False
   ; Update objectives
   SetObjectiveCompleted(35)
   SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Set at the end of Sister Gwyneth's sermon

;Puts her into sandbox at the church
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by a trigger volume around the church at POI37

; if the player has not already dealt with Gwyneth (usually by killing her from outside the church),
; update the quest objectives, block activation on the signs, stop her sermon scene

if GetStageDone(600) == False

   ; Update objectives
   SetObjectiveCompleted(20)
   SetObjectiveCompleted(30)
   SetObjectiveCompleted(35)
   SetObjectiveCompleted(40)
   SetObjectiveDisplayed(50)

   ; Block activation on the banner pieces (also set in stage 600 if the player killed Gwyneth 
   ; from outside church)
   Alias_POI38FlyerQT.GetReference().BlockActivation(True,True)
   Alias_POI39FlyerQT.GetReference().BlockActivation(True,True)

   ; Stop the sermon
   DLC03AtomM02_GwynethScene4Sermon.Stop()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Set if the player chooses the first negative option in the Gwyneth scene

Alias_Gwyneth.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_Gwyneth.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;Disable prayer marker
DLC03AtomM02GwynethPrayerFurniture.Disable()

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
;Disable prayer marker
DLC03AtomM02GwynethPrayerFurniture.Disable()

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by the OnDeath script on Gwyneth

;Conditions dialogue in the final conversation

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
;Set if the player fails either speech challenge in the confrontation scene with Gwyneth
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;Set if the player chooses the final question option in Gwyneth confrontation scene

;Lowers the difficulty on the Green option in the same phase from Medium to Easy
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Update objectives
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

; Block activation on the banner pieces, the player has found Gwyneth and no longer needs these
Alias_POI38FlyerQT.GetReference().BlockActivation(True,True)
Alias_POI39FlyerQT.GetReference().BlockActivation(True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Variable journal entries depending on quest outcome

;Give item reward
DLC03_CustomItemQuest.setStage(30) ;adds custom item quest reward

;Disable Gwyneth's signs
DLC03AtomM02_POI39RansomNote01.Disable()
DLC03AtomM02_POI38RansomNote.Disable()

;Start up quest for Child to populate holy site
DLC03CoA_DialogueNucleusGenericHolySite.Start()

;Player can now get the title of Inquisitor
DLC03CoA_InquisitorTitleAvailable.SetValue(1)

;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(150)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_01
Function Fragment_Stage_0700_Item_01()
;BEGIN CODE
;Variable journal entries depending on quest outcome

;Give item reward
DLC03_CustomItemQuest.setStage(30) ;adds custom item quest reward

;Disable Gwyneth's signs
DLC03AtomM02_POI39RansomNote01.Disable()
DLC03AtomM02_POI38RansomNote.Disable()

;Start up quest for Child to populate holy site
DLC03CoA_DialogueNucleusGenericHolySite.Start()

;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(150)

DLC03AtomM02Post.Start()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_02
Function Fragment_Stage_0700_Item_02()
;BEGIN CODE
;Variable journal entries depending on quest outcome

;Give item reward
DLC03_CustomItemQuest.setStage(30) ;adds custom item quest reward

;Disable Gwyneth's signs
DLC03AtomM02_POI39RansomNote01.Disable()
DLC03AtomM02_POI38RansomNote.Disable()

;Start up quest for Child to populate holy site
DLC03CoA_DialogueNucleusGenericHolySite.Start()

;Player can now get the title of Inquisitor
DLC03CoA_InquisitorTitleAvailable.SetValue(1)

;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(150)

DLC03AtomM02Post.Start()

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
FailAllObjectives()

;Block activation on Gwyneth's banner signs
Alias_POI38FlyerQT.GetReference().BlockActivation(True)
Alias_POI39FlyerQT.GetReference().BlockActivation(True)

;Disable holotape and Gwyneth
Alias_Holotape.GetReference().Disable()
DLC03POI37_ChurchMarkerRef.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC03POI37_ChurchMarkerRef Auto Const Mandatory

Book Property DLC03_AtomM02_FlyerScrap1Inv Auto Const Mandatory

Book Property DLC03_AtomM02_FlyerScrap2Inv Auto Const Mandatory

Book Property DLC03_AtomM02_FlyerAssembled Auto Const Mandatory

Book Property DLC03_AtomM02_FlyerScrap3Inv Auto Const Mandatory

Book Property DLC03_AtomM02_FlyerScrap4Inv Auto Const Mandatory

Scene Property DLC03AtomM02_PlayerScene3FlyerWhole Auto Const Mandatory

Scene Property DLC03AtomM02_PlayerScene2FlyerHalf Auto Const Mandatory

ObjectReference Property DLC03AtomM02_CabinEnableMarker Auto Const Mandatory

Scene Property DLC03AtomM02_GwynethScene4Sermon Auto Const Mandatory

ObjectReference Property DLC03AtomM02_ChurchEnableMarkerRef Auto Const Mandatory

ObjectReference Property DLC03AtomM02_HolotapeMarker Auto Const Mandatory

ReferenceAlias Property Alias_Holotape Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Gwyneth Auto Const Mandatory

ObjectMod Property mod_Legendary_Weapon_RadiationDamage Auto Const Mandatory

Keyword Property FeaturedItem Auto Const Mandatory

ReferenceAlias Property Alias_POI39FlyerQT Auto Const Mandatory

ReferenceAlias Property Alias_POI38FlyerQT Auto Const Mandatory

MiscObject Property DLC03_Banner_Completed Auto Const Mandatory

MiscObject Property DLC03_Banner_WAKE Auto Const Mandatory

MiscObject Property DLC03_Banner_TAK Auto Const Mandatory

MiscObject Property DLC03_Banner_STAT Auto Const Mandatory

MiscObject Property DLC03_Banner_Ion Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory

ObjectReference Property DLC03AtomM02_POI39RansomNote01 Auto Const Mandatory

ObjectReference Property DLC03AtomM02_POI38RansomNote Auto Const Mandatory

ObjectReference Property DLC03AtomM02GwynethPrayerFurniture Auto Const Mandatory

ObjectReference Property DLC03AtomM02_SisterGwynethRef Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusGenericHolySite Auto Const Mandatory

GlobalVariable Property DLC03CoA_InquisitorTitleAvailable Auto Const Mandatory

Quest Property DLC03AtomM02Post Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory

ReferenceAlias Property Alias_FlyerScrap1Wake Auto Const Mandatory

ReferenceAlias Property Alias_FlyerScrap2Ion Auto Const Mandatory

ReferenceAlias Property Alias_FlyerScrap3Tak Auto Const Mandatory

ReferenceAlias Property Alias_FlyerScrap4Stat Auto Const Mandatory

ReferenceAlias Property Alias_FlyerWhole Auto Const Mandatory
