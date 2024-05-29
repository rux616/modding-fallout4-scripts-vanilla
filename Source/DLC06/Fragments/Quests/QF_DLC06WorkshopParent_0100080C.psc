;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06WorkshopParent_0100080C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06WorkshopParent
Quest __temp = self as Quest
DLC06:DLC06WorkshopParent kmyQuest = __temp as DLC06:DLC06WorkshopParent
;END AUTOCAST
;BEGIN CODE
kmyQuest.VaultWorkshop.SetOwnedByPlayer(true)
kmyQuest.debugEnableAllBuildAreas()
; flag this workshop - no free recruits (this is handled in MQ03)
kmyQuest.VaultWorkshop.RadioBeaconFirstRecruit = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06WorkshopParent
Quest __temp = self as Quest
DLC06:DLC06WorkshopParent kmyQuest = __temp as DLC06:DLC06WorkshopParent
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForLocationLoadedEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
WorkshopObjectScript switch = Alias_RadioTransmitterSwitch.GetRef() as WorkshopObjectScript
; make sure beacon switch is off
switch.Activate(Game.GetPlayer())
if switch.GetOpenState() < 3
  switch.bRadioOn = false
endif

; make sure disabled (should be already)
DLC06WorkshopRadioRef.Disable()
; fill radio transmitter alias
Alias_RadioTransmitter.ForceRefTo(DLC06WorkshopRadioRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06WorkshopParent
Quest __temp = self as Quest
DLC06:DLC06WorkshopParent kmyQuest = __temp as DLC06:DLC06WorkshopParent
;END AUTOCAST
;BEGIN CODE
Game.AddAchievement(kmyQuest.iAchievement01ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06WorkshopParent
Quest __temp = self as Quest
DLC06:DLC06WorkshopParent kmyQuest = __temp as DLC06:DLC06WorkshopParent
;END AUTOCAST
;BEGIN CODE
Game.AddAchievement(kmyQuest.iAchievement02ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06WorkshopParent
Quest __temp = self as Quest
DLC06:DLC06WorkshopParent kmyQuest = __temp as DLC06:DLC06WorkshopParent
;END AUTOCAST
;BEGIN CODE
Game.AddAchievement(kmyQuest.iAchievement03ID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC06MQ01 Auto Const Mandatory

ReferenceAlias Property Alias_RadioTransmitter Auto Const Mandatory

ReferenceAlias Property Alias_RadioTransmitterSwitch Auto Const Mandatory

Quest Property DLC06MQ01RadioBeacon Auto Const Mandatory

ObjectReference Property DLC06WorkshopRadioRef Auto Const Mandatory
