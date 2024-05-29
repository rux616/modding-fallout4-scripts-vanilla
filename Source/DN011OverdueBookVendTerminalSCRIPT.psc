Scriptname DN011OverdueBookVendTerminalSCRIPT extends ObjectReference Hidden Const

ReferenceAlias Property AliasToForceRefTo Auto Mandatory Const

	; Forces the linked vending machine into the correct aliases, then tells it to update it's info with the latest counts.
Event OnActivate(ObjectReference akActionRef)
    if (akActionRef == Game.GetPlayer())
    	AliasToForceRefTo.ForceRefTo(Self)
		(GetLinkedRef() as DN011OverdueBookVendingMachineSCRIPT).UpdateTotalItemCountAndAliases()
    endif
EndEvent