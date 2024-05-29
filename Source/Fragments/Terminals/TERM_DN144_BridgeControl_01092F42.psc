;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN144_BridgeControl_01092F42 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if MS03.getStageDone(6) == false
     MS03.setStage(6)
     Vault120_BridgeAirlockA.SetOpen()
     Vault120_BridgeAirlockB.SetOpen()
     Vault120_BridgeAirlockLoadA.Lock(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS03 Auto Const

ObjectReference Property Vault120_BridgeAirlockA Auto Const

ObjectReference Property Vault120_BridgeAirlockB Auto Const

ObjectReference Property Vault120_BridgeAirlockLoadA Auto Const
