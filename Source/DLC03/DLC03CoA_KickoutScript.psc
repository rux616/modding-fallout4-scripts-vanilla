Scriptname DLC03:DLC03CoA_KickoutScript extends Quest

REfCollectionAlias Property NamedNPCs Auto Const Mandatory
{Reference collection for the named NPCs in the Nucleus}

Function RemoveProtectedFromNucleusNamedNPCs()
	int i = 0
	int iCount = NamedNPCs.GetCount()

	;Loop through all the Named NPCs in the Nucleus and make them no longer protected
	while (i < iCount)
		Actor act = (NamedNPCs.GetAt(i) as actor)
		ActorBase AB = act.GetActorBase()

		if AB.IsProtected()
			AB.SetProtected(false)
		endif

		i += 1
	endwhile

EndFunction