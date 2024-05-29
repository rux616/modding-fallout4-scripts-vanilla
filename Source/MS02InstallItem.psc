Scriptname MS02InstallItem extends ReferenceAlias

Group QuestProperties
	Bool Property ScavengeLocation = false Auto
	{This is used for the places you remove items: Saugus, the warhead}
	Quest Property MS02 auto
	;MiscObject Property ItemInstalled auto
	ReferenceAlias Property ItemInstalled Auto
	int Property Stage auto
	bool Property SetSelfDestroyedAfterActivation = True Auto
	{Setting the object destroyed makes it non activatable}
	Message Property ItemRequiredMessage Auto
EndGroup

Group AnimProperties
	Bool Property warhead = false auto const
	String Property AnimEndEvent Auto Const
EndGroup

Event OnActivate(ObjectReference akActionRef)
	ObjectReference objSelf = self.GetReference()
	;if this is the player, and the stage this sets is not already done
	if akActionRef == Game.GetPlayer() && !MS02.GetStageDone(Stage)
		;Play the animation
		objSelf.PlayAnimationAndWait("OpenFull", AnimEndEvent)
		objSelf.PlayAnimationAndWait("Remove", AnimEndEvent)
		objSelf.PlayAnimationAndWait("CloseEmpty", AnimEndEvent)

		;Remove the item(s) from the players inventory
		game.getplayer().AddItem(ItemInstalled.GetReference())
		;Set the stage
		MS02.SetStage(Stage)
		;Set Self destroyed so nothing can be done
		if SetSelfDestroyedAfterActivation
			objSelf.SetDestroyed()
		Endif
	endif

endEvent

