Scriptname DLC03:DLC03FarHarborFF02_RepairCondenser02 extends ObjectReference

;Properties
MiscObject Property DLC03FogCondenserModule Auto
Quest Property DLC03FarHarborFF02 Auto
Message Property DLC03FarHarborFF02_ComponentMessage Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if game.getplayer().GetItemCount(DLC03FogCondenserModule) == 0
			;show the message that tells the player they don't have the proper components
			DLC03FarHarborFF02_ComponentMessage.show()
		elseif game.getplayer().GetItemCount(DLC03FogCondenserModule) != 0
			;set the stage that repairs fog condenser 1
			DLC03FarHarborFF02.SetStage(220)
		endif
	endif
endevent