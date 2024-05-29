;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackerDoorHolotapeSubMe_00188AE3 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;terminal Fragment for DoorSlam[Open]
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoor)
;LinkRefChain of all linked doors to the terminal.

int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
	;Iterate through the linked doors and set them open, unlocked. if they aren't opening or closing then create a detection event and then place a fakeforceexplosion(DoorSmack) to simulate a door hit.
	(linkedRefChain[i].setOpen())
	(linkedRefChain[i].Unlock())
	if linkedRefChain[i].GetOpenState() != 2 || linkedRefChain[i].GetOpenState() != 4
	(linkedRefChain[i].CreateDetectionEvent(none, 100))
	endif
	(linkedRefChain[i].placeatme(DoorSmack, 1))
	i += 1
endWhile
;Update relevant Tokens with door status
akTerminalRef.addtextreplacementData("DoorStatus", terminalHackedDoorStatusOpen)
akTerminalRef.addtextreplacementData("LockStatus", terminalHackedDoorStatusUnlocked)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;terminal Fragment for DoorSlam[Close]
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoor)
;Linkedrefchain of all linked doors to the terminal

int i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
	;Iterate through the linked doors, place a fakeforceexplosion(DoorSmack) to simulate a door hit, set the door to closed and then create a detection event.
	(linkedRefChain[i].placeatme(DoorSmack, 1))
	(linkedRefChain[i].setOpen(false))
	(linkedRefChain[i].CreateDetectionEvent(none, 100))
	i += 1
endWhile

;Update relevant Tokens with current door status
akTerminalRef.addtextreplacementData("DoorStatus", terminalHackedDoorStatusClosed)
akTerminalRef.addtextreplacementData("LockStatus", terminalHackedDoorStatusUnlocked)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
;terminal Fragment for Scrambling the door lock.
objectReference[] linkedRefChain = akTerminalRef.getLinkedRefChain(LinkTerminalDoor)
;linkedrefchain of all linked doors to the terminal

int i = 0
int L = 0

while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
;Iterate through linked doors and block their activation, close them, store previous Lock level in the L property, set the lock level and create a detection event at the door.
	(linkedRefChain[i].BlockActivation())
	(linkedRefChain[i].setOpen(false))
	L = (linkedRefChain[i].GetLockLevel())
	(linkedRefChain[i].SetLockLevel(101))
	(linkedRefChain[i].CreateDetectionEvent(Game.GetPlayer(), 10))
	i += 1
endWhile
;Update relevant Tokens to reflect the "scrambled" state of the door.
akTerminalRef.addtextreplacementData("DoorStatus", terminalHackedStatusError)
akTerminalRef.addtextreplacementData("LockStatus", terminalHackedDoorStatusLocked)
utility.wait(15.0)
;wait 15 seconds before reverting the door to it's usable, "unscambled" state with the original lock level.
i = 0
while i < akTerminalRef.countLinkedRefChain(LinkTerminalDoor)
	(linkedRefChain[i].BlockActivation(false))
	(linkedRefChain[i].SetLockLevel(L))
	(linkedRefChain[i].CreateDetectionEvent(Game.GetPlayer(), 10))
	i += 1
endWhile

;Update relevant Tokens for current locked status.
if linkedRefChain[i].IsLocked() == 1
akTerminalRef.addtextreplacementData("LockStatus", terminalHackedDoorStatusLocked)
else
akTerminalRef.addtextreplacementData("LockStatus", terminalHackedDoorStatusUnlocked)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalDoor Auto Const

Explosion Property DoorSmack Auto Const

Keyword Property LinkTerminalVent Auto Const

Hazard Property Exhaust Auto Const

Keyword Property DamageTypeRadiation Auto Const


Message Property terminalHackedDoorStatusOpen Auto Const

Message Property terminalHackedDoorStatusClosed Auto Const

Message Property terminalHackedDoorStatusLocked Auto Const

Message Property terminalHackedDoorStatusUnlocked Auto Const

Message Property terminalHackedStatusError Auto Const
