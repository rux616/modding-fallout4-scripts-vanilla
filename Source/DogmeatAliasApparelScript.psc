Scriptname DogmeatAliasApparelScript extends ReferenceAlias Const
{Handles having dogmeat wearing various items}

keyword property ClothingDogmeat auto const

EVENT OnAliasInit()
	AddInventoryEventFilter(ClothingDogmeat)
EndEVENT

EVENT OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    ; prototype.  Remove later?
	if akBaseItem.haskeyword(ClothingDogmeat)
		getActorReference().equipitem(akBaseItem)
		debug.trace("Dogmeat attempting to equip it: "+akBaseItem)
	endif
EndEVENT

EVENT OnActivate(ObjectReference akActionRef)
    if akActionRef == game.getPlayer()
    	; remove items w/clothingDogmeat keyword.  This is a prototype and should probably be removed later
    	getActorReference().removeItem(clothingDogmeat,-1,false,akActionRef)
    endif

EndEVENT