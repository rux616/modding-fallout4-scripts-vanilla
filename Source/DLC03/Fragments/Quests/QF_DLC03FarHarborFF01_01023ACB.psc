;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF01_01023ACB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if GetStageDone(110) == False
   SetObjectiveDisplayed(10)
   DLC03NationalParkCampgroundMapMarker.AddToMap()
else
   SetObjectiveDisplayed(20)
endif


; Deal with the pointer quest
pDLC03FarHarborFF01_Misc.Start()
pDLC03FarHarborFF01_Misc.Stop()

; Far Harbor master quest updated
pDLC03FarHarborM02.SetStage(250)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
If GetStageDone(100) == True
   SetObjectiveCompleted(10)
   SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set in phase x of scene x, represents cassie giving the player 200 caps

Game.GetPlayer().AddItem(Caps001, 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;Set if the player passes the first speech challenge to get more money

Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

if GetStageDone(210) == False
   SetObjectiveDisplayed(30)
   DLC03DaltonFarmMapMarkerRef.AddToMap()
else
   SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if GetStageDone(200) == True
   SetObjectiveCompleted(30)
   SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; Dalton Farm now player owned
DLC03DaltonFarmWorkshopRef.SetOwnedByPlayer(true)

; enable fog condensers
DLC03DaltonFarmEnableMarker.Enable()

; enable and assign settlers
WorkshopNPCScript npc01 = Alias_DaltonFarmNPC01.GetActorRef() as WorkshopNPCScript
WorkshopNPCScript npc02 = Alias_DaltonFarmNPC02.GetActorRef() as WorkshopNPCScript
npc01.Enable()
npc02.Enable()

DLC03DaltonFarmWorkshopRef.WorkshopParent.AddActorToWorkshop(npc01, DLC03DaltonFarmWorkshopRef)
DLC03DaltonFarmWorkshopRef.WorkshopParent.AddActorToWorkshop(npc02, DLC03DaltonFarmWorkshopRef)

; Add Dalton Farm map markler to the map
DLC03DaltonFarmMapMarkerRef.AddToMap()

; Update the DLC03 workshop achievement on progress
pDLC03_Achievements.SetStage(672)

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set when Cassie gives the player 200 caps for the second time

Game.GetPlayer().AddItem(Caps001, 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Set if the player passes the second speech challenge to get more money

Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)

if GetStageDone(310) == False
   SetObjectiveDisplayed(50)
   DLC03BrookesHeadLighthouseMapMarker.AddToMap()
else
   SetObjectiveDisplayed(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
if GetStageDone(300) == True
   SetObjectiveCompleted(50)
   SetObjectiveDisplayed(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Set in the holotape scene when phase 1 begins
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF01Script
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF01Script kmyQuest = __temp as DLC03:DLC03FarHarborFF01Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

;Give item reward "Bloodletter"
DLC03_CustomItemQuest.SetStage(220)

;Give caps reward
If kmyquest.CassieReward == 0
    PlayerREF.AddItem(caps001, 500)
elseIf kmyquest.CassieReward == 1
    PlayerREF.AddItem(caps001, 550)
elseIf kmyquest.CassieReward == 2
    PlayerREF.AddItem(caps001, 600)
elseIf kmyquest.CassieReward == 3
    PlayerREF.AddItem(caps001, 800)
endIf

; Far Harbor master quest updated
pDLC03FarHarborM02.SetStage(275)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(275)
endif

; Rite of Passage is now available
pDLC03FarHarborM01.SetStage(50)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by DLC03MQ00 stage 100 (Far Harbor kickout)

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const Mandatory

ObjectMod Property mod_Legendary_Weapon_Bleed Auto Const Mandatory

ObjectReference Property DLC03DaltonFarmEnableMarker Auto Const Mandatory

workshopscript Property DLC03DaltonFarmWorkshopRef Auto Const Mandatory

ReferenceAlias Property Alias_DaltonFarmNPC01 Auto Const Mandatory

ReferenceAlias Property Alias_DaltonFarmNPC02 Auto Const Mandatory

Quest Property pDLC03FarHarborFF01_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborM01 Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

ObjectReference Property DLC03DaltonFarmMapMarkerRef Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory

Quest Property pDLC03_Achievements Auto Const Mandatory

ObjectReference Property DLC03NationalParkCampgroundMapMarker Auto Const Mandatory

ObjectReference Property DLC03BrookesHeadLighthouseMapMarker Auto Const Mandatory
