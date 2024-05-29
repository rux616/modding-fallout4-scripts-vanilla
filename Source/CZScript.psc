Scriptname CZScript extends Quest

Group Autofill
	ArenaScript Property Arena const auto
	ReferenceAlias Property Tommy const auto
	ReferenceAlias Property ArenaAnnounceMarker const auto
	ReferenceAlias Property StageController const auto
	ReferenceAlias Property CageDoor const auto
	ReferenceAlias Property ArenaSpawnMarker const auto
	ReferenceAlias Property ArenaCorner1Marker const auto
	ReferenceAlias Property ArenaCorner2Marker const auto
	ReferenceAlias Property ArenaPlayerEntranceTrigger const auto

	ReferenceAlias Property AnnouncerHeadtrackMarker1 const auto
	ReferenceAlias Property AnnouncerHeadtrackMarker2 const auto
	ReferenceAlias Property AnnouncerHeadtrackMarker3 const auto

	Idle Property IdleFightWinner const auto
	RefCollectionAlias Property Attackers const auto
	ActorValue Property Aggression const auto
	bool Property bPlayerInCage auto Conditional

endGroup

Function SetupMatch(Actor Combatant1Ref = none, Actor Combatant2Ref = none, int Rank = 0)

	Arena.SetupMatch( \
		Tommy.GetActorReference(), \
		ArenaAnnounceMarker.GetReference(), \
		StageController.GetReference(), \
		CageDoor.GetReference(),\ 
		ArenaCorner1Marker.GetReference(), \
		ArenaCorner2Marker.GetReference(), \
		ArenaPlayerEntranceTrigger.GetReference(), \
		ArenaSpawnMarker.GetReference(), \
		Combatant1Ref = Combatant1Ref, \
		Combatant2Ref = Combatant2Ref, \
		Rank = Rank, \
		AnnouncerHeadtrackMarker1Ref = AnnouncerHeadtrackMarker1.GetReference(), \
		AnnouncerHeadtrackMarker2Ref = AnnouncerHeadtrackMarker2.GetReference(), \
		AnnouncerHeadtrackMarker3Ref = AnnouncerHeadtrackMarker3.GetReference() \
		)

EndFunction

Function SpotlightPlayer(bool turnOnLight)
	(StageController.GetReference() as CZStageControllerScript).SpotlightOther(Game.GetPlayer(), turnOnLight)
EndFunction

Function TurnOffCaitIntroSpotlight()
		(StageController.GetReference() as CZStageControllerScript).EndCaitIntro()
EndFunction

Function PlayTriumphantIdle(ReferenceAlias AliasToTryToPlay)

	int tries
	bool success
	
	while tries < 5 && success == false
		success = AliasToTryToPlay.GetActorReference().PlayIdle(IdleFightWinner)
		tries += 1

		if success == false
			utility.wait(0.2)
		endif
	endwhile

	
EndFunction

Function SetRaiderAggression(int iAggressionNum)


	Actor PlayerRef = Game.GetPlayer()
	int iCount = 0
	int iRandCombat = 0
	float fRandTimer = 0
	objectreference CurrentRaider

	;Increase the agression of all Raiders in the space
	while iCount < Attackers.GetCount()
		CurrentRaider = Attackers.GetAt(iCount)
		(CurrentRaider as actor).SetValue(Aggression, iAggressionNum)

		;Have select Raiders start combat with the player (to avoid everyone attacking in unison)
		;iRandCombat = Utility.RandomInt(1, 10)
		;if iRandCombat < 5
			fRandTimer = Utility.RandomFloat(0.1, 0.25)
			;Utility.Wait(fRandTimer)
			(CurrentRaider as actor).StartCombat(PlayerRef)
		;endif
		iCount += 1
	endwhile
EndFunction

Function SetCageLockState(bool Lock = false)
	if Lock == true
		CageDoor.GetRef().Lock()
	elseif Lock == false
		CageDoor.GetRef().Unlock()
	endif
EndFunction