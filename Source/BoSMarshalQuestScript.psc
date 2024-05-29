Scriptname BoSMarshalQuestScript extends Quest
{Quest script for BoSMarshal. All of the const scripting is on QF_BoSMarshal_00172298.}

ReferenceAlias[] property BoSMarshalAliases Auto Const Mandatory
Actor[] BoSMarshalActors
bool[] BoSMarshalActorsReverted

Function BeginRevertingActors()
	Debug.Trace("BoSMarshal: Begin reverting actors.")

	BoSMarshalActorsReverted = new bool[BoSMarshalAliases.Length]

	BoSMarshalActors = new Actor[BoSMarshalAliases.Length]
	int i = 0
	While (i < BoSMarshalAliases.Length)
		BoSMarshalActors[i] = BoSMarshalAliases[i].GetActorRef()
		i = i + 1
	EndWhile

	RevertActors()
EndFunction

Function RevertActors()
	;Debug.Trace("BoSMarshal: Reverting Actors...")
	int i = 0
	While (i < BoSMarshalActors.Length)
		if (!BoSMarshalActorsReverted[i])
			if ((BoSMarshalActors[i] == None) || (BoSMarshalActors[i].IsDead()))
				BoSMarshalActorsReverted[i] = True
				;Debug.Trace("BoSMarshal: " + i + " skipped; None or Dead.")
			ElseIf (BoSMarshalActors[i].IsDisabled() || !BoSMarshalActors[i].Is3DLoaded())
				BoSMarshalActorsReverted[i] = True
				RevertActor(BoSMarshalActors[i])
				;Debug.Trace("BoSMarshal: " + i + " reverted")
			;Else
				;Debug.Trace("BoSMarshal: " + i + " not ready to revert.")
			EndIf
		;Else
			;Debug.Trace("BoSMarshal: " + i + " already reverted.")
		EndIf
		i = i + 1
	EndWhile

	i = 0
	bool allActorsReverted = True
	While (allActorsReverted && (i < BoSMarshalActors.Length))
		allActorsReverted = BoSMarshalActorsReverted[i]
		i = i + 1
	EndWhile
	if (allActorsReverted)
		;Debug.Trace("BoSMarshal: All actors reverted. Stopping quest.")
		BoSMarshalActors = None
		Self.Stop()
	Else
		;Debug.Trace("BoSMarshal: " + i + " has not reverted. Restarting timer. ----------------")
		StartTimer(2, 1)
	EndIf
EndFunction

Event OnTimer(int timerID)
	if (timerID == 1)
		RevertActors()
	EndIf
EndEvent

Function RevertActor(Actor a)
	a.GetActorBase().SetProtected(True)
	a.Reset()
	a.EvaluatePackage()
	a.MoveToMyEditorLocation()
	a.MoveToPackageLocation()
	a.EnableNoWait()
EndFunction