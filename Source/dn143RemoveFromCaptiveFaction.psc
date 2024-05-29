Scriptname dn143RemoveFromCaptiveFaction extends ObjectReference Hidden


faction Property captiveFaction Auto
int Property NumberOfCaptives Auto
keyword Property captiveLink Auto
bool Property HasBeenTriggered Auto




Event OnLoad()
	if !HasBeenTriggered
		HasBeenTriggered = TRUE
    	NumberOfCaptives = CountLinkedRefChain(CaptiveLink) + 1

		MakeCaptives()
    endif
EndEvent


Event OnActivate(ObjectReference akActionRef)
	bool bCaptiveFound = TRUE
	int iCurrentLinkToCheck = 1

	while (bCaptiveFound) && iCurrentLinkToCheck < NumberOfCaptives
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).RemoveFromFaction(captiveFaction)
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).StartCombat(Game.GetPlayer())
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).evaluatePackage()
		debug.Trace(self + "Handling captive:" + iCurrentLinkToCheck + " Ref:" + GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
		iCurrentLinkToCheck = iCurrentLinkToCheck + 1

			; Check to see if there is another actor after this.  if there isn't, then bail out.
		if !(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
			bCaptiveFound = FALSE
		endif
	endwhile
EndEvent

Function MakeCaptives()
	bool bCaptiveFound = TRUE
	int iCurrentLinkToCheck = 1

	while (bCaptiveFound) && iCurrentLinkToCheck < NumberOfCaptives
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).AddToFaction(captiveFaction)
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).StopCombat()
		(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).evaluatePackage()
		debug.Trace(self + "Handling captive:" + iCurrentLinkToCheck + " Ref:" + GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
		iCurrentLinkToCheck = iCurrentLinkToCheck + 1

			; Check to see if there is another actor after this.  if there isn't, then bail out.
		if !(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
			bCaptiveFound = FALSE
		endif
	endwhile
EndFunction