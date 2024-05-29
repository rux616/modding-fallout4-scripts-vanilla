;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_CaravanLucasMove02Package_00133522 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Status 1 - chill out for awhile
pCaravanLucasCurrentStatus.SetValue(1)

; Next time we travel go to destination 3
pCaravanLucasCurrentDestination.SetValue(3)

Quest __temp = pCaravanBase as Quest
CaravanBaseScript kmyQuest = __temp as CaravanBaseScript

Debug.Trace("Finished " + self)
kmyQuest.CaravanWaits(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCaravanBase Auto Const

GlobalVariable Property pCaravanLucasCurrentDestination Auto Const
GlobalVariable Property pCaravanLucasCurrentStatus Auto Const
