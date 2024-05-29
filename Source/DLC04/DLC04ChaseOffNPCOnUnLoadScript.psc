Scriptname DLC04:DLC04ChaseOffNPCOnUnLoadScript extends RefCollectionAlias Const

Faction Property BrotherhoodofSteelFaction Auto Const Mandatory
{Brotherhood of Steel faction (used to know if we need to make it the player killing these folks)}

Faction Property RailroadFaction Auto Const Mandatory
{Railroad faction (used to know if we need to make it the player killing these folks)}

Event OnUnload(ObjectReference akSenderRef)
	Actor act = (akSenderRef as Actor)

	;96381 - Probably need to add some more handling here to ensure that NPCs getting
	;passed in here aren't mistakenly essential

	;If the unloading actor isn't essential (they shouldn't be in here anyway...)
	if !act.IsEssential() 

		;Kill them now and then disable them
		if !act.IsDead()
			;If the NPC is in either of the NPC factions, make the player the killer (ensuring event goes through)
			if act.IsInFaction(BrotherhoodofSteelFaction) || act.IsInFaction(RailroadFaction)
				act.KillEssential(Game.GetPlayer())
			else
				act.KillEssential()
			endif
		endif

		if !act.IsDisabled()
			act.Disable()
		endif
	endif

	;Finally, remove ref from collection
	RemoveRef(akSenderRef)
EndEvent