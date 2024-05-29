;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ203_000229EA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ202.SetStage(0)
MQ202.SetStage(300)

;enable preloader doors
MQ203MagicDoortoMemoryDen.Enable()
MQ203MemoryDenMagicDoor.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
kmyQuest.StartMemory(1, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(220)
kmyQuest.StartMemory(2, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(320)
kmyQuest.StartMemory(3, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(420)
kmyQuest.StartMemory(4, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(520)
kmyQuest.StartMemory(5, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(620)
kmyQuest.StartMemory(6, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
setStage(720)
kmyQuest.StartMemory(7, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
setStage(10)
;setStage(820)
setStage(720)
kmyQuest.StartMemory(8, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartQuest()
SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ202.SetStage(310)
;SetObjectiveDisplayed(10)
MQ202.SetStage(305)

;swap loungers
MQ203LoungerInstantEnterEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ203AmariVoiceoverScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.IntroDone()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeAllScenes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryA_ID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryB_ID)
; for testing
setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryB_ID)
; for quickstart:
setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryC_ID)
; for testing
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryC_ID)
; for quickstart:
setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryD_ID)
; for testing
setStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryD_ID)
; for quickstart:
setstage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryE_ID)
; for testing
setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryE_ID)
; for quickstart:
setstage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryF_ID)
; for testing
setStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryF_ID)
; for quickstart:
setstage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryH_ID)
; for testing
setStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryG_ID)
; for quickstart:
setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeMemoryVisible(kmyQuest.MemoryG_ID)
; for testing
setStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; for quickstart:
setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenMemoryExit(kmyQuest.MemoryH_ID)
; for testing
setStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq203script
Quest __temp = self as Quest
mq203script kmyQuest = __temp as mq203script
;END AUTOCAST
;BEGIN CODE
kmyQuest.FinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Set global to allow Synth Coursers to use teleportation now that the player knows
LL_ChanceNone_SynthCourserTeleport.SetValue(0.0)

;we no longer need preloader doors
MQ203MagicDoortoMemoryDen.Disable()
MQ203MemoryDenMagicDoor.Disable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ204DenDoneAV)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ203SceneAStartMarker Auto Const

Quest Property MQ202 Auto Const

GlobalVariable Property XPActTwoFinal Auto Const

Scene Property MQ203AmariVoiceoverScene Auto Const

ObjectReference Property MQ203MemoryDenMagicDoor Auto Const

ObjectReference Property MQ203LoungerInstantEnterEnableMarker Auto Const

ObjectReference Property MQ203MagicDoortoMemoryDen Auto Const

GlobalVariable Property LL_ChanceNone_SynthCourserTeleport Auto Const

ActorValue Property COMQC_MQ204DenDoneAV Auto Const
