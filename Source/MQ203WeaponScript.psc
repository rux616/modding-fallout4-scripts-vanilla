Scriptname MQ203WeaponScript extends ObjectReference Const
{block activation on dropped weapons}

Event OnLoad()
    BlockActivation(abBlocked = true, abhideActivateText = true )
EndEvent
