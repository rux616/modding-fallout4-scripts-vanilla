Scriptname AspirationalAddItemScript extends ObjectReference Conditional

int bCallOnce = 0

Event OnLoad()
	if ( bCallOnce == 0 )
		; Change out the mods
		ObjectReference oItem = SELF.PlaceAtMe(pBaseAspirationalItem)
		PossiblyAddMod(oItem, pMod01)
		PossiblyAddMod(oItem, pMod02)
		PossiblyAddMod(oItem, pMod03)
		PossiblyAddMod(oItem, pMod04)
		PossiblyAddMod(oItem, pMod05)
		PossiblyAddMod(oItem, pMod06)
		PossiblyAddMod(oItem, pModLegendary)
		PossiblyAddMod(oItem, pModExtraCost)
		
		if ( pOtherContainer )
			pOtherContainer.AddItem(oItem)
		else
			SELF.AddItem(oItem)
		endif
		
		;Game.GetPlayer().AddItem(oItem)   ; Debug to give to player

		bCallOnce = 1
	endif
EndEvent

Function PossiblyAddMod(ObjectReference oItem, ObjectMod oMod)
	if ( oMod )
		oItem.AttachMod(oMod)	
	endif
EndFunction

LeveledItem Property pBaseAspirationalItem Auto Const
ObjectMod Property pModLegendary Auto Conditional
ObjectMod Property pModExtraCost Auto Conditional
ObjectMod Property pMod01 Auto Conditional
ObjectMod Property pMod02 Auto Conditional
ObjectMod Property pMod03 Auto Conditional
ObjectMod Property pMod04 Auto Conditional
ObjectMod Property pMod05 Auto Conditional
ObjectMod Property pMod06 Auto Conditional
ObjectReference Property pOtherContainer Auto Const