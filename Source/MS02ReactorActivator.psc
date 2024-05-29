Scriptname MS02ReactorActivator extends ReferenceAlias

Group QuestProperties
	{This is used for the places you remove items: Saugus, the warhead}
	Quest Property MS02 auto Const
	;MiscObject Property ItemInstalled auto
	ReferenceAlias Property Warhead Auto Const
	ReferenceAlias Property DampeningRod Auto Const

	{Setting the object destroyed makes it non activatable}
	Message Property MS02ReactorItemRequiredMessage Auto Const
	Message Property MS02ReactorItemPlacementMessage Auto Const

	int property WarheadStage = 900 Auto Const
	int property DampeningRodStage = 850 Auto Const
EndGroup

Group AnimProperties
	String Property AnimEndEvent = "end" Auto Const
EndGroup

int warheadInt = 1
int DampeningRodInt = 0

Event OnActivate(ObjectReference akActionRef)
	Actor Player = Game.GetPlayer()
	ObjectReference objSelf = self.GetReference()
	objSelf.BlockActivation(true, true)
	if akActionRef == Player
		if player.GetItemCount(Warhead.GetReference().GetBaseObject()) >= 1 || player.GetItemCount(DampeningRod.GetReference().GetBaseObject()) >= 1
			
			int response = MS02ReactorItemPlacementMessage.Show()

			if response == warheadInt 		;If this is the warhead, use these anims
				objSelf.PlayAnimationAndWait("InsertRod01", AnimEndEvent)
				game.getplayer().RemoveItem(Warhead.GetReference().GetBaseObject(), 9)
				MS02.SetStage(WarheadStage)
				objSelf.SetDestroyed()
			elseif response == DampeningRodInt  			;Otherwise this is the dampening coil, so use these ones
				game.getplayer().RemoveItem(DampeningRod.GetReference().GetBaseObject(), 9)
				objSelf.PlayAnimationAndWait("OpenEmpty", AnimEndEvent)
				objSelf.PlayAnimationAndWait("Insert", AnimEndEvent)
				objSelf.PlayAnimationAndWait("CloseFull", AnimEndEvent)
				MS02.SetStage(DampeningRodStage)
			else
				;Player has chosen NOT to install anything
				
			endif
		else
			;Player does not have the proper parts
			MS02ReactorItemRequiredMessage.Show()
		endif
	Endif
	utility.wait(1.0)
	objSelf.BlockActivation(false, false)
endEvent

