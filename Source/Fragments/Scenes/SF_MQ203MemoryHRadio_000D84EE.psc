;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203MemoryHRadio_000D84EE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE mq203script
mq203script kmyQuest = GetOwningQuest() as mq203script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " scene advancing memory to stage 1")
kmyQuest.AdvanceMemory(kmyQuest.MemoryH_ID, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
