Scriptname lockExtraLootSCRIPT extends ObjectReference

LeveledItem PROPERTY pLLI_Loot_Lock_Advanced AUTO
LeveledItem PROPERTY pLLI_Loot_Lock_Expert AUTO
LeveledItem PROPERTY pLLI_Loot_Lock_Master AUTO

AUTO STATE startState

	EVENT OnLoad()
	    
	    ; are we an Advanced lock?
	    IF(SELF.getLockLevel() == 50)
	    	SELF.additem(pLLI_Loot_Lock_Advanced)
		; are we an expert lock?
	    ELSEIF(SELF.getLockLevel() == 75)
			SELF.additem(pLLI_Loot_Lock_Expert)
		; are we a master lock?
	    ELSEIF(SELF.getLockLevel() == 100)
			SELF.additem(pLLI_Loot_Lock_Master)
	    ENDIF

	    goToState("doNothing")

	ENDEVENT

ENDSTATE

; when we're done, do nothing but sit here
STATE doNothing

	EVENT OnLoad()
	ENDEVENT

ENDSTATE