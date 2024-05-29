;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN158_FloodDoorForeTerm_0008C05C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain()
int i = 0
while i < akTerminalRef.countLinkedRefChain()
	(linkedRefChain[i].setOpen(true))
	i += 1
endWhile

DN158SubDoorLightController LightController = (akTerminalRef.GetLinkedRef(LinkCustom01) as DN158SubDoorLightController)
if LightController
	LightController.EZLightState("green")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain()
int i = 0
while i < akTerminalRef.countLinkedRefChain()
	(linkedRefChain[i].setOpen(false))
	i += 1
endWhile

DN158SubDoorLightController LightController = (akTerminalRef.GetLinkedRef(LinkCustom01) as DN158SubDoorLightController)
if LightController
	LightController.EZLightState("yellow")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const
