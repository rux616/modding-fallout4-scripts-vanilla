Scriptname DN015_ExtruderActivatorScript extends ObjectReference

Group Keywords
	Keyword Property LinkCustom01 auto Const
	Keyword Property LinkCustom02 auto Const
	Keyword Property LinkCustom03 auto Const
	Keyword Property LinkCustom04 auto Const
endGroup

Message Property DN015_PuzMessagePolymersRequired Auto Const

bool hasCompound = false
bool hasPZT= false


explosion property myExplosion auto Const

Event OnActivate(objectReference akActivator)
	if hasCompound && hasPZT
		getLinkedRef(LinkCustom03).Enable()
		self.disable()
	else
		DN015_PuzMessagePolymersRequired.Show()
	endif
EndEvent


Function addComponent(bool isPZT)
	if isPZT
		hasPZT= True
	else
		hasCompound = True
	endif
endFunction

