;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_MBattle_1295_Ju_010021CC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
DLC01:DLC01LairQuestScript kmyQuest = GetOwningQuest() as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartSparksInteract()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
