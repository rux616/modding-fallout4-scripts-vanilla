;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RRM02_0100_InitialConvers_000A8C1C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
; Check to see if RR201 is active
if ( pRR201.IsRunning() )
  actor aDez = Alias_Desdemona.GetActorRef()
  aDez.MoveTo(pRRM02DezTeleportMarker)  ; If it is teleport Dez over
  aDez.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pRRM02DezTeleportMarker Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

Quest Property pRR201 Auto Const
