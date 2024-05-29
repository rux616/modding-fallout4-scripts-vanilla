;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203SceneA_000D3CA1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
; get mom to start reading
debug.trace(self + " start reading from scene phase")
kmyQuest.MemoryA_Actors[kmyQuest.MemoryAMomIndex].ActorAlias.GetActorRef().PlayIdle(kmyQuest.IdleBookReadStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
; get mom to start reading
debug.trace(self + " start reading from scene phase")
kmyQuest.MemoryA_Actors[kmyQuest.MemoryAMomIndex].ActorAlias.GetActorRef().PlayIdle(kmyQuest.IdleBookReadStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
; kellogg looks at mom
debug.trace(self + " start Kellogg idle from scene phase")
kmyQuest.MemoryA_Actors[kmyQuest.MemoryAKelloggIndex].ActorAlias.GetActorRef().PlayIdle(kmyQuest.KelloggOnBedTalkingToMom)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
; kellogg looks at mom
debug.trace(self + " start Kellogg idle from scene phase")
kmyQuest.MemoryA_Actors[kmyQuest.MemoryAKelloggIndex].ActorAlias.GetActorRef().PlayIdle(kmyQuest.KelloggOnBedTalkingToMom)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_12_Begin
Function Fragment_Phase_12_Begin()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AdvanceMemory(kmyQuest.MemoryA_ID, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_13_Begin
Function Fragment_Phase_13_Begin()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AdvanceMemory(kmyQuest.MemoryA_ID, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_18_End
Function Fragment_Phase_18_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndMemory(kmyQuest.MemoryA_ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_20_End
Function Fragment_Phase_20_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RestartMemory(kmyQuest.MemoryA_ID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
