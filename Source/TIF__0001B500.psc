;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0001B500 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueConcordScript Script = DialogueConcord as DialogueConcordScript
Script.IntroPlayerOpinion = 1
DialogueConcord.SetStage (40)
IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IntroScene  Auto Const  

Quest Property DialogueConcord  Auto Const  
