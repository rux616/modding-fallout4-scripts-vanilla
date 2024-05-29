;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborM02_0104E77A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

SetStage(200)

; Is MQ02 still spooling up for M02?
if ( !pDLC03MQ02.GetStageDone(400) && pDLC03MQ02.IsRunning() )
  SetObjectiveDisplayed(150)
else
  SetStage(400)  ; Otherwise go ahead and find the Mariner
endif

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(150)

SetStage(595)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
; Hide the objective
SetObjectiveDisplayed(150, FALSE)

SetStage(595)
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
if ( !GetStageDone(390) && !GetStageDone(350) )   ; Make sure Avery's still around
  SetObjectiveDisplayed(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(390) )  ; Make sure Avery's still around
  SetObjectiveCompleted(300)
  SetObjectiveDisplayed(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(390) )  ; Make sure Avery's still around
  SetObjectiveCompleted(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
; Potentially clean up objectives
if ( !GetStageDone(375) )
  SetObjectiveDisplayed(300, FALSE)
  SetObjectiveDisplayed(350, FALSE)
endif
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

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
; Check to see if Rite of Passage is ready
if ( GetStageDone(595) )
  SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0595_Item_00
Function Fragment_Stage_0595_Item_00()
;BEGIN CODE
; Check to see if Rite of Passage is ready
if ( GetStageDone(590) )
  SetStage(600)
endif

SetStage(400)  ; Trigger you should find the Mariner
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(600)

pDLC03FarHarborM01.SetStage(50)   ; Then Rite of Passage can begin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03ObjectiveClearScript
Quest __temp = self as Quest
DLC03:DLC03ObjectiveClearScript kmyQuest = __temp as DLC03:DLC03ObjectiveClearScript
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(600)

kmyQuest.CleanObjective(250)
kmyQuest.CleanObjective(350)
kmyQuest.CleanObjective(450)
kmyQuest.CleanObjective(550)

; Clean up objectives
if ( !GetStageDone(275) )
   SetObjectiveDisplayed(200, FALSE)
   SetObjectiveDisplayed(250, FALSE)
endif

if ( !GetStageDone(375) )
   SetObjectiveDisplayed(300, FALSE)
   SetObjectiveDisplayed(350, FALSE)
endif

if ( !GetStageDone(475) )
   SetObjectiveDisplayed(400, FALSE)
   SetObjectiveDisplayed(450, FALSE)
endif

if ( !GetStageDone(575) )
   SetObjectiveDisplayed(500, FALSE)
   SetObjectiveDisplayed(550, FALSE)
endif

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

Quest Property pDLC03MQ02 Auto Const Mandatory

Quest Property pDLC03FarHarborM01 Auto Const Mandatory
