Scriptname WorkshopPowerConnectorScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.Getplayer() 
    	; try automatically going into workshop mode
    	if GetLinkedRef(WorkshopItemKeyword)
    		GetLinkedRef(WorkshopItemKeyword).StartWorkshop()
    	endif
    endif
endEvent
Keyword Property WorkshopItemKeyword Auto Const
