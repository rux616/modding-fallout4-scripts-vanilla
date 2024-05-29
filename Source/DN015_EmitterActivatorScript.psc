Scriptname DN015_EmitterActivatorScript extends ObjectReference

Group Keywords
	Keyword Property LinkCustom01 auto Const
	Keyword Property LinkCustom02 auto Const
	Keyword Property LinkCustom03 auto Const
	Keyword Property LinkCustom04 auto Const
endGroup

Message Property DN015_PuzMessageIsotopeRequired Auto Const
Message Property DN015_PuzMessageNanoweaveRequired Auto Const

bool hasNanoweave = false
bool hasIsotope= false


explosion property myExplosion auto Const

Event OnActivate(objectReference akActivator)
	if hasNanoweave && hasIsotope
		getLinkedRef(LinkCustom03).Enable()
		self.disable()
	else
		if !hasNanoweave
			DN015_PuzMessageNanoweaveRequired.Show()
		endif
		if !hasIsotope
			DN015_PuzMessageIsotopeRequired.Show()
		endif
	endif
EndEvent


Function addComponent(bool isIsotope)
	if isIsotope
		hasIsotope= True
	else
		hasNanoweave = True
	endif
endFunction
