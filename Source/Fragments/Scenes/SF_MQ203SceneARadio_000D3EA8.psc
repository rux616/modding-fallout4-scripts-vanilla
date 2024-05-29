;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203SceneARadio_000D3EA8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE MQ203Script
MQ203Script kmyQuest = GetOwningQuest() as MQ203Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AdvanceMemory(kmyQuest.MemoryA_ID, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
