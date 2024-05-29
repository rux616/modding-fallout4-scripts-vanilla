;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_HC_FillWaterBottlePerk_010044C9 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
HC_Manager.Trace(self,  "Activate Entry Point akTargetRef: " + akTargetRef)
HC_Manager.FillWaterBottle(akTargetRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

hardcore:hc_managerscript Property HC_Manager Auto Const Mandatory
