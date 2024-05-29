Scriptname DN066_LabDoorScript extends Default2StateActivator
{Script for the DN066 Lab Doors. Intercepts a SetOpenNoWait function call coming from a native terminal, opens shutters, triggers klaxons, and then allows the door to open.}

ObjectReference property DN066_LockKlaxon auto const
ObjectReference property DN066WinShutter01 auto const
ObjectReference property DN066WinShutter02 auto const
ObjectReference property DN066WinShutter03 auto const
ObjectReference property DN066WinShutter04 auto const
ObjectReference property DN066WinShutter05 auto const
ObjectReference property DN066WinShutter06 auto const

Function SetOpenNoWait(bool abOpen = true)
	;Trigger the Klaxon
	DN066_LockKlaxon.Activate(DN066_LockKlaxon)

	;Open the shutters
	DN066WinShutter01.PlayAnimation("Play01")
	DN066WinShutter02.PlayAnimation("Play01")
	DN066WinShutter03.PlayAnimation("Play01")
	DN066WinShutter04.PlayAnimation("Play01")
	DN066WinShutter05.PlayAnimation("Play01")
	DN066WinShutter06.PlayAnimation("Play01")

	;Allow Default2StateActivator to handle door as usual.
	Parent.SetOpenNoWait(abOpen)
EndFunction