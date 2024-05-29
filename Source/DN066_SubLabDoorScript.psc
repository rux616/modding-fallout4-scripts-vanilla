Scriptname DN066_SubLabDoorScript extends Default2StateActivator
{Script for the DN066 Lab Doors. Intercepts a SetOpenNoWait function call coming from a native terminal, opens shutters, triggers klaxons, and then allows the door to open.}

ObjectReference property DN066_SubLockKlaxon auto const
ObjectReference property DN066LabShutter01 auto const
ObjectReference property DN066LabShutter02 auto const
ObjectReference property DN066LabShutter03 auto const
ObjectReference property DN066LabShutter04 auto const
ObjectReference property DN066LabShutter05 auto const
ObjectReference property DN066LabShutter06 auto const
ObjectReference property DN066LabShutter07 auto const
ObjectReference property DN066LabShutter08 auto const
ObjectReference property DN066LabShutter09 auto const

Function SetOpenNoWait(bool abOpen = true)
	;Trigger the Klaxon
	DN066_SubLockKlaxon.Activate(DN066_SubLockKlaxon)

	;Open the shutters
	DN066LabShutter01.PlayAnimation("Play03")
	DN066LabShutter02.PlayAnimation("Play03")
	DN066LabShutter03.PlayAnimation("Play03")
	DN066LabShutter04.PlayAnimation("Play03")
	DN066LabShutter05.PlayAnimation("Play03")
	DN066LabShutter06.PlayAnimation("Play03")
	DN066LabShutter07.PlayAnimation("Play03")
	DN066LabShutter08.PlayAnimation("Play03")
	DN066LabShutter09.PlayAnimation("Play03")

	;Allow Default2StateActivator to handle door as usual.
	Parent.SetOpenNoWait(abOpen)
EndFunction