Scriptname Inst301X6StartLocationHandlerScript extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto
{Main X6 Enabler}
Keyword Property LinkCustom02 const auto
{This handlers enable marker}
Keyword Property LinkCustom03 const auto
{Marker to move the package xmarkerheading to}
Keyword Property LinkCustom04 const auto
{Package Marker}
Keyword Property LinkCustom05 const auto
{X6 himself}
Keyword Property LinkCustom06 const auto
{The other handler}

ObjectReference MainEnabler
ObjectReference LocalEnabler
ObjectReference FlagMarker
ObjectReference PackageXMarkerHeading
ObjectReference X6
ObjectReference OtherHandler


Event OnInit()
    MainEnabler = GetLinkedRef(LinkCustom01)
    LocalEnabler = GetLinkedRef(LinkCustom02)
    FlagMarker = GetLinkedRef(LinkCustom03)
    PackageXMarkerHeading = GetLinkedRef(LinkCustom04)
    X6 = GetLinkedRef(LinkCustom05)
    OtherHandler = GetLinkedRef(LinkCustom06)
EndEvent


auto STATE WaitingForLoad

	Event OnLoad()
				; If the MainEnabler is loaded, then enable this local enabler, and move everything to the correct spot
	    if !MainEnabler.IsDisabled()
	    	GoToState("Done")
	    	(OtherHandler as Inst301X6StartLocationHandlerScript).GoToState("Done")
	    	LocalEnabler.EnableNoWait()
	    	PackageXMarkerHeading.MoveTo(FlagMarker)
	    	X6.MoveTo(PackageXMarkerHeading)
	    endif
	EndEvent

ENDSTATE


STATE Done
	; Either done loading, or told to not load
ENDSTATE