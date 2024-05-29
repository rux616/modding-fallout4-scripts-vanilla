;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_CaravanDocWMove01Package_00130B84 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanDWCurrentStatus.SetValue(1)

; Next time we travel go to destination 2
pCaravanDWCurrentDestination.SetValue(2)

Quest __temp = pCaravanBase as Quest
CaravanBaseScript kmyQuest = __temp as CaravanBaseScript

Debug.Trace("Finished CaravanDocWMove01Package")
kmyQuest.CaravanWaits(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pCaravanDWCurrentStatus Auto Const

GlobalVariable Property pCaravanDWCurrentDestination Auto Const

Quest Property pCaravanBase Auto Const
