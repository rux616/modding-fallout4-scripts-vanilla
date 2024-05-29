;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RadioQuestSongContro_0101F225 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.LastCycleStartTime=GameDaysPassed.GetValue()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=4
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=6
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
DLC04:DLC04RadioQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=7
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameDaysPassed Auto Const Mandatory
