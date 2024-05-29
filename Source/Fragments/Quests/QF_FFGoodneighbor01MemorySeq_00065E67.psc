;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor01MemorySeq_00065E67 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;enable preloader doors
MQ105MemoryDenMagicDoor.Enable()
MQ105MagicDoortoMemoryDen.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01MemorySequenceScript
Quest __temp = self as Quest
FFGoodneighbor01MemorySequenceScript kmyQuest = __temp as FFGoodneighbor01MemorySequenceScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;swap memory loungers
MQ105MemoryLoungerEnableMarker.Disable()

FFGoodneighbor01.SetStage(45)
FFGoodneighbor01AmariVoiceoverScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFGoodneighbor01AmariVoiceoverScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01MemorySequenceScript
Quest __temp = self as Quest
FFGoodneighbor01MemorySequenceScript kmyQuest = __temp as FFGoodneighbor01MemorySequenceScript
;END AUTOCAST
;BEGIN CODE
; unpause
kmyQuest.PauseMemory(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01MemorySequenceScript
Quest __temp = self as Quest
FFGoodneighbor01MemorySequenceScript kmyQuest = __temp as FFGoodneighbor01MemorySequenceScript
;END AUTOCAST
;BEGIN CODE
; pause
kmyQuest.PauseMemory(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01MemorySequenceScript
Quest __temp = self as Quest
FFGoodneighbor01MemorySequenceScript kmyQuest = __temp as FFGoodneighbor01MemorySequenceScript
;END AUTOCAST
;BEGIN CODE
kmyquest.FinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01MemorySequenceScript
Quest __temp = self as Quest
FFGoodneighbor01MemorySequenceScript kmyQuest = __temp as FFGoodneighbor01MemorySequenceScript
;END AUTOCAST
;BEGIN CODE
;delete enable layer so we aren't locking controls
kmyquest.EnableLayer = none

;no longer need preloader doors
MQ105MagicDoortoMemoryDen.Disable()
MQ105MemoryDenMagicDoor.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ105MemoryDenMagicDoor Auto Const

ObjectReference Property MQ105MagicDoortoMemoryDen Auto Const

ObjectReference Property MQ105MemoryLoungerEnableMarker Auto Const

Scene Property FFGoodneighbor01AmariVoiceoverScene Auto Const

ObjectReference Property MQ105PlayerMovetoInsideMemoryMarker Auto Const

Quest Property MQ101KelloggSequence Auto Const

SPELL Property MQ203PlayerInvisibility Auto Const

ReferenceAlias Property Alias_MemoryDenInstantEnterLounger Auto Const

Quest Property FFGoodneighbor01 Auto Const
