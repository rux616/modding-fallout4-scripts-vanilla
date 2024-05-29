Scriptname CommonTeam

Function ChangeAggression(ObjectReference oTeam, int bAggression = 2) global

	int nLength = oTeam.countLinkedRefChain()	

	Actor aTeamMember = oTeam.GetNthLinkedRef(nLength).GetSelfAsActor() as actor

	;Iterate over the team and change their aggression
	while aTeamMember
		;aTeamMember.SetActorValue("Aggression", bAggression)
		aTeamMember.EvaluatePackage()

		nLength -= 1
		aTeamMember = oTeam.GetNthLinkedRef(nLength) as actor
	endwhile

EndFunction

; bAdd - Whether or not this function adds or removes the team from the faction - default it Adds
Function ChangeFaction(ObjectReference oTeam, faction facNew, bool bAdd = TRUE) global

	int nLength = oTeam.countLinkedRefChain()	

	Actor aTeamMember = oTeam.GetNthLinkedRef(nLength).GetSelfAsActor() as actor

	;Iterate over the team and change their faction
	while aTeamMember
		if bAdd
			aTeamMember.AddToFaction(facNew)
		else
			aTeamMember.RemoveFromFaction(facNew)
		endif
		aTeamMember.EvaluatePackage()

		nLength -= 1
		aTeamMember = oTeam.GetNthLinkedRef(nLength) as actor
	endwhile

EndFunction


bool Function IsDead(ObjectReference oTeam) global

	int nLength = oTeam.countLinkedRefChain()
	int nSomeoneAlive

	Actor aTeamMember = oTeam.GetNthLinkedRef(nLength).GetSelfAsActor() as actor

	;Iterate over the team and check if they are alive or dead
	while aTeamMember
		;debug.trace(aTeamMember + " is " + aTeamMember.IsDead() )
		if !aTeamMember.IsDead()
			nSomeoneAlive = 1
		endif
		
		nLength -= 1
		aTeamMember = oTeam.GetNthLinkedRef(nLength) as actor
	endwhile

	return !nSomeoneAlive

EndFunction

Function Merge(ObjectReference oChild, ObjectReference oParent) global

	;int nLength = oChild.countLinkedRefChain()	
	;Actor aTeamMember = oChild.GetNthLinkedRef(nLength).GetSelfAsActor() as actor

	;int nLength2 = oParent.countLinkedRefChain()	
	;Actor aLastLink = oParent.GetNthLinkedRef(nLength2).GetSelfAsActor() as actor

	;Iterate over the children linking them to the aLastLink
	;while aTeamMember
	;	aTeamMember.SetLinkedRef(aLastLink)		

	;	nLength -= 1
	;	aTeamMember = oChild.GetNthLinkedRef(nLength) as actor
	;endwhile

EndFunction