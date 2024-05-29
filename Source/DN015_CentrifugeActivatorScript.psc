Scriptname DN015_CentrifugeActivatorScript extends ObjectReference

Group Keywords
	Keyword Property LinkCustom01 auto Const
	Keyword Property LinkCustom02 auto Const
	Keyword Property LinkCustom03 auto Const
	Keyword Property LinkCustom04 auto Const
endGroup

Message Property DN015_PuzMessageChemicalsRequired Auto Const

bool hasLiH = false
bool hasGold = false


explosion property myExplosion auto Const

Event OnActivate(objectReference akActivator)
	if hasLiH && hasGold
		getLinkedRef(LinkCustom03).Enable()
		self.disable()
	else
		DN015_PuzMessageChemicalsRequired.Show()
	endif
EndEvent


Function addGold()
	hasGold = True
endFunction


Function addLiH(bool isCorrectCentrifuge)
	if isCorrectCentrifuge
		hasLiH = True
		getLinkedRef(LinkCustom02).Enable()
	else
		EquipmentExplodes()
	endif
endFunction


Function EquipmentExplodes()
	placeAtMe(myExplosion)
	DisableLinkChain()
	self.Disable()
endFunction