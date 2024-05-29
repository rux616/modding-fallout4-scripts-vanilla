;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_InstTeleporterRoomTermi_000D4D34 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if MQ207.GetStage() > 20
TeleportDoorRef.SetLockLevel(0)
TeleportDoorRef.SetOpen()
if BoS204.GetStageDone(10) == 1 && BoS204.GetStageDone(100) == 0
BoS204.SetStage(100)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TeleportDoorRef Auto Const

Quest Property BoS204 Auto Const

Quest Property MQ207 Auto Const
