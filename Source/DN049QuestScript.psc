Scriptname DN049QuestScript extends Quest Hidden Conditional
{Quest script for DN049. Updates the text replacement variables on the Galleria's terminals, and provides package control support for some of the scenes.}

;--------------
;Scene Support
;--------------

Group DN049_SceneProperties
	ReferenceAlias property Security_Greeter Auto Const Mandatory
	{Greeter Robot}

	int property GreeterZone Auto Hidden Conditional
	{Greeter package conditional -- The zone he should wait in.}

	ReferenceAlias property Outlet_Handy1 Auto Const Mandatory
	{Outlet Handy Robot}

	ReferenceAlias property Outlet_Handy2 Auto Const Mandatory
	{Outlet Handy Robot}

	ReferenceAlias property Outlet_Handy3 Auto Const Mandatory
	{Outlet Handy Robot}

	ReferenceAlias property Diner_Waitron Auto Const Mandatory
	{Waitron Robot}

	ReferenceAlias property Alias_Slo_Bean Auto Const Mandatory
	{Bean Robot}

	ReferenceAlias property Alias_Slo_Gas Auto Const Mandatory
	{The gas trap in Slocum's Joe.}

	Spell property DN049_HandyShortCircuitSpell Auto Const
	{The Short-Circuit spell that kills the Outler Handys.}

	bool property WaitronShouldWaitOnPlayer Auto Hidden Conditional
	{Waitron package conditional -- Whether she should go wait on the player.}
EndGroup


Function UpdateGreeterZone(int newZone)
	GreeterZone = newZone
	Security_Greeter.TryToEvaluatePackage()
EndFunction

Function UpdateWaitronState(bool shouldWaitOnPlayer)
	WaitronShouldWaitOnPlayer = shouldWaitOnPlayer
	Diner_Waitron.TryToEvaluatePackage()
EndFunction

Function StartOutletDemo()
	StartTimer(0, 1)
EndFunction

Function EndOutletDemo()
	CancelTimer(1)
	StartTimer(0, 2)
EndFunction

Function ForceGasTrapExplosion()
	;Make sure the gas explodes. If it didn't, force it.
	TrapExplGas gas = Alias_Slo_Gas.GetReference() as TrapExplGas
	if ((gas.GetState() == "waiting") && (!Alias_Slo_Bean.GetActorRef().IsDead()))
		Debug.Trace("Forced explosion")
		gas.GasExplode(Alias_Slo_Bean.GetActorRef())
	EndIf
EndFunction


;-----------------
;Terminal Support
;-----------------

Group DN049_TerminalProperties
	Quest property DN049 Auto Const Mandatory
	{DN049}

	ReferenceAlias property Director Auto Const Mandatory
	{Director Robot}

	RefCollectionAlias property DN049Terminals Auto Const Mandatory
	{RefCollection of terminals that need text replacement.}

	Message[] property GalleriaStateMsg Auto Const Mandatory
	{0=Closed, 1=Open, 2=Error}

	Message[] property DirectorStateMsg Auto Const Mandatory
	{0=Active, 1=Offline}

	Message[] property SupervisorStateMsg Auto Const Mandatory
	{0=Not Present, 1=Present}

	int[] property StoreErrorStates Auto Const Mandatory
	{Array of quest states representing 'Errors' in a store. (The robots have turned hostile.)}

	GlobalVariable property DN049_StoresReportingErrorsCount Auto Const Mandatory
	{Count of StoreErrorStates that have been set.}
EndGroup

Function UpdateTerminalText()
	int myGalleriaState = 0
	int myDirectorState = 0
	int mySupervisorState = 0
	int myStoreErrors = 0

	if (DN049.GetStageDone(860))
		;860: Grand Reopening has been triggered. This sets most of the values directly.
		myGalleriaState = 1
		mySupervisorState = 1
		myStoreErrors = 0
	Else
		;Otherwise, calculate store errors by GetStageDone.
		int i = 0
		While(i < StoreErrorStates.Length)
			if (DN049.GetStageDone(StoreErrorStates[i]))
				myStoreErrors = myStoreErrors + 1
			EndIf
			i = i + 1
		EndWhile
	EndIf

	;Galleria State is 2 if the Shutdown or Self Destruct have been triggered.
	if (DN049.GetStageDone(865) || DN049.GetStageDone(866))
		myGalleriaState = 2
	EndIf

	;Director State is just whether the Director is alive.
	if (Director.GetActorRef().IsDead())
		myDirectorState = 1
	EndIf

	;Update the global.
	DN049_StoresReportingErrorsCount.SetValue(myStoreErrors)
	DN049.UpdateCurrentInstanceGlobal(DN049_StoresReportingErrorsCount)

	;Update text replacement data on all of the terminals.
	ObjectReference term
	int i = 0
	While (i < DN049Terminals.GetCount())
		term = DN049Terminals.GetAt(i)
		term.AddTextReplacementData("DN049GalleriaState", GalleriaStateMsg[myGalleriaState])
		term.AddTextReplacementData("DN049DirectorState", DirectorStateMsg[myDirectorState])
		term.AddTextReplacementData("DN049SupervisorState", SupervisorStateMsg[mySupervisorState])
		i = i + 1
	EndWhile
EndFunction

;The Director's Terminal uses this function to fork off a timer to set stages in the 800-range with heavily
;latent function calls. This keeps the player from having to wait for the terminal's timeout delay.
Function SetMajorStage(int stageToSet, int delay = 0)
	Debug.Trace("in SetMajorStage")
	StartTimer(delay, stageToSet)
EndFunction

Event OnTimer(int timerID)
	Debug.Trace("OnTimer with timerid=" + timerid)
	if (timerID == 1)
		;The Outlet Handy scripted demo, part 1.
		Actor oH1 = Outlet_Handy1.GetActorRef()
		Actor oH2 = Outlet_Handy2.GetActorRef()
		Actor oH3 = Outlet_Handy3.GetActorRef()
		oH1.SetUnconscious(False)
		Utility.Wait(1)
		oH2.SetUnconscious(False)
		Utility.Wait(0.5)
		DN049_HandyShortCircuitSpell.Cast(oH2, oH2)
		Utility.Wait(4.5)
		oH3.SetUnconscious(False)
		Utility.Wait(5)
		DN049_HandyShortCircuitSpell.Cast(oH1, oH1)
	ElseIf (timerID == 2)
		;The Outlet Handy scripted demo, part 2.
		Utility.Wait(3)
		Actor oH1 = Outlet_Handy1.GetActorRef()
		Actor oH2 = Outlet_Handy2.GetActorRef()
		Actor oH3 = Outlet_Handy3.GetActorRef()
		DN049_HandyShortCircuitSpell.Cast(oH1, oH1)
		DN049_HandyShortCircuitSpell.Cast(oH2, oH2)
		DN049_HandyShortCircuitSpell.Cast(oH3, oH3)
	ElseIf (timerID == 3)
		;The Slocum Joe's Gas Explosion
		ForceGasTrapExplosion()
	ElseIf (timerID > 800)
		SetStage(timerID)
	EndIf
EndEvent