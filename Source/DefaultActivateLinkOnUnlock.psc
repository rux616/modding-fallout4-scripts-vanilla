Scriptname DefaultActivateLinkOnUnlock extends ObjectReference Default
{When this reference is Unlocked the specific Link Ref will be activated.}

Keyword Property MyLink Auto Const
{Keyword of the specific linked reference.}

Event OnLockStateChanged()
    if !IsLocked()
    	GetLinkedRef(MyLink).Activate(self)
    endif
EndEvent