;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_InstSynthCreationScene_001AC0CE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE InstSynthCreationQuestScript
InstSynthCreationQuestScript kmyQuest = GetOwningQuest() as InstSynthCreationQuestScript
;END AUTOCAST
;BEGIN CODE
NewSynth.GetActorReference().SetAlpha(0)
NewSynth.GetActorReference().SetGhost()
NewSynth.GetActorReference().IgnoreFriendlyHits()
NewSynth.GetReference().Moveto(PoolFurniture.GetReference())
RoboticsArm.GetReference().WaitForAnimationEvent("SpawnNPC")
kmyquest.ArmReady=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
;NewSynth.GetReference().MoveTo(Pool)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE InstSynthCreationQuestScript
InstSynthCreationQuestScript kmyQuest = GetOwningQuest() as InstSynthCreationQuestScript
;END AUTOCAST
;BEGIN CODE
NewSynth.GetActorReference().SetAlpha(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
NewSynth.GetActorReference().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE InstSynthCreationQuestScript
InstSynthCreationQuestScript kmyQuest = GetOwningQuest() as InstSynthCreationQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ArmReady=0
;NewSynth.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property RoboticsArm Auto Const

ReferenceAlias Property NewSynth Auto Const

ObjectReference Property Pool Auto Const

ReferenceAlias Property PoolFurniture Auto Const
