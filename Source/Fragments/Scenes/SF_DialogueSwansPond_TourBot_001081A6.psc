;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueSwansPond_TourBot_001081A6 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN AUTOCAST TYPE DialogueSwansPondScript
DialogueSwansPondScript kmyQuest = GetOwningQuest() as DialogueSwansPondScript
;END AUTOCAST
;BEGIN CODE
actor aTourBot = Alias_TourBot.GetActorRef()
kmyQuest.nTourBotWallahID = pQSTFreedomTrailWallaLPM.Play(aTourBot)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property pQSTFreedomTrailWallaLPM Auto Const

ReferenceAlias Property Alias_Tourbot Auto Const
