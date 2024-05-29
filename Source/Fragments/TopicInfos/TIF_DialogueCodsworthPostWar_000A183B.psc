;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueCodsworthPostWar_000A183B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthForcegreet = 0
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthSandwhich = 0
akspeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Cram Auto Const

LeveledItem Property pLL_Food_Packaged Auto Const

Potion Property pSugarBombs Auto Const
