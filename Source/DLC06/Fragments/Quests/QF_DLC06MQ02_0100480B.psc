;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06MQ02_0100480B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetActive()
; move control board into ghoul inventory
Alias_SecurityChief.GetRef().AddItem(Alias_ControlBoard.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq02script
Quest __temp = self as Quest
dlc06:dlc06mq02script kmyQuest = __temp as dlc06:dlc06mq02script
;END AUTOCAST
;BEGIN CODE
; The Overseer will start to speak soon
pDLC06MQ02_100a_IntercomIntro.Start()
kmyQuest.RegisterForWorkshopEvents(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq02script
Quest __temp = self as Quest
dlc06:dlc06mq02script kmyQuest = __temp as dlc06:dlc06mq02script
;END AUTOCAST
;BEGIN CODE
if ( !GetStageDone(200) )
  SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Open the security door
pDLC06SecurityTerminalREF.SetLockLevel(0)
pDLC06SecurityTerminalREF.Lock(FALSE)
pDLC06SecurityTerminalREF.SetOpen(TRUE)

; Open the rubble door
DLC06RubbleDoorREF.SetLockLevel(0)
DLC06RubbleDoorREF.Lock(FALSE)
DLC06RubbleDoorREF.SetOpen(TRUE)

pDLC06MQ02_200_SecurityLifted.Start()

; lighting change
DLC06VaultLightsOff.Disable()

; start MQ04 here since we know cell is loaded
DLC06MQ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
; move fast travel marker to a more convenient place
DLC06VaultWorkshopFastTravelMarker.MoveTo(DLC06VaultWorkshopFastTravelMarkerMoveTo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq02script
Quest __temp = self as Quest
dlc06:dlc06mq02script kmyQuest = __temp as dlc06:dlc06mq02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Queue up the next quest
pDLC06MQ03.SetStage(50)

kmyQuest.RegisterForWorkshopEvents(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
; Give the player a reward
Game.GetPlayer().AddItem(pPrewarMoney, 75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
CompleteQuest()
Stop()
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

Scene Property pDLC06MQ02_100a_IntercomIntro Auto Const Mandatory

Scene Property pDLC06MQ02_200_SecurityLifted Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

MiscObject Property pPrewarMoney Auto Const Mandatory

Quest Property DLC06WorkshopParent Auto Const Mandatory

Quest Property DLC06MQ04 Auto Const Mandatory

ObjectReference Property pDLC06SecurityTerminalREF Auto Const Mandatory

ReferenceAlias Property Alias_SecurityChief Auto Const Mandatory

ReferenceAlias Property Alias_ControlBoard Auto Const Mandatory

ObjectReference Property DLC06VaultLightsOff Auto Const Mandatory

ObjectReference Property DLC06RubbleDoorREF Auto Const Mandatory

ObjectReference Property DLC06VaultWorkshopFastTravelMarkerMoveTo Auto Const Mandatory

ObjectReference Property DLC06VaultWorkshopFastTravelMarker Auto Const Mandatory
