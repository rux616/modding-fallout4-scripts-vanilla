;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackerTurretTargetHolot_0018BC4A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DNMasterQuest.turretTargetSetup(ExplosivesCanSeeList, akTerminalRef)
debug.trace("Targeting explosives function. Go!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DNMasterQuest.turretTargetSetup(DoorBlockersCanSeeList, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DNMasterQuestScript Property DNMasterQuest Auto Const

FormList Property ExplosivesCanSeeList Auto Const

FormList Property DoorBlockersCanSeeList Auto Const
