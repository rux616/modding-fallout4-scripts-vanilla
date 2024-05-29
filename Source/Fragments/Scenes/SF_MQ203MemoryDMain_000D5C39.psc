;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203MemoryDMain_000D5C39 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_17_End
Function Fragment_Phase_17_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndMemory(kmyQuest.MemoryD_ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_20_End
Function Fragment_Phase_20_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RestartMemory(kmyQuest.MemoryD_ID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
