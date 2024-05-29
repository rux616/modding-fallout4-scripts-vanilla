;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_001_MirrorScene_000A7D3C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
Game.GetPlayer().ChangeAnimFaceArchetype(AnimFaceArchetypeNeutral)
Game.GetPlayer().PlayIdle(SinkFacegen_M1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN AUTOCAST TYPE mq101questscript
mq101questscript kmyQuest = GetOwningQuest() as mq101questscript
;END AUTOCAST
;BEGIN CODE
;open menu
Game.ShowRaceMenu(akMenuSpouseFemale = SpouseFemale.GetActorRef(),akMenuSpouseMale = SpouseMale.GetActorRef())
Tutorial.SetStage(2010)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property pTestMQ101FaceGenMessage Auto Const

Idle Property IdleFaceGenCamStart Auto Const

Idle Property IdleFaceGenCamStop Auto Const

ReferenceAlias Property SpouseMale Auto Const
ReferenceAlias Property SpouseFemale Auto Const

Idle Property SinkFacegen_M1 Auto Const

Keyword Property AnimFaceArchetypeNeutral Auto Const

Quest Property Tutorial Auto Const
