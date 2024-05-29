;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_FollowersCompanionSleepNe_000F3C1F Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
debug.trace(self + "OnChange, will say (CAT_Event_SleepTogetherWake line")
akActor.SayCustom(CAT_Event_SleepTogetherWake)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property CAT_Event_SleepTogetherWake Auto Const
