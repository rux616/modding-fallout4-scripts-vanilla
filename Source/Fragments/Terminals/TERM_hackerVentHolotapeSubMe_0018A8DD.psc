;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackerVentHolotapeSubMe_0018A8DD Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalTripwire)
int i = 0
ObjectReference fireFrom

while i < akTerminalRef.countLinkedRefChain(LinkTerminalTripwire)
		(linkedRefChain[i].Activate(akTerminalRef))
;ObjectReference LaserObject = linkedRefChain[i].placeatme(LaserMarker, 1) as ObjectReference
		;LaserObject.PlaceAtNode("Beam", linkedRefChain[i])
		;fireWhat.Cast(LaserObject)
		fireFrom = linkedRefChain[i].GetLinkedRef(LinkCustom01)
		fireWhat.Cast(fireFrom)
		i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalSpeaker)
int i = 0
ObjectReference radioRef
while i < akTerminalRef.countLinkedRefChain(LinkTerminalSpeaker)
	(linkedRefChain[i].CreateDetectionEvent(Game.GetPlayer(), 100))
	radioRef = (linkedRefChain[i].placeatme(terminalHackerRadioTransmitMarker, 1))
	i += 1
endWhile
int c = 0

while c < 10
i = 0
utility.wait(6.0)
while i < akTerminalRef.countLinkedRefChain(LinkTerminalSpeaker)
	(linkedRefChain[i].CreateDetectionEvent(none, 100))
	i += 1
endWhile
c += 1
endwhile
radioRef.delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalVent)
int i = 0
int c = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalVent)
	(linkedRefChain[i].GetLinkedRef().Enable(true))
	(linkedRefChain[i].GetLinkedRef(DamageTypeRadiation).Enable(true))
	objectReference[] linkedRefChain2 = linkedRefChain[i].getLinkedRefChain(DamageTypeRadiation)
c = 0
while c < linkedRefChain[i].countLinkedRefChain(DamageTypeRadiation)
		(linkedRefChain2[c].GetLinkedRef(DamageTypeRadiation).Enable(true))
c += 1
endwhile
	i += 1
endWhile
utility.wait(30.0)
i = 0
if linkedRefChain[i].GetLinkedRef().IsDisabled() == false
while i < akTerminalRef.countLinkedRefChain(LinkTerminalVent)
	(linkedRefChain[i].GetLinkedRef().Disable(true))
	(linkedRefChain[i].GetLinkedRef(DamageTypeRadiation).Disable(true))
	objectReference[] linkedRefChain2 = linkedRefChain[i].getLinkedRefChain(DamageTypeRadiation)
c = 0
while c < linkedRefChain[i].countLinkedRefChain(DamageTypeRadiation)
		(linkedRefChain2[c].GetLinkedRef(DamageTypeRadiation).Disable(true))
c += 1
endwhile
	i += 1
endWhile
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalVent)
objectReference[] linkedRefChain2 = linkedRefChain[0].getLinkedRefChain()

int i = 0
int c = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalVent)
	if linkedRefChain[i].IsDisabled() == false
		(linkedRefChain[i].GetLinkedRef().Disable(true))
		(linkedRefChain[i].GetLinkedRef(DamageTypeRadiation).Disable())

	c = 0
		while c < linkedRefChain[i].countLinkedRefChain()
			(linkedRefChain2[c].GetLinkedRef().Disable())
		c += 1
		endwhile
	c = 0
	if akTerminalRef.GetLinkedRef(DamageTypeRadiation) != none
	objectReference[] linkedRefChain3 = linkedRefChain[i].getLinkedRefChain(DamageTypeRadiation)
		while c < linkedRefChain[i].countLinkedRefChain(DamageTypeRadiation)
			(linkedRefChain3[c].GetLinkedRef(DamageTypeRadiation).Disable())
		c += 1
		endwhile
	endif
	endif
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalSpeaker)
int i = 0
ObjectReference radioRef
ObjectReference hazardRef
while i < akTerminalRef.countLinkedRefChain(LinkTerminalSpeaker)
	radioRef = (linkedRefChain[i].placeatme(terminalHackerRadioTransmitMarker, 1))
	hazardRef = (linkedRefChain[i].placeatme(speakerFakeGunfireHazard, 1))
	i += 1
endWhile
utility.wait(30.0)
radioRef.delete()
hazardRef.delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Keyword Property LinkTerminalVent Auto Const

Hazard Property Exhaust Auto Const

Keyword Property DamageTypeRadiation Auto Const

SPELL Property fireWhat Auto Const

Keyword Property LinkTerminalTripwire Auto Const

Keyword Property LinkCustom01 Auto Const

Keyword Property LinkCustom02 Auto Const

Keyword Property LinkTerminalSpeaker Auto Const

Activator Property terminalHackerRadioTransmitMarker Auto Const

Hazard Property speakerFakeGunfireHazard Auto Const

Keyword Property LinkTerminalSafe Auto Const

ObjectReference Property DummySafe Auto Const

FormList Property terminalHackerSafeContentList Auto Const

Message Property terminalHackedStatusEmpty Auto Const

GlobalVariable Property terminalHackerSafeCountGlobal Auto Const

Static Property LaserMarker Auto Const
