;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ00_01001B3E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dcl03mq00script
Quest __temp = self as Quest
dlc03:dcl03mq00script kmyQuest = __temp as dlc03:dcl03mq00script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " Init DLC start")

;check if the player has already advanced far enough to trigger the DLC message
;if it doesn't trigger here, it will trigger on a change location event in the story manager
If (MQ105.GetStageDone(1000) == 1)
  ;skip this if the player is already inside the detective agency
  If Game.GetPlayer().GetParentCell() == DmndValentines01
    kmyquest.DLC03SkipRadioMessage()
  Else
    kmyquest.DLC03StartRadioMessage()   
  EndIf
EndIf

; add menu items for VR workshop
WorkshopMenuMain.AddForm(DLC03WorkshopRecipeFilterVRBuilding)

debug.trace(self + " Init DLC done")

DLC03AnglerFaction.SetAlly(MirelurkFaction)
DLC03AnglerFaction.SetAlly(VertibirdFaction, true, true)
DLC03AnglerFaction.SetAlly(CaptiveFaction, true, true)

;For DLC03AtomM02: block activation on Gwyneth's signs
;This gets undone in stage 200 of that quest
DLC03AtomM02_POI39RansomNote01.BlockActivation(True, True)
DLC03AtomM02_POI38RansomNote.BlockActivation(True, True)

;For DLC03PostQuestTreasureDig, block stash cover activation
DLC03PostQuestTreasureDig_Cover.BlockActivation(True,True)

; add new boss loc ref type to form list
BossLocRefTypeList.AddForm(DLC03WorkshopSettlementBoss)
BossLocRefTypeList.AddForm(DLC03WorkshopSettlementLeader)

;add DLC03SettlementFarHarborCrimeFaction to all Companion "consider as murder" form lists
;Cait and X6 deliberately left off this because they would not care
CompanionMurder_Codsworth.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Curie.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Danse.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Deacon.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Hancock.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_MacCready.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Piper.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Preston.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Strong.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Valentine.AddForm(DLC03SettlementFarHarborCrimeFaction)
CompanionMurder_Cait.AddForm(DLC03SettlementFarHarborCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ105.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dcl03mq00script
Quest __temp = self as Quest
dlc03:dcl03mq00script kmyQuest = __temp as dlc03:dcl03mq00script
;END AUTOCAST
;BEGIN CODE
; Call the function - the quest script handles all the logic
kmyQuest.DLC03KickOutOfFarHarbor()

;Fail freeform quests
DLC03FarHarborFF01.SetStage(500)
DLC03FarHarborFF02.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
ModScrapScalar_Uncommon.SetValue(1.0)
;ModScrapScalar_Rare.SetValue(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105 Auto Const Mandatory

FormList Property WorkshopMenuMain Auto Const Mandatory

Keyword Property DLC03WorkshopRecipeFilterVRBuilding Auto Const Mandatory

Keyword Property DLC03WorkshopRecipeFilterVRDefense Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

Faction Property MirelurkFaction Auto Const Mandatory

Faction Property VertibirdFaction Auto Const Mandatory

Faction Property DLC03AnglerFaction Auto Const Mandatory

ObjectReference Property DLC03AtomM02_POI39RansomNote01 Auto Const Mandatory

ObjectReference Property DLC03AtomM02_POI38RansomNote Auto Const Mandatory

Quest Property DLC03FarHarborFF01 Auto Const Mandatory

FormList Property BossLocRefTypeList Auto Const Mandatory

LocationRefType Property DLC03WorkshopSettlementBoss Auto Const Mandatory

GlobalVariable Property ModScrapScalar_Uncommon Auto Const Mandatory

GlobalVariable Property ModScrapScalar_Rare Auto Const Mandatory

LocationRefType Property DLC03WorkshopSettlementLeader Auto Const Mandatory

Quest Property DLC03FarHarborFF02 Auto Const Mandatory

;ObjectReference Property DLCC03FarHarborFF02_RepairCondenser3 Auto Const Mandatory

;ObjectReference Property DLC03FarHarborFF02_RepairCondenser2 Auto Const Mandatory

;ObjectReference Property DLC03FarHarborFF02_RepairCondenser1 Auto Const Mandatory

Cell Property DmndValentines01 Auto Const Mandatory

ObjectReference Property DLC03PostQuestTreasureDig_Cover Auto Const Mandatory

ObjectReference Property DLC03FogCondenser01Ref Auto Const Mandatory

ObjectReference Property DLC03FogCondenser03Ref Auto Const Mandatory

ObjectReference Property DLC03FogCondenser02Ref Auto Const Mandatory

Faction Property DLC03SettlementFarHarborCrimeFaction Auto Const Mandatory

FormList Property CompanionMurder_Cait Auto Const Mandatory

FormList Property CompanionMurder_X6_88 Auto Const Mandatory

FormList Property CompanionMurder_Valentine Auto Const Mandatory

FormList Property CompanionMurder_Strong Auto Const Mandatory

FormList Property CompanionMurder_Preston Auto Const Mandatory

FormList Property CompanionMurder_Piper Auto Const Mandatory

FormList Property CompanionMurder_MacCready Auto Const Mandatory

FormList Property CompanionMurder_Hancock Auto Const Mandatory

FormList Property CompanionMurder_Deacon Auto Const Mandatory

FormList Property CompanionMurder_Danse Auto Const Mandatory

FormList Property CompanionMurder_Curie Auto Const Mandatory

FormList Property CompanionMurder_Codsworth Auto Const Mandatory
