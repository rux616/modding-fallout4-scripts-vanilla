;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DogmeatFindStuffScene_0005180C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
Game.StopDialogueCamera(abConsiderResume = false)
DogmeatIdles.Sniff()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DogmeatIdles.Sniff()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE DogmeatQuestFindStuffScript
DogmeatQuestFindStuffScript kmyQuest = GetOwningQuest() as DogmeatQuestFindStuffScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "Phase 3 ending. Will trace callback value.")
kmyquest.TraceCallbackValue()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DogmeatQuestFindStuffScript
DogmeatQuestFindStuffScript kmyQuest = GetOwningQuest() as DogmeatQuestFindStuffScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "didn't find anything, show message.")
kmyquest.ShowFailureMessage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
