Scriptname DLC04:DLC04MQ01GauntletQuestScript extends Quest Conditional

Default2StateActivator property DLC04Gauntlet_TurretTrapEntryDoor Auto Const Mandatory
ObjectReference property DLC04Gauntlet_TurretTrapEntryDoorCollision Auto Const Mandatory
RefCollectionAlias property TurretTrapTurrets Auto Const Mandatory
MusicType property MUSStingerShort Auto Const Mandatory

int RaiderPotshotRunnersTimerID = 3
int GasTrapRespawnTimerID = 4
int GasTrapSceneTimerID = 7
int RaiderOverbossBattleTimerID = 1
int RaiderOverbossSelectHoldPositionTimerID = 2
int ThirstZapperObjectiveTimerID = 5




Function StartTurretTrap()
	DLC04Gauntlet_TurretTrapEntryDoorCollision.Enable()
	DLC04Gauntlet_TurretTrapEntryDoor.SetOpen(False)
	Debug.Trace("Adding Stinger " + MUSStingerShort)
	MUSStingerShort.Add()
	int i = 0
	While (i < TurretTrapTurrets.GetCount())
		(TurretTrapTurrets.GetAt(i) as Actor).SetUnconscious(False)
		(TurretTrapTurrets.GetAt(i) as Actor).StartCombat(Game.GetPlayer())
		i = i + 1
	EndWhile
EndFunction

Function EndTurretTrap()
	DLC04Gauntlet_TurretTrapEntryDoor.SetOpen(True)
	DLC04Gauntlet_TurretTrapEntryDoorCollision.DisableNoWait()
EndFunction	

Function CleanupTurretTrap()
	DLC04Gauntlet_TurretTrapEntryDoor.DisableNoWait()
	DLC04Gauntlet_TurretTrapEntryDoorCollision.DisableNoWait()
EndFunction	



RefCollectionAlias property MonkeyTrapTurrets Auto Const Mandatory

Function StartMonkeyTrap()
	int i = 0
	While (i < MonkeyTrapTurrets.GetCount())
		(MonkeyTrapTurrets.GetAt(i) as Actor).SetUnconscious(False)
		(MonkeyTrapTurrets.GetAt(i) as Actor).StartCombat(Game.GetPlayer())
		Utility.Wait(0.2)
		i = i + 1
	EndWhile
EndFunction






RefCollectionAlias property GasTrapMarkers Auto Const Mandatory
RefCollectionAlias property GasTrapValves Auto Const Mandatory
ObjectReference[] property GasTrapGasTraps Auto
Default2StateActivator property DLC04Gauntlet_GasTrapEntryDoor Auto Const Mandatory
Default2StateActivator property DLC04Gauntlet_GasTrapExitDoor Auto Const Mandatory
ObjectReference property DLC04Gauntlet_GasTrapEntryDoorCollision Auto Const Mandatory
ObjectReference property DLC04Gauntlet_GasTrapExitDoorCollision Auto Const Mandatory
ObjectReference property DLC04_GasTrapHazard Auto Const Mandatory
ObjectReference property DLC04_GauntletGasTrapEnableMarker01 Auto Const Mandatory
ObjectReference property DLC04_GauntletGasTrapEnableMarker02 Auto Const Mandatory
ObjectReference property DLC04_GauntletGasTrapEnableMarker03 Auto Const Mandatory
ObjectReference property DLC04_GauntletGasTrapEnableMarker04 Auto Const Mandatory
Activator property TrapExplGas01 Auto Const Mandatory
Scene property DLC04MQ01Gauntlet_GasTrapPlayerCoughing Auto Const Mandatory
int property GasValvesDisabled Auto Conditional
bool property GasTrapSceneActive = False Auto
bool property GasTrapsNeedRespawn = True Auto
Scene property DLC04MQ01_PAGauntletInterior Auto Const Mandatory


Function DisableGasValve()
	GasValvesDisabled = GasValvesDisabled + 1
	Debug.Trace(GasValvesDisabled)
	if (!DLC04MQ01_PAGauntletInterior.IsPlaying())
		if (!DLC04MQ01.GetStageDone(226))
			DLC04MQ01.SetStage(226)
		ElseIf (!DLC04MQ01.GetStageDone(227))
			DLC04MQ01.SetStage(227)
		ElseIf (!DLC04MQ01.GetStageDone(228))
			DLC04MQ01.SetStage(228)
		EndIf
	EndIf
EndFunction

Function StartGasTrap()
	DLC04Gauntlet_GasTrapEntryDoorCollision.EnableNoWait()
	DLC04Gauntlet_GasTrapExitDoor.SetOpenNoWait(False)
	DLC04Gauntlet_GasTrapEntryDoor.SetOpen(False)
	MUSStingerShort.Add()
	DLC04_GauntletGasTrapEnableMarker01.EnableNoWait()
	DLC04_GauntletGasTrapEnableMarker02.EnableNoWait()
	DLC04_GauntletGasTrapEnableMarker03.EnableNoWait()
	DLC04_GauntletGasTrapEnableMarker04.EnableNoWait()
	Debug.Trace("Spawning Gas Traps")
	RespawnGasTraps()
	;Enabling Gas Trap valves.
	int i = 0
	While (i < GasTrapValves.GetCount())
		DLC04:DLC04_GauntletGasValveScript current = GasTrapValves.GetAt(i) as DLC04:DLC04_GauntletGasValveScript
		Debug.Trace("-Readying " + current)
		if (current != None)
			current.ReadyGasValve()
		EndIf
		i = i + 1
	EndWhile
	Debug.Trace("Enabling Gas Trap Hazard")
	DLC04_GasTrapHazard.EnableNoWait()
	Debug.Trace("Starting " + DLC04MQ01Gauntlet_GasTrapPlayerCoughing)
	GasTrapSceneActive = True
	PlayGasTrapScene()
EndFunction

Function PlayGasTrapScene()
	Debug.Trace("Playing scene")
	if (GasTrapSceneActive)
		DLC04MQ01Gauntlet_GasTrapPlayerCoughing.Start()
		StartTimer(Utility.RandomFloat(8,12), GasTrapSceneTimerID)
	EndIf
EndFunction

Function EndGasTrap()
	GasTrapSceneActive = False
	CancelTimer(GasTrapSceneTimerID)
	GasTrapsNeedRespawn = False
	CancelTimer(GasTrapRespawnTimerID)
	DespawnGasTraps()
	DLC04Gauntlet_GasTrapEntryDoorCollision.DisableNoWait()
	DLC04Gauntlet_GasTrapExitDoorCollision.DisableNoWait()
	DLC04Gauntlet_GasTrapEntryDoor.SetOpenNoWait(True)
	DLC04Gauntlet_GasTrapExitDoor.SetOpenNoWait(True)
	DLC04_GauntletGasTrapEnableMarker01.DisableNoWait()
	DLC04_GauntletGasTrapEnableMarker02.DisableNoWait()
	DLC04_GauntletGasTrapEnableMarker03.DisableNoWait()
	DLC04_GauntletGasTrapEnableMarker04.DisableNoWait()
	int i = 0
	While (i < GasTrapGasTraps.Length)
		GasTrapGasTraps[i].DisableNoWait(True)
		i = i + 1
	EndWhile
	i = 0
	While (i < GasTrapValves.GetCount())
		DLC04:DLC04_GauntletGasValveScript current = GasTrapValves.GetAt(i) as DLC04:DLC04_GauntletGasValveScript
		if (current != None)
			current.ShutoffGasValve()
		EndIf
		i = i + 1
	EndWhile
	GasTrapGasTraps = None
	DLC04_GasTrapHazard.DisableNoWait()
	DLC04MQ01Gauntlet_GasTrapPlayerCoughing.Stop()
	Self.UnregisterForRemoteEvent(GasTrapGasTraps[0], "OnDestructionStageChanged")
EndFunction

Function RespawnGasTraps()
	DespawnGasTraps()
	Debug.Trace("--------------------")
	if (GasTrapsNeedRespawn && !GetStageDone(850))
		GasTrapsNeedRespawn = False
		GasTrapGasTraps = new ObjectReference[GasTrapMarkers.GetCount()]
		int i = 0
		While (i < GasTrapGasTraps.Length)
			GasTrapGasTraps[i] = GasTrapMarkers.GetAt(i).PlaceAtMe(TrapExplGas01)
			Debug.Trace("Spawning " + GasTrapGasTraps[i])
			i = i + 1
		EndWhile
		Self.RegisterForRemoteEvent(GasTrapGasTraps[0], "OnDestructionStageChanged")
	EndIf
EndFunction

Function DespawnGasTraps()
	int i = 0
	While ((GasTrapGasTraps != None) && (i < GasTrapGasTraps.Length))
		Debug.Trace("Despawning " + Self)
		GasTrapGasTraps[i].DisableNoWait(True)
		i = i + 1
	EndWhile
	GasTrapGasTraps = new ObjectReference[GasTrapMarkers.GetCount()]
EndFunction

Event ObjectReference.OnDestructionStageChanged(ObjectReference source, int aiOldStage, int aiCurrentStage)
	Debug.Trace("Received OnDestructionStageChanged: " + aiOldStage + ", " +aiCurrentStage)

	if ((aiCurrentStage == 3) && (GasValvesDisabled <= 3))
		Debug.Trace("Starting Gas Trap Respawn Timer")
		GasTrapsNeedRespawn = True
		StartTimer(3, GasTrapRespawnTimerID)
	Else
		Self.RegisterForRemoteEvent(source, "OnDestructionStageChanged")
	EndIf
EndEvent









ActorValue property DLC04GauntletPotshotState Auto Const Mandatory
ActorValue property DLC04GauntletPotshotTimestamp Auto Const Mandatory
RefCollectionAlias property RaiderPotshotRunners Auto Const Mandatory
float property PotshotRunTimeLimit = 0.005 Auto Const
ObjectReference property DLC04GauntletPotshotRunnersTriggerRef Auto Const Mandatory
ActorBase property DLC04Gauntlet_LvlRaiderAnyGangPotshots Auto Const Mandatory

Function StartPotshotRunners()
	StartTimer(0, RaiderPotshotRunnersTimerID)
EndFunction

Function UpdateRunners()
	Debug.Trace("Updating Runners")
	int i = 0
	While (i < RaiderPotshotRunners.GetCount())
		UpdateRunner(RaiderPotshotRunners.GetAt(i) as Actor)
		i = i + 1
	EndWhile
	if (GetStage() < 1000)
		StartTimer(1, RaiderPotshotRunnersTimerID)
	EndIf
EndFunction

Function UpdateRunner(Actor runner)
	Debug.Trace("--Updating " + runner)
	if ((runner != None) && !(runner.IsDead()))
		if (GetStage() >= 1000)
			runner.DisableNoWait()
			return
		EndIf
		if (runner.IsDisabled())
			runner.EnableNoWait()
		EndIf

		int runnerState =  runner.GetValue(DLC04GauntletPotshotState) as int
		if (runnerState == 0)
			if (DLC04GauntletPotshotRunnersTriggerRef.GetTriggerObjectCount() > 0)
				Debug.Trace("--AA: " + Utility.GetCurrentGameTime() + PotshotRunTimeLimit)
				runner.SetValue(DLC04GauntletPotshotState, 1)
				runner.SetValue(DLC04GauntletPotshotTimestamp, Utility.GetCurrentGameTime() + PotshotRunTimeLimit)
				RegisterForHitEvent(player, runner)
				RegisterForHitEvent(runner, player)
				runner.EvaluatePackage()
				Utility.Wait(Utility.RandomFloat(0, 1.5)) 
			EndIf
		ElseIf (runnerState == 1)
			if (DLC04GauntletPotshotRunnersTriggerRef.GetTriggerObjectCount() > 0)
				Debug.Trace("--BB: " + Utility.GetCurrentGameTime() + "/" + runner.GetValue(DLC04GauntletPotshotTimestamp) + ", " + DLC04GauntletPotshotState)
				if ((Utility.GetCurrentGameTime() > runner.GetValue(DLC04GauntletPotshotTimestamp)) || runner.GetValue(DLC04GauntletPotshotState) > 2)
					Debug.Trace("--BBB")
					runner.SetValue(DLC04GauntletPotshotState, 10)
				EndIf
			Else
				Debug.Trace("--Bx")
				runner.SetValue(DLC04GauntletPotshotState, 0)
			EndIf
		Else ;runnerState == 2
			if ((runner.GetDistance(player) > 512) && (!player.HasDetectionLoS(runner)) && (!runner.HasDetectionLoS(player)))
				Debug.Trace("--C")
				runner.DisableNoWait()
				runner.Kill()
			EndIf
		EndIf
		runner.EvaluatePackage()
	EndIf
EndFunction














































Quest property DLC04MQ01 Auto Const Mandatory
Scene property DLC04MQ01_700_PAOverbossShieldDown Auto Const Mandatory
Scene property DLC04MQ01_700_PAOverbossShieldUp Auto Const Mandatory

ReferenceAlias property Alias_RaiderOverboss Auto Const Mandatory
Actor RaiderOverboss
Actor player
ObjectReference PowerArmorFX
Weapon property DLC04_ThirstZapper Auto Const Mandatory
ActorValue property DLC04RaiderOverbossResistanceMult Auto Const Mandatory
Scene property DLC04MQ01_700_PAFightBegin Auto Const Mandatory
Scene property DLC04MQ01Gauntlet_Overboss_DischargeSmall Auto Const Mandatory
Scene property DLC04MQ01Gauntlet_Overboss_DischargeLarge Auto Const Mandatory
Scene property DLC04MQ01Gauntlet_Overboss_DischargeMAX Auto Const Mandatory
ActorValue property Health Auto Const Mandatory
ReferenceAlias property Alias_PowerArmorFX Auto Const Mandatory
String PowerArmorFXAnimVariable = "fToggleBlend" Const

int RaiderOverboss_GrenadeCounter = 10
int RaiderOverboss_GrenadeThreshold = 2

bool AllowOverbossGrenade = False

int RaiderOverbossFightStartStage = 1520
int ThirstZapperObjectiveTimerDelay = 10

float ResistanceMultRecoveryPerStep = -0.00065
float HitEvent1Timestamp = 0.0
float HitEvent2Timestamp = 0.0
float HitEvent3Timestamp = 0.0
float HitEventHealthPercentage = 0.0
float HitEventTimeThreshold = 0.00375 Const




Function Startup()
	player = Game.GetPlayer()
	RaiderOverboss = Alias_RaiderOverboss.GetActorRef()
	PowerArmorFX = Alias_PowerArmorFX.GetReference()
	RaiderOverboss.EquipItem(PowerArmorFX)
EndFunction

Function InitializeOverbossBattle()
	if (GetStageDone(1260))
		ResistanceMultRecoveryPerStep = -0.0004
	EndIf
	SetRaiderOverbossResistanceMult(-100)
	RegisterForRemoteEvent(RaiderOverboss, "OnDying")
	Debug.Trace("Battle Initialized")
	RegisterForRaiderOverbossHitEvent()
	RegisterForRaiderOverbossAnimEvent()
EndFunction

Function StartOverbossBattle()
	StartTimer(0, RaiderOverbossBattleTimerID)
	StartTimer(ThirstZapperObjectiveTimerDelay, ThirstZapperObjectiveTimerID)
EndFunction

Function EndOverbossBattle()
	CancelTimer(RaiderOverbossBattleTimerID)
	CancelTimer(RaiderOverbossSelectHoldPositionTimerID)
	CancelTimer(ThirstZapperObjectiveTimerID)
EndFunction

Function RegisterForRaiderOverbossHitEvent()
	Debug.Trace("Registered for Hit")
	Self.RegisterForHitEvent(RaiderOverboss, None, DLC04_ThirstZapper)
	HitEvent3Timestamp = HitEvent2Timestamp
	HitEvent2Timestamp = HitEvent1Timestamp
	HitEvent1Timestamp = Utility.GetCurrentGameTime()
	HitEventHealthPercentage = RaiderOverboss.GetValuePercentage(Health)
EndFunction

Function RegisterForRaiderOverbossAnimEvent()
	Debug.Trace("Registered for Anim Event")
	Self.RegisterForAnimationEvent(RaiderOverboss, "FootLeft")
	Self.RegisterForAnimationEvent(RaiderOverboss, "FootRight")
EndFunction



;-0.1 is standard subtract, 1 is reset.
Function SetRaiderOverbossResistanceMult(float modValue)
	float newResistanceMult
	if (modValue > 0)
		newResistanceMult = 1
		RaiderOverboss.SetValue(DLC04RaiderOverbossResistanceMult, 1)
		RaiderOverboss.GetLeveledActorBase().SetInvulnerable(False)
	Else
		newResistanceMult = Math.Max(0, RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult) + modValue)
		RaiderOverboss.SetValue(DLC04RaiderOverbossResistanceMult, newResistanceMult)
		if ((newResistanceMult == 0) && GetStageDone(1520))
			RaiderOverboss.GetLeveledActorBase().SetInvulnerable(True)
			DLC04MQ01_700_PAOverbossShieldDown.Stop()
			DLC04MQ01_700_PAOverbossShieldUp.Start()
		EndIf
	EndIf
	RaiderOverboss.SetSubGraphFloatVariable(PowerArmorFXAnimVariable, 1 - newResistanceMult)
	Debug.Trace("New Resistance Mult: " + newResistanceMult)
EndFunction

Auto State Ready
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (akSource == RaiderOverboss)
			GoToState("Busy")
			Debug.Trace("In Anim Event")
			if (RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult) > 0)
				;This plays better with an exponential curve over time.
				float timeMod = (Utility.GetCurrentGameTime() - HitEvent1Timestamp) * 10000
				float healthMod = Math.Max(0.75, Math.Min(4, (HitEventHealthPercentage / RaiderOverboss.GetValuePercentage(Health)) - 0.25))

				Debug.Trace("Mods: " + timeMod + ", " + healthMod + "; adjusting by " + (ResistanceMultRecoveryPerStep * timeMod * healthMod))

				SetRaiderOverbossResistanceMult(ResistanceMultRecoveryPerStep * timeMod * healthMod)
				Debug.Trace("Got " + asEventName + ", now=" + RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult))
			EndIf
			GoToState("Ready")
		EndIf
	EndEvent
EndState

State Busy
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		;Do nothing.
	EndEvent
EndState
 




Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Debug.Trace("Received hit event " + akSource + ", " + RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult))
	if ((akTarget == RaiderOverboss)); && (akSource == DLC04_ThirstZapper))
		Debug.Trace("Data: " + (Utility.GetCurrentGameTime() - HitEvent1Timestamp) + "/ " + ((Utility.GetCurrentGameTime() - HitEvent1Timestamp) < HitEventTimeThreshold) + (Utility.GetCurrentGameTime() - HitEvent2Timestamp) + "/ " + ((Utility.GetCurrentGameTime() - HitEvent2Timestamp) < HitEventTimeThreshold)  + ", " + (Utility.GetCurrentGameTime() - HitEvent3Timestamp) + "/ " + ((Utility.GetCurrentGameTime() - HitEvent3Timestamp) < HitEventTimeThreshold)) 
		float resistanceMult = RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult)
		if (resistanceMult > 0.7)
			SetRaiderOverbossResistanceMult(1)
			RegisterForRaiderOverbossHitEvent()
		ElseIf ((resistanceMult > 0.35) && ((Utility.GetCurrentGameTime() - HitEvent1Timestamp) < HitEventTimeThreshold))
			DLC04MQ01_700_PAFightBegin.Stop()
			DLC04MQ01_700_PAOverbossShieldUp.Stop()
			DLC04MQ01Gauntlet_Overboss_DischargeSmall.ForceStart()
		ElseIf ((resistanceMult > 0)  && ((Utility.GetCurrentGameTime() - HitEvent2Timestamp) < HitEventTimeThreshold))
			DLC04MQ01_700_PAFightBegin.Stop()
			DLC04MQ01_700_PAOverbossShieldUp.Stop()
			DLC04MQ01Gauntlet_Overboss_DischargeLarge.ForceStart()
			DLC04_NUK001_CrowdManager.ForceReactionSmallShock()
		ElseIf ((Utility.GetCurrentGameTime() - HitEvent3Timestamp) < HitEventTimeThreshold)
			DLC04MQ01_700_PAFightBegin.Stop()
			DLC04MQ01_700_PAOverbossShieldUp.Stop()
			DLC04MQ01Gauntlet_Overboss_DischargeMAX.ForceStart()
			if (!hasBrokenOverbossShield)
				hasBrokenOverbossShield = True
				DLC04_NUK001_CrowdManager.ForceReactionLargeShock()
				;Handle the objective for the first time the player does this.
				CancelTimer(ThirstZapperObjectiveTimerID)
				DLC04MQ01.SetObjectiveCompleted(750)
			Else
				DLC04_NUK001_CrowdManager.ForceReactionSmallShock()
			EndIf
		Else
			RegisterForRaiderOverbossHitEvent()
		EndIf
	ElseIf (akTarget == player)
		akAggressor.SetValue(DLC04GauntletPotshotState, akAggressor.GetValue(DLC04GauntletPotshotState) + 8)
		(akTarget as Actor).EvaluatePackage()
		RegisterForHitEvent(player, akAggressor)
		Debug.Trace("Player hit by " + akAggressor + "; count now=" + akAggressor.GetValue(DLC04GauntletPotshotState))
	ElseIf ((akTarget as Actor).GetLeveledActorBase() == DLC04Gauntlet_LvlRaiderAnyGangPotshots)
		akTarget.SetValue(DLC04GauntletPotshotState, akAggressor.GetValue(DLC04GauntletPotshotState) + 8)
		(akTarget as Actor).EvaluatePackage()
		RegisterForHitEvent(akTarget, player)
		Debug.Trace("Player hit " + akTarget + "; count now=" + akTarget.GetValue(DLC04GauntletPotshotState))
	EndIf
EndEvent

Function PlayShieldDownScene()
	DLC04MQ01_700_PAOverbossShieldDown.Start()
	RaiderOverboss_GrenadeCounter = RaiderOverboss_GrenadeCounter + 1
	Debug.Trace("-Incremented Grenade Counter =" + RaiderOverboss_GrenadeCounter)
	if ((RaiderOverboss_GrenadeCounter >= RaiderOverboss_GrenadeThreshold) && (RaiderOverboss.GetItemCount(DLC04RaiderOverboss_FragGrenadeSingleNP) == 0))
		Debug.Trace("---Giving Grenade =" + RaiderOverboss_GrenadeCounter)
		RaiderOverboss_GrenadeCounter = 0
		AddRaiderOverbossGrenade()
	EndIf
EndFunction

Function AddRaiderOverbossGrenade()
	Debug.Trace("Adding Grenade")
	RaiderOverboss.AddItem(DLC04RaiderOverboss_FragGrenadeSingleNP)
EndFunction

Function RemoveRaiderOverbossGrenade()
	Debug.Trace("Removing Grenade")
	RaiderOverboss.RemoveItem(DLC04RaiderOverboss_FragGrenadeSingleNP)
EndFunction

Event Actor.OnDying(Actor akSource, Actor akKiller)
	if (akSource == RaiderOverboss)
		RaiderOverboss.RemoveItem(PowerArmorFX)
	EndIf
EndEvent

int property RaiderOverbossCombatStyleState = 0 Auto Hidden Conditional
float CombatStyleSwapTimestamp = 0.0
float CombatStyleSwapTimeLimit = 20.0

CombatStyle property DLC04RaiderOverboss_csRangedFullOffense Auto Const Mandatory ;0
CombatStyle property DLC04RaiderOverboss_csMeleeFullOffense Auto Const Mandatory ;1
CombatStyle property DLC04RaiderOverboss_csRangedDefensive Auto Const Mandatory ;2

Keyword property DLC04RaiderOverbossHoldPositionTargetKeyword Auto Const Mandatory
Weapon property DLC04RaiderOverboss_FragGrenadeSingleNP Auto Const Mandatory

RefCollectionAlias property RaiderOverboss_HoldPositionTargets Auto Const Mandatory
ObjectReference property DLC04RaiderOverbossHoldPositionTargetMarker Auto Const Mandatory


Event OnTimer(int timerID)
	if (timerID == RaiderOverbossBattleTimerID)
		Debug.Trace("Overboss Timer:---")
		float resistanceMult = RaiderOverboss.GetValue(DLC04RaiderOverbossResistanceMult)
		if ((resistanceMult > 0) && (RaiderOverbossCombatStyleState < 2))
			Debug.Trace("SWITCHING TO: 2")
			RaiderOverbossCombatStyleState = 2
			CombatStyleSwapTimestamp = 0
			SelectRaiderBossHoldPositionTarget()
		ElseIf (resistanceMult <= 0)
			if (RaiderOverbossCombatStyleState == 2)
				CancelTimer(RaiderOverbossSelectHoldPositionTimerID)
				UnregisterForDistanceEvents(RaiderOverboss, DLC04RaiderOverbossHoldPositionTargetMarker)
				RaiderOverbossCombatStyleState = Utility.RandomInt(0, 1)
				CombatStyleSwapTimestamp = Utility.GetCurrentRealTime()
				Debug.Trace("SWITCHING TO: " + RaiderOverbossCombatStyleState)
			ElseIf (CombatStyleSwapTimestamp == 0)
				CombatStyleSwapTimestamp = Utility.GetCurrentRealTime()
				Debug.Trace("SETTING TIMESTAMP: " + RaiderOverbossCombatStyleState)
			ElseIf (CombatStyleSwapTimestamp + CombatStyleSwapTimeLimit < Utility.GetCurrentRealTime())
				RaiderOverbossCombatStyleState = 1 - RaiderOverbossCombatStyleState
				CombatStyleSwapTimestamp = Utility.GetCurrentRealTime()
				Debug.Trace("SWITCHING TO: " + RaiderOverbossCombatStyleState)
			EndIf
		EndIf

		if (RaiderOverbossCombatStyleState == 0)
			RaiderOverboss.SetCombatStyle(DLC04RaiderOverboss_csRangedFullOffense)
		ElseIf (RaiderOverbossCombatStyleState == 1)
			RaiderOverboss.SetCombatStyle(DLC04RaiderOverboss_csMeleeFullOffense)
		Else
			RaiderOverboss.SetCombatStyle(DLC04RaiderOverboss_csRangedDefensive)
		EndIf

		RaiderOverboss.EvaluatePackage()
		StartTimer(2, RaiderOverbossBattleTimerID)

	ElseIf (timerID == RaiderOverbossSelectHoldPositionTimerID)
		SelectRaiderBossHoldPositionTarget()
	ElseIf (timerID == RaiderPotshotRunnersTimerID)
		UpdateRunners()
	ElseIf (timerID == GasTrapRespawnTimerID)
		RespawnGasTraps()
	ElseIf (timerID == ThirstZapperObjectiveTimerID)
		DLC04MQ01.SetObjectiveDisplayed(750)
	ElseIf (timerID == GasTrapSceneTimerID)
		PlayGasTrapScene()
	EndIf
EndEvent

Function SelectRaiderBossHoldPositionTarget()
	Debug.Trace("--Trying to select Hold Position Target...")
	ObjectReference currentTarget = RaiderOverboss.GetLinkedRef(DLC04RaiderOverbossHoldPositionTargetKeyword)
	int maxIndex = RaiderOverboss_HoldPositionTargets.GetCount() - 1

	;Try to find a new target.
	int i = 0
	While (i < 10)
		ObjectReference newTarget = RaiderOverboss_HoldPositionTargets.GetAt(Utility.RandomInt(0, maxIndex))
		if ((newTarget == None) || (currentTarget == newTarget) || (newTarget.GetDistance(player) < 512))
			;Reject targets that are too close to the current target.
			i = i + 1
		Else
			DLC04RaiderOverbossHoldPositionTargetMarker.MoveTo(newTarget)
			Self.RegisterForDistanceLessThanEvent(RaiderOverboss, DLC04RaiderOverbossHoldPositionTargetMarker, 300)
			StartTimer(20, RaiderOverbossSelectHoldPositionTimerID)
			Debug.Trace("--...picked " + currentTarget)
			return
		EndIf
	EndWhile
	Debug.Trace("--...failed.")
	StartTimer(0, RaiderOverbossSelectHoldPositionTimerID)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;if (akObj1 == RaiderOverboss)
		Debug.Trace("Reached Hold Position target. Selecting a new target.")
		SelectRaiderBossHoldPositionTarget()
	;EndIf
EndEvent


DLC04:DLC04_NUK001_CrowdManagerQuestScript property DLC04_NUK001_CrowdManager Auto Const Mandatory
bool hasBrokenOverbossShield