Scriptname CompanionVertibirdQuestScript extends Quest Const
{In fragment, set kmyquest to CompanionVertibirdQuestScript
Then call one of these:
kmyquest.CompanionsShouldBoardVirtibird()
kmyquest.CompanionsShouldSnapIntoVirtibird()
kmyquest.CompanionsShouldExitVirtibird()
}


GlobalVariable Property OptionalQuestGlobal const auto
{AUTOFILL DEBUGGING}

GlobalVariable Property CompanionVertibirdEntryType Auto Const mandatory
{Autofill}

GlobalVariable Property CompanionVertibirdEntryType_Board Auto Const mandatory
{Autofill}

GlobalVariable Property CompanionVertibirdEntryType_SnapIntoPosition Auto Const mandatory
{Autofill}

GlobalVariable Property CompanionVertibirdEntryType_Exit Auto Const mandatory
{Autofill}

ReferenceAlias  Property CompanionAlias const auto
ReferenceAlias  Property DogmeatAlias const auto

Faction Property CurrentCompanionFaction Auto Const
Faction Property CrimeFaction Auto Const
Faction Property CompanionCrimeFaction_Cait Auto Const
Faction Property CompanionCrimeFaction_Codsworth Auto Const
Faction Property CompanionCrimeFaction_Curie Auto Const
Faction Property CompanionCrimeFaction_Danse Auto Const
Faction Property CompanionCrimeFaction_Deacon Auto Const
Faction Property CompanionCrimeFaction_Hancock Auto Const
Faction Property CompanionCrimeFaction_MacCready Auto Const
Faction Property CompanionCrimeFaction_Piper Auto Const
Faction Property CompanionCrimeFaction_Preston Auto Const
Faction Property CompanionCrimeFaction_Strong Auto Const
Faction Property CompanionCrimeFaction_Valentine Auto Const
Faction Property CompanionCrimeFaction_X688 Auto Const


Function CompanionsShouldBoardVertibird()
	;Debug.TraceStack()
	CompanionVertibirdEntryType.SetValue(CompanionVertibirdEntryType_Board.GetValue())
	CompanionAlias.GetActorReference().EvaluatePackage(abResetAI=true)
EndFunction

Function CompanionsShouldSnapIntoVertibird()
	;Debug.TraceStack()
	CompanionVertibirdEntryType.SetValue(CompanionVertibirdEntryType_SnapIntoPosition.GetValue())
	CompanionAlias.GetActorReference().EvaluatePackage(abResetAI=true)
EndFunction

Function CompanionsShouldExitVertibird()
	;Debug.TraceStack()
	CompanionVertibirdEntryType.SetValue(CompanionVertibirdEntryType_Exit.GetValue())
	CompanionAlias.GetActorReference().EvaluatePackage(abResetAI=true)
EndFunction

Function GhostOn()

	Actor CompanionActor = CompanionAlias.GetActorReference()
	Actor DogmeatActor = DogmeatAlias.GetActorReference()
	

	if CompanionActor && CompanionActor.IsInFaction(CurrentCompanionFaction) == 1
		CompanionAlias.GetActorReference().SetGhost()
		debug.trace("Companion has been ghosted")
	endif

	if DogmeatActor && DogmeatActor.IsInFaction(CurrentCompanionFaction) == 1
		DogmeatAlias.GetActorReference().SetGhost()
		debug.trace("Dogmeat has been ghosted")
	endif

EndFunction

Function GhostOff()

	Actor CompanionActor = CompanionAlias.GetActorReference()
	Actor DogmeatActor = DogmeatAlias.GetActorReference()
	
	if CompanionActor && CompanionActor.IsInFaction(CurrentCompanionFaction) == 1
		CompanionAlias.GetActorReference().SetGhost(false)
		debug.trace("Companion ghost has been removed")
	endif

	if DogmeatActor && DogmeatActor.IsInFaction(CurrentCompanionFaction) == 1
		DogmeatAlias.GetActorReference().SetGhost(false)
		debug.trace("Dogmeat ghost has been removed")
	endif

EndFunction

Function EndSceneGhostCheck()

	Actor CompanionActor = CompanionAlias.GetActorReference()
	Actor DogmeatActor = DogmeatAlias.GetActorReference()

	if Game.GetPlayer().IsGhost() == 1
		Game.GetPlayer().SetGhost(false)
		debug.trace("Player ghost has been removed")
	endif

	if CompanionActor && CompanionAlias.GetActorReference().IsGhost() == 1
		if CompanionAlias.GetActorReference().IsInFaction(CurrentCompanionFaction) == 1
			CompanionAlias.GetActorReference().SetGhost(false)
			debug.trace("Companion ghost has been removed")
		endif
	endif

	if DogmeatActor && DogmeatAlias.GetActorReference().IsGhost() == 1
		if DogmeatAlias.GetActorReference().IsInFaction(CurrentCompanionFaction) == 1
			DogmeatAlias.GetActorReference().SetGhost(false)
			debug.trace("Dogmeat ghost has been removed")
		endif
	endif

EndFunction

Function VBCrimeWipe()

	CrimeFaction.SetPlayerEnemy(false)
	CompanionCrimeFaction_Cait.SetPlayerEnemy(false)
	CompanionCrimeFaction_Codsworth.SetPlayerEnemy(false)
	CompanionCrimeFaction_Curie.SetPlayerEnemy(false)
	CompanionCrimeFaction_Danse.SetPlayerEnemy(false)
	CompanionCrimeFaction_Deacon.SetPlayerEnemy(false)
	CompanionCrimeFaction_Hancock.SetPlayerEnemy(false)
	CompanionCrimeFaction_MacCready.SetPlayerEnemy(false)
	CompanionCrimeFaction_Piper.SetPlayerEnemy(false)
	CompanionCrimeFaction_Preston.SetPlayerEnemy(false)
	CompanionCrimeFaction_Strong.SetPlayerEnemy(false)
	CompanionCrimeFaction_Valentine.SetPlayerEnemy(false)
	CompanionCrimeFaction_X688.SetPlayerEnemy(false)
	Game.GetPlayer().StopCombatAlarm()

EndFunction