;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_SanctuaryHillsQuest01_0001F156 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Pistol
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pistol Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player takes pistol
SetObjectiveCompleted(10)

;shutdown
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
