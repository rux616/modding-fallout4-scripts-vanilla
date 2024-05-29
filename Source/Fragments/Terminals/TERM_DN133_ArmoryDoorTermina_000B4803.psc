;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN133_ArmoryDoorTermina_000B4803 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef().SetOpen(true)
;akTerminalRef.GetLinkedRef().activate(game.getPlayer())
Min03_SecurityDoorOpen.setValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef().SetOpen(false)
;akTerminalRef.GetLinkedRef().activate(game.getPlayer())
Min03_SecurityDoorOpen.setValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Min03_SecurityDoorOpen Auto Const
