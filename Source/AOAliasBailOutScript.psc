Scriptname AOAliasBailOutScript extends ReferenceAlias const
{used to bail out of AO scene based on common set of rules}

Group BailOutRules

Scene Property BailOut_Stop_Scene const auto
{Default: None; which scene to stop if we Bail Out?}

scene[] Property BailOut_Additional_Scenes_To_Stop const auto
{Default: None; other scenes to bail out of if running - used if quest contains multiple scenes}

bool Property Bail_If_CommandMode = true const auto
{deafult: true; Should we bail if actor gets put into command mode?}

float Property Bail_If_Escort_Wait_Duration = -1.0 const auto
{default: -1.0; Bail out after this many seconds of the actor waiting in an escort.

< -1 = don't bail out no matter how long actor is waiting in an escort}

float Property Bail_If_Distance_From_Player = 6000.0 const auto
{default: 6000; Bail out if actor gets this far from the player.

< -1 = don't bail out no matter how far away the player gets}

bool Property Bail_If_AutonomyDisallowed = true const auto
{Default: true; bail if the actor in the alias (at alias init time) receives an "AutonomyDisallowed" event while running this quest}

EndGroup


int id_EscortWaitTimer = 1 const		;id of timer
int id_DistancePollTimer = 2 const
int dur_DistancePollTimerFrequency = 2 const


Event OnAliasInit()
	RegisterForCustomEvent(FollowersScript.GetScript(), "AutonomyDisallowed")
EndEvent

Event FollowersScript.AutonomyDisallowed(FollowersScript akSender, Var[] akArgs)
	debug.trace(self + "AutonomyDisallowed(), Bailing Out.")
	BailOut()

EndEvent

Event OnCommandModeEnter()
	debug.trace(self + "OnCommandModeEnter(), Bailing Out.")
	BailOut()

EndEvent

Event OnCommandModeGiveCommand(int aeCommandType, ObjectReference akTarget)
	debug.trace(self + "OnCommandModeGiveCommand(), Bailing Out.")
	BailOut()

EndEvent

Event OnEscortWaitStart()
	debug.trace(self + "OnEscortWaitStart() starting timer")
	if Bail_If_Escort_Wait_Duration >= 0
		StartTimer(Bail_If_Escort_Wait_Duration, id_EscortWaitTimer)
	endif

EndEvent

Event OnEscortWaitStop()
	debug.trace(self + "OnEscortWaitStop() canceling timer")
	CancelTimer(id_EscortWaitTimer)

EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == id_EscortWaitTimer
		debug.trace(self + "OnTimer() EscortWaitTimer fired, Bailing Out.")
		BailOut()

	elseif aiTimerID == id_DistancePollTimer
		float distance = GetReference().GetDistance(Game.GetPlayer())

		debug.trace(self + "Ontimer() id_DistancePollTimer checking distance " + distance)
		if distance > Bail_If_Distance_From_Player
			debug.trace(self + "Ontimer() id_DistancePollTimer distance is too far, Bailing Out")
			BailOut()
		else 
			StartDistancePollingIfNeeded()
		endIf

	endIf

EndEvent


Function BailOut()
	debug.trace(self + "BailOut()")
	CancelTimer(id_EscortWaitTimer)
	CancelTimer(id_DistancePollTimer)

	if BailOut_Stop_Scene
		debug.trace(self + "BailOut() stopping scene:" + BailOut_Stop_Scene)
		BailOut_Stop_Scene.Stop()
	elseif BailOut_Additional_Scenes_To_Stop.Length == 0
		Game.Warning(self + "BailOut() doesn't have property set for BailOut_Stop_Scene")
	endif

	int i = 0
	while (i < BailOut_Additional_Scenes_To_Stop.length)
		debug.trace(self + "BailOut() stopping scene:" + BailOut_Additional_Scenes_To_Stop[i])
		BailOut_Additional_Scenes_To_Stop[i].Stop()
		i += 1
	endwhile
	

EndFunction


Function StartDistancePollingIfNeeded() ;this should become an event when we can register for distance events
	if Bail_If_Distance_From_Player > 0
		debug.trace(self + "StartDistancePollingIfNeeded() will bail when distance is:" + Bail_If_Distance_From_Player)
		startTimer(dur_DistancePollTimerFrequency, id_DistancePollTimer)
	endif
	
EndFunction