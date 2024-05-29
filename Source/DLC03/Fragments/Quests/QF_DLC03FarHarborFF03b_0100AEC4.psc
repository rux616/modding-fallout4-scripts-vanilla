;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF03b_0100AEC4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC03FarHarborFF03a.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Master quest updated
pDLC03FarHarborM02.SetStage(500)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
if ( !Alias_MSAzaleaLocation.GetLocation().IsCleared() )   ; Is Azalea still hostile?
  SetObjectiveDisplayed(100)   ; If so - ping an objective
else
  SetStage(200)   ; Otherwise progress the quest
endif

; Shut off pointer quest
pDLC03FarHarborFF03b_Misc.SetStage(100)

; Master quest updated
pDLC03FarHarborM02.SetStage(550)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(550)
endif

; Add a map marker
Alias_MapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

; Give reward
Game.GivePlayerCaps(400)

; Master quest updated
pDLC03FarHarborM02.SetStage(575)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(575)
endif

; Keeping track of deeds for "Rite of Passage"
pDLC03DialogueFarHarbor.SetStage(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Enable the level 2 defenses
pLevel2.Enable()
pLevel2PanelsIntact.Enable()

; Queue up next part of the rebuilding
pDLC03FarHarborFF03c.SetStage(50)

; Close quest
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()
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

Quest Property pDLC03FarHarborFF03a Auto Const Mandatory

Quest Property pDLC03FarHarborFF03b_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborFF03c Auto Const Mandatory

ObjectReference Property pLevel2 Auto Const Mandatory

ObjectReference Property pLevel2PanelsIntact Auto Const Mandatory

Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory

LocationAlias Property Alias_MSAzaleaLocation Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
