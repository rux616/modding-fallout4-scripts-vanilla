;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborM03_0104E779 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Mitch's intro no longer makes sense
pDLC03DialogueFarHarbor.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; SYNC UP ALL THE OBJECTIVES FOR EVERYTHING
; Check out FF01's status
if ( pDLC03FarHarborFF01.IsRunning() )
  if ( !pDLC03FarHarborFF01.GetStageDone(100) )
    SetStage(200)
  else
    SetStage(250)
  endif
endif

; Check out FF02's status
if ( pDLC03FarHarborFF02.IsRunning() )
  if ( !pDLC03FarHarborFF02.GetStageDone(100) )
    SetStage(300)
  else
    SetStage(350)
  endif
endif

; Check out FF03a's status
if ( !pDLC03FarHarborFF03a.GetStageDone(100) )
  SetStage(400)
elseif ( !pDLC03FarHarborFF03a.GetStageDone(300) && !pDLC03FarHarborFF03a.GetStageDone(250) )
    SetStage(450)
endif

; Check out FF03b's status
if ( pDLC03FarHarborFF03b.IsRunning() )
  if ( !pDLC03FarHarborFF03b.GetStageDone(100) )
    SetStage(500)
  elseif ( !pDLC03FarHarborFF03b.GetStageDone(300) )
    SetStage(550)
  endif
endif

; Check out FF03c's status
if ( pDLC03FarHarborFF03c.IsRunning() )
  if ( !pDLC03FarHarborFF03c.GetStageDone(100) )
    SetStage(600)
  elseif ( !pDLC03FarHarborFF03c.GetStageDone(300) )
    SetStage(650)
  endif
endif

; Check out S03''s status
if ( pDLC03FarHarborS03.IsRunning() )
  if ( !pDLC03FarHarborS03.GetStageDone(100) )
    SetStage(900)
  elseif ( !pDLC03FarHarborS03.GetStageDone(600) )
    SetStage(950)
  endif
endif

; Objectives
SetStage(700)
SetStage(800)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(350) )   ; Don't display the objective if you've already talked to Avery
  SetObjectiveDisplayed(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveFailed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(700)
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(750)

; Can the quest end?
if ( GetStageDone(875) )
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0875_Item_00
Function Fragment_Stage_0875_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(850)

; Can the quest end?
if ( GetStageDone(775) )
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(900)
SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Give the custom reward - Rescue Diver Suit
pDLC03_CustomItemQuest.SetStage(90)

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

Quest Property pDLC03FarHarborFF01 Auto Const Mandatory
Quest Property pDLC03FarHarborFF02 Auto Const Mandatory
Quest Property pDLC03FarHarborFF03a Auto Const Mandatory
Quest Property pDLC03FarHarborFF03b Auto Const Mandatory
Quest Property pDLC03FarHarborFF03c Auto Const Mandatory
Quest Property pDLC03FarHarborS03 Auto Const Mandatory
Quest Property pDLC03_CustomItemQuest Auto Const Mandatory

Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory
