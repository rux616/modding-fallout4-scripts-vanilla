;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRDeaconBetrayal_0018ADF6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Player is being sent to kill the Railroad

; Is Deacon with you?
if ( Alias_Companion.GetActorRef() == Alias_Deacon.GetActorRef() )
   Utility.Wait(1.0)
   pRRDeaconBetrayal_Interrupt.Start()
else
   SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Player is kicked out of the Railroad & Deacon goes hostile
pRRKickOut.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRRKickOut Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

Scene Property pRRDeaconBetrayal_Interrupt Auto Const
