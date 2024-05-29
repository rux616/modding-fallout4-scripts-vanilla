;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_Vault111OverseersTermin_000A0F1C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Vault111_OverseerDoor.Unlock()
Vault111_OverseerDoor.SetOpen(true)

;pOverseerDoorEnableParent.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Vault111_OverseerDoor Auto Const

ObjectReference Property Vault111_OverseerDoor02 Auto Const

ObjectReference Property pOverseerDoorEnableParent Auto Const
