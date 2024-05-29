;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203MemoryEMain_000D76C1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_14_Begin
Function Fragment_Phase_14_Begin()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AdvanceMemory(kmyQuest.MemoryE_ID, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_20_End
Function Fragment_Phase_20_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndMemory(kmyQuest.MemoryE_ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_23_End
Function Fragment_Phase_23_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RestartMemory(kmyQuest.MemoryE_ID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
