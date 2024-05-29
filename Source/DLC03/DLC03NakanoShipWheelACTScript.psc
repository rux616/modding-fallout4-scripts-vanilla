Scriptname DLC03:DLC03NakanoShipWheelACTScript extends ObjectReference Const

Quest Property DLC03MQ01 Auto Const Mandatory
Quest Property pDLC03FarHarborS03 Auto Const Mandatory
Message Property DLC03MQ01TravelFarHarborMSG Auto Const Mandatory
ObjectReference Property DLC03MQ01PlayerFarHarborStartMarker Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		If (GetLinkedRef() as DLC03BoatAnimScript).GetState() != "Moving"
			;if the player has progressed enough to get to Far Harbor, pop the message box
			If (DLC03MQ01.GetStageDone(400) == 1) || (DLC03MQ01.GetStageDone(500) == 1)
				Int ButtonPressed = DLC03MQ01TravelFarHarborMSG.Show()
				;if the player says yes in the message box, then start the travel to Far Harbor
				If ButtonPressed == 1
					;update the QT
					DLC03MQ01.SetStage(450)
					(GetLinkedRef() as DLC03BoatAnimScript).GoToOtherBoat = FALSE
					;start boatride
					GetLinkedRef().Activate(Game.GetPlayer())

					; If you leave Red Death Island, the Mariner will kill the Red Death for you
					if ( pDLC03FarHarborS03.GetStageDone(400) )
						pDLC03FarHarborS03.SetStage(375)
					endif
					
				elseif ButtonPressed == 2
					; Advance "The Great Hunt" quest
					pDLC03FarHarborS03.SetStage(200)
					
					(GetLinkedRef() as DLC03BoatAnimScript).GoToOtherBoat = TRUE
					;start boatride
					GetLinkedRef().Activate(Game.GetPlayer())
				EndIf
			EndIf
		EndIf
	endif
EndEvent
