Scriptname DNFinancial_HaymarketConsciousScript extends ObjectReference Hidden
{Script for Haymarket Mall Default Dummy.}

Keyword property LinkCustom02 Auto Const Mandatory

Event OnActivate(ObjectReference akActivator)
	(Self.GetLinkedRef(LinkCustom02) as Actor).SetUnconscious(False)
EndEvent