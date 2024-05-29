Scriptname DLC03:DLC03FarHarborM01DropPlayerScript extends ReferenceAlias Conditional

int nFoodsDropped

Event OnAliasInit()
	AddInventoryEventFilter(pDLC03FarHarborM01MeatList)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	; MeatList is a list of all the fleshy meats - you need to chum the waters
	; So - have you dropped some meat? Is the quest in the right stage?
	If ( pDLC03FarHarborM01MeatList.HasForm(akBaseItem) && pDLC03FarHarborM01.GetStageDone(100) )
		if ( Game.GetPlayer().GetCurrentLocation() == pDLC03EmmetsCausewayLocation && !pDLC03FarHarborM01.GetStageDone(325) )   ; And are you in the chumming location?

			; Do the food counter IF (a) You haven't chummed the waters the first time OR (b) you're about to chum more
			if ( !pDLC03FarHarborM01.GetStageDone(200) || pDLC03FarHarborM01.GetStageDone(300) && akItemReference )
				nFoodsDropped += 1
				Debug.Trace("Current food in water: " + nFoodsDropped)
				akItemReference.BlockActivation(TRUE, TRUE)
			endif

			if ( nFoodsDropped >= 1 && !pDLC03FarHarborM01.GetStageDone(200) && akItemReference )		; Once three meat is dropped
				nFoodsDropped = 0
				Debug.Trace("Stage 200 Set. Current food in water: " + nFoodsDropped)
				pDLC03FarHarborM01.SetStage(200)
			EndIf

			if ( nFoodsDropped >= 1 && pDLC03FarHarborM01.GetStageDone(300) && akItemReference )
				Debug.Trace("Stage 300 Set. Current food in water: " + nFoodsDropped)
				pDLC03FarHarborM01.SetStage(325)
			endif
		endif
	EndIf
	
EndEvent

FormList Property pDLC03FarHarborM01MeatList Auto Const Mandatory
Quest Property pDLC03FarHarborM01 Auto Const Mandatory
Location Property pDLC03EmmetsCausewayLocation Auto Const Mandatory
 