;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03DialogueFarHarbor_01005BD7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
Quest __temp = self as Quest
DLC03:DLC03DialogueFarHarborScript kmyQuest = __temp as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
; Initialize quest
kmyQuest.InitializeQuest()

; Player is by default an ally of Far Harbor
pDLC03SettlementFarHarborFaction.SetAlly(pPlayerFaction)

; Add Mitch to the death list
Alias_NamedFarHarborPeople.AddRef(Alias_Mitch.GetActorRef())
Alias_NamedFarHarborPeople.AddRef(Alias_Debby.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;remove charge card and add caps
PlayerREF.RemoveItem(ChargeCard, 1)
PlayerREF.AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
Quest __temp = self as Quest
DLC03:DLC03DialogueFarHarborScript kmyQuest = __temp as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
; Now track when the player leaves Far Harbor to possibly have Andre die
kmyQuest.RegisterLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Teddy reacts to the player healing Andre
pDLC03DialogueFarHarbor_TeddyReactsToHealingAndre.Start()

; Stop the Teddy Wright intro scene from playing now
pDLC03IntroSceneTeddyWright.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
; Make Andre go away - he died
Alias_AndreMichaud.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Once Andre recovers, remove his special bed (since it doesn't have the full animation suite)
pDLC03AndreSickBed.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
Quest __temp = self as Quest
DLC03:DLC03DialogueFarHarborScript kmyQuest = __temp as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
; Now track when the player leaves Far Harbor to possibly have Andre die
kmyQuest.RegisterLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
Quest __temp = self as Quest
DLC03:DLC03DialogueFarHarborScript kmyQuest = __temp as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
; Resolve what happens to the Mariner
if ( pDLC03FarHarborS03.GetStageDone(560) )   ; She sails away
   Alias_Mariner.GetActorRef().Disable()
   pDLC03MarinerSailingGoodbyeNoteREF.Enable()
elseif ( pDLC03FarHarborS03.GetStageDone(580) )   ; She kills herself
   pDLC03MarinerWillNoteREF.Enable()
  actor aMariner = Alias_Mariner.GetActorRef()
  aMariner.MoveTo(pDLC03MarinerSuicideMarker)
  aMariner.GetActorBase().SetEssential(FALSE)
  aMariner.GetActorBase().SetProtected(FALSE)
  aMariner.Kill()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Check the other deeds
if ( GetStageDone(710) || GetStageDone(720) )
  pDLC03FarHarborM02.SetStage(590)   ; Signal Rite of Passage is potentially ready
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Check the other deeds
if ( GetStageDone(700) || GetStageDone(720) )
  pDLC03FarHarborM02.SetStage(590)   ; Signal Rite of Passage is potentially ready
endif

; Check to see if the Hull has been built right
if ( !pDLC03FarHarborFF03a.GetStageDone(375) )
  SetStage(715)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
; Check the other deeds
if ( GetStageDone(700) || GetStageDone(710) )
  pDLC03FarHarborM02.SetStage(590)   ; Signal Rite of Passage is potentially ready
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
Quest __temp = self as Quest
DLC03:DLC03DialogueFarHarborScript kmyQuest = __temp as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
; Clean up all of the essential people
Alias_NamedFarHarborPeople.SetEssential(FALSE)
Alias_NamedFarHarborPeople.SetProtected(FALSE)

; Make Old Longfellow hate you
Actor aLongfellow = Alias_OldLongfellow.GetActorRef()
pDLC03_COMOldLongfellow.SetStage(91)     ; Dismiss Old Longfellow if he's with you
(aLongfellow as CompanionActorScript).SetAffinity(-5000)
aLongfellow.SetEssential(FALSE)
aLongfellow.SetProtected(FALSE)

; Make the misc NPCs enemies of the player, too
Game.GetPlayer().RemoveFromFaction(pDLC03SettlementFarHarborFaction)
pDLC03SettlementFarHarborFaction.SetEnemy(pPlayerFaction)
pDLC03SettlementFarHarborGenericNPCFaction.SetEnemy(pPlayerFaction)

; Show somne notification
pDLC03FarHarbor_KickOutMessage.Show()

; Fail all the relevant quests
pDLC03FarHarborFF01.SetStage(9000)
pDLC03FarHarborFF02.SetStage(500)
pDLC03FarHarborFF03a.SetStage(9000)
pDLC03FarHarborFF03b.SetStage(9000)
pDLC03FarHarborFF03c.SetStage(9000)
pDLC03FarHarborM01.SetStage(9000)
pDLC03FarHarborS01.SetStage(9000)
pDLC03FarHarborS02.SetStage(9000)
pDLC03FarHarborS03.SetStage(9000)
pDLC03FarHarborM02.SetStage(9000)
pDLC03FarHarborM03.SetStage(9000)

; And unregister for the location change event
kmyQuest.UnregisterLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pDLC03SettlementFarHarborGenericNPCFaction Auto Const Mandatory
Faction Property pDLC03SettlementFarHarborFaction Auto Const Mandatory
Faction Property pPlayerFaction Auto Const Mandatory

Message Property pDLC03FarHarbor_KickOutMessage Auto Const Mandatory

ReferenceAlias Property Alias_OldLongfellow Auto Const Mandatory
ReferenceAlias Property Alias_AndreMichaud Auto Const Mandatory
ReferenceAlias Property Alias_Mitch Auto Const Mandatory
ReferenceAlias Property Alias_Mariner Auto Const Mandatory
RefCollectionAlias Property Alias_NamedFarHarborPeople Auto Const Mandatory

Scene Property pDLC03DialogueFarHarbor_TeddyReactsToHealingAndre Auto Const Mandatory

Quest Property pDLC03_COMOldLongfellow Auto Const Mandatory
Quest Property pDLC03FarHarborFF01 Auto Const Mandatory
Quest Property pDLC03FarHarborFF02 Auto Const Mandatory
Quest Property pDLC03FarHarborFF03a Auto Const Mandatory
Quest Property pDLC03FarHarborFF03b Auto Const Mandatory
Quest Property pDLC03FarHarborFF03c Auto Const Mandatory
Quest Property pDLC03FarHarborM01 Auto Const Mandatory
Quest Property pDLC03FarHarborS01 Auto Const Mandatory
Quest Property pDLC03FarHarborS02 Auto Const Mandatory
Quest Property pDLC03FarHarborS03 Auto Const Mandatory

ObjectReference Property pDLC03MarinerSailingGoodbyeNoteREF Auto Const Mandatory
ObjectReference Property pDLC03MarinerWillNoteREF Auto Const Mandatory
ObjectReference Property pMarinerBedREF Auto Const Mandatory
ObjectReference Property pDLC03MarinerSuicideMarker Auto Const Mandatory

MiscObject Property ChargeCard Auto Const Mandatory
MiscObject Property Caps001 Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Quest Property pDLC03IntroSceneTeddyWright Auto Const Mandatory

ObjectReference Property pDLC03AndreSickBed Auto Const Mandatory

ReferenceAlias Property Alias_Debby Auto Const Mandatory
