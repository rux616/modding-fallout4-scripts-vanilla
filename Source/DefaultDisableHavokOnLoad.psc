scriptName DefaultDisableHavokOnLoad extends ObjectReference Default
{Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab()}
Group Optional_Properties
	bool property HavokOnHit Auto Const
	{Start Havok Sim when hit? DEFAULT: FALSE}
	bool property HavokOnActivate Auto Const
	{Start Havok Sim when activated? DEFAULT: FALSE}
	bool property HavokOnZKey Auto Const
	{Start Havok Sim when grabbed by player? DEFAULT: FALSE}
	keyword property LinkHavokPartner Auto Const
	{Link with this keyword and that ref will also sim with myself}
	bool property BeenSimmed auto hidden
	{Prevent an object that has been havok'd in-game from going static}
EndGroup

bool bHasChangedContainers

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    bHasChangedContainers = TRUE
    BeenSimmed = TRUE
EndEvent

EVENT onLoad()
	if (BeenSimmed == FALSE && Self.Is3DLoaded())
		setMotionType(Motion_Keyframed, TRUE)
		if !bHasChangedContainers
			self.MoveToMyEditorLocation()
		endif
		if HavokOnHit
			RegisterForHitEvent(self)
		endif
	endif
endEVENT

EVENT onUnload()
	UnregisterForAllHitEvents()
endEVENT

EVENT onActivate(ObjectReference triggerRef)
	if HavokonActivate == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

EVENT onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7, string asMaterialName)
	if HavokOnHit == TRUE && BeenSimmed == FALSE 
		ReleaseToHavok()
	endif
endEVENT

EVENT onGrab()
	if HavokOnZkey == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

FUNCTION ReleaseToHavok()
		BeenSimmed = TRUE
		objectReference myLink = getLinkedRef(LinkHavokPartner)
		if myLink != NONE
			defaultDisableHavokOnLoad linkScript = myLink as defaultDisableHavokOnLoad
			if (linkScript)  && (linkScript.BeenSimmed == FALSE)
				linkScript.ReleaseToHavok()
			endif
		endif
		setMotionType(Motion_Dynamic, TRUE)
		Self.ApplyHavokImpulse(0, 0, 1, 5)
endFUNCTION
