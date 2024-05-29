scriptName DLC04:DLC04ArcadeShootingGallery extends DLC04:DLC04ArcadeController
{Shooting gallery game, most of the guts are in the DLC04ArcadeController}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function LocalGameStart()
	Debug.Trace(self + ": LocalGameStart")
	CurrentSpeedVar = StartingSpeedVar
	TimeBetweenSpawns = timeBetweenTargetsStart
	SpawnNodesCount = (TargetNodes.Length - 1)
	StartTimer(TimeBetweenSpawns, 0)
	StartTimer(TimeBetweenSpawns, 1)
	StartTimer(TimeBetweenSpawns, 2)
	StartTimer(TimeBetweenSpawns, 3)
endFunction

Function LocalGameEnd()
	int i = 0
	while i <= 3
		CancelTimer(i)
		i += 1
	EndWhile
	utility.wait(14.0)
endFunction

Struct Target
	Activator LeftTarget
	Activator RightTarget
EndStruct

Target[] Property Targets Auto Const Mandatory

objectReference[] CurrentTargets
Function SpawnTarget(int Spawnpoint)
	if CurrentTargets == none
		CurrentTargets = new objectReference[0]
	endif
	int S = utility.RandomInt(0, (Targets.length - 1))
	DLC04:DLC04ArcadeShootingGalleryTarget SpawnedTarget
	if TargetNodes[Spawnpoint].LeftSide
		SpawnedTarget = (PlaceAtNode(TargetNodes[Spawnpoint].NodeName, Targets[S].LeftTarget, abDeleteWhenAble = false, abAttach = true) as DLC04:DLC04ArcadeShootingGalleryTarget)
	else
		SpawnedTarget = (PlaceAtNode(TargetNodes[Spawnpoint].NodeName, Targets[S].RightTarget, abDeleteWhenAble = false, abAttach = true) as DLC04:DLC04ArcadeShootingGalleryTarget)
	Endif
	SpawnedTarget.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
	SpawnedTarget.RegisterForRemoteEvent(self, "OnReset")
	SpawnedTarget.SetLinkedRef(self)
	SpawnedTarget.SetAnimationVariableFloat(AnimSpeedVar, CurrentSpeedVar)
	SpawnedTarget.SetCanBeScored()
	;CurrentTargets.Add(SpawnedTarget)
EndFunction

int SpawnNodesCount
Function LocalOnTimer(int aiTimerID)
	if gameRunning
		if aiTimerID >= 0 && aiTimerID <= SpawnNodesCount
			SpawnTarget(aiTimerID)
			StartTimer(TimeBetweenSpawns, aiTimerID)
		endif
	endif
EndFunction



Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)
	IncreaseSpawnSpeed(SpeedUpOnHit)
	IncreaseMoveSpeed()
EndFunction

int p 
int numTillMoveSpeedIncrease = 3
Function TargetGotAway(objectReference target)
	;/
	int T = CurrentTargets.Find(Target)
	if T >= 0
		CurrentTargets.Remove(T)
	endif/;
	IncreaseSpawnSpeed(SpeedUpOnMissed)
	p += 1
	if p >= numTillMoveSpeedIncrease
		p = 0
		IncreaseMoveSpeed()
	endif
EndFunction

Function DoLocalDetachedCleanup()
	;/while 0 < CurrentTargets.Length
		CurrentTargets[0].Delete()
		CurrentTargets.Remove(0)
	EndWhile/;
EndFunction


Function IncreaseSpawnSpeed(float fIncrease)
	if TimeBetweenSpawns > timeBetweenTargetsMin
		TimeBetweenSpawns -= fIncrease
	endif
	
EndFunction

Function IncreaseMoveSpeed()
	if CurrentSpeedVar < MaxSpeedVar
		CurrentSpeedVar += SpeedVarIncrease
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Properties & Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Struct TargetNode
	string NodeName
	bool LeftSide
EndStruct

TargetNode[] Property TargetNodes Auto Const Mandatory

Function LocalAttachMyObjects()

EndFunction

float currentMaxTimeBetweenPopup


float TimeBetweenSpawns
float CurrentSpeedVar
Group LocalProperties CollapsedOnRef
	float Property timeBetweenTargetsMin = 1.5 auto const
	Float Property timeBetweenTargetsStart = 3.0 auto const
	float Property SpeedUpOnHit = 0.02 auto const
	float Property SpeedUpOnMissed = 0.01 auto const

	String Property AnimSpeedVar = "fSpeed" auto Const
	float property StartingSpeedVar = 0.3 Auto Const
	float property SpeedVarIncrease = 0.01 auto const 
	float Property MaxSpeedVar = 3.0 auto Const
endGroup

Function LocalWorkshopObjectDestroyed()
	
EndFunction