;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01_0100AB43 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Display 'Reactivate the Relay Tower'
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player has activated the Relay Tower.

;Make sure the mission is active before doing anything with objectives.
if (GetStageDone(50))
     ;Complete 'Reactivate the Relay Tower'
     SetObjectiveCompleted(50)

     ;Display 'Follow the Brotherhood Distress Signal' if not already following a holotape to Varham.
     if (!IsObjectiveDisplayed(65))
          SetObjectiveDisplayed(60)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Player has listened to a Holotape directing them to Varham.

;Make sure the mission is active before doing anything with objectives.
if (GetStageDone(50))
     ;Display 'Follow the Recon Team's Traill' if not already following the Relay Tower to Varham.
     if (!IsObjectiveDisplayed(60))
          SetObjectiveDisplayed(65)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Lancer Varham
;On trigger, player is in range of Varham. Display objective marker if objective is active.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Lancer Varham
;When player picks up holotape, prompt them to listen.

;Make sure the mission is active before doing anything with objectives.
if (GetStageDone(50))
     ;Complete 'Follow the Brotherhood Distress Signal' / 'Follow the Recon Team's Traill'
     SetObjectiveCompleted(60)
     SetObjectiveCompleted(65)
     ;Display 'Listen to Knight Varham's Holotape'
     SetObjectiveDisplayed(71)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Lancer Varham
;When player listens to the holotape, give them the next objective.

;Make sure the mission is active before doing anything with objectives.
if (GetStageDone(50))
     ;Complete 'Listen to Knight Varham's Holotape'
     SetObjectiveCompleted(71)
     ;Display 'Follow the Recon Team's Trail'
     SetObjectiveDisplayed(72)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
