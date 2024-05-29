Scriptname DLC03:DLC03FABLoadIntoRefCollScript extends Actor 
; When this actor is loaded it immediately is added to the specified RefCollection

bool bFired

Event OnLoad()

	if ( !bFired )
		MyRefCollection.AddRef(SELF)
		bFired = TRUE
	endif

EndEvent

RefCollectionAlias Property MyRefCollection Auto Const
