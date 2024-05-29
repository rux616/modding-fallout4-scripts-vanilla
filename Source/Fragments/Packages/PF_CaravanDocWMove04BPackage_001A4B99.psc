;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_CaravanDocWMove04BPackage_001A4B99 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanDWCurrentStatus.SetValue(1)

; Next time we travel go to destination 1
pCaravanDWCurrentDestination.SetValue(1)

Quest __temp = pCaravanBase as Quest
CaravanBaseScript kmyQuest = __temp as CaravanBaseScript

kmyQuest.CaravanWaits(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pCaravanDWCurrentStatus Auto Const
GlobalVariable Property pCaravanDWCurrentDestination Auto Const

Quest Property pCaravanBase Auto Const

