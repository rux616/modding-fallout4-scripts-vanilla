Scriptname FXPrydwenFlyoverScript extends ObjectReference
{This script controls the Prydwen Flight Animations.}

MusicType Property DemoPrydwenMusic Auto Const
{This is the music and sound effects for when the Prydwen appears.}

ObjectReference Property MQ201PrydPathMarkerFinal Auto Const

bool bIsAnimating = false
bool bStillNeedsToSwap = True
bool bCorrectQuestTime = False

int PrydwenPlaybackTimer = 150 Const
int TimeBackupDeleteTimer = 350 Const
int WaypointIndex = 0

float FlightSpeed = 700.0;;300.00
;float TangentWeight = 100000.0 Const

WorldSpace StartingWorldSpace

Actor PlayerRef

quest property BoSEnable Auto Const

Event OnInit()
	FlightSpeed = 700.0
EndEvent

Event OnLoad()
	if (self.Is3DLoaded())
		PlayerRef = Game.GetPlayer() 
		StartingWorldSpace = PlayerRef.GetWorldSpace()
		if bIsAnimating == false
			bIsAnimating = PlayAnimation("BeginFlyover")

			if bIsAnimating
				if DemoPrydwenMusic
					DemoPrydwenMusic.add()
				endif
				starttimer(90,PrydwenPlaybackTimer) ;90 is normal
				bCorrectQuestTime = True
				RegisterForPlayerWait()
				RegisterForPlayerTeleport()
			endif
		endif
	endif
endEvent

Event OnUnload()
	if bCorrectQuestTime
		if bStillNeedsToSwap
			bStillNeedsToSwap = false
			BoSEnable.SetStage(15)
		endif

		FXCleanUp()
	endif
endEvent

Event OnTimer(int Timer)
	if Timer == PrydwenPlaybackTimer
		;bIsAnimating = false
		self.TranslateTo(-3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 82.0, FlightSpeed, 4.0)

		;;self.SplineTranslateTo(-3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 68.0, TangentWeight, FlightSpeed, 0.0)
	endif

	if Timer == TimeBackupDeleteTimer
		FXCleanUp()
	endif
endEvent

Event OnTranslationAlmostComplete()
	WaypointIndex += 1
	if WaypointIndex == 1
		FlightSpeed = 700.0
		self.TranslateTo(22680.3945, 2180.1492, 6452.7524, 0.0, 0.0, 96.0, FlightSpeed, 4.0)
	elseif WaypointIndex == 2
		self.TranslateTo( 48354.8086, -1531.9031, 6019.6567, 0.0, 0.0, 137.0, FlightSpeed, 4.0)
	elseif WaypointIndex == 3
		self.SplineTranslateTo(55192.0, -10104.0, 5696.0, 0.0, 0.0, 270.0, 2048.00, FlightSpeed, 4.0)
		;self.TranslateTo(55192.0, -10104.0, 5696.0, 0.0, 0.0, 270.0, FlightSpeed, 4.0)
	elseif WaypointIndex >= 4
		if bStillNeedsToSwap
			bStillNeedsToSwap = false
			BoSEnable.SetStage(15)
		endif
		starttimer(120,TimeBackupDeleteTimer)
	endif
endEvent

Event OnPlayerWaitStop(bool abInterrupted)
	if bStillNeedsToSwap
		bStillNeedsToSwap = false
		BoSEnable.SetStage(15)
	endif
	FXCleanUp()
endEvent

Event OnPlayerTeleport()
	if bStillNeedsToSwap
		bStillNeedsToSwap = false
		BoSEnable.SetStage(15)
	endif
	FXCleanUp()
endEvent

Function FXCleanUp()
	UnregisterForPlayerWait()
	UnregisterForPlayerTeleport()
	self.StopTranslation()
	cancelTimer(PrydwenPlaybackTimer)
	cancelTimer(TimeBackupDeleteTimer)
	self.disable()
	;self.delete()
endFunction





;; ------------------------------Debug functions for testing-----------------------------------
Function StartOver()
	self.reset()
	;self.disable()
	;self.Enable()
	PlayAnimation("Stage2")
	WaypointIndex = 0
	self.TranslateTo(-3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 82.0, FlightSpeed, 4.0)
endFunction

Function StartOverTimed()
	bIsAnimating = false
	self.reset()
	;self.disable()
	;self.Enable()
	starttimer(90,PrydwenPlaybackTimer)
	PlayAnimation("Reset")
	bIsAnimating = PlayAnimation("BeginFlyover")
	WaypointIndex = 0
	;self.TranslateTo(-3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 68.0, FlightSpeed, 2.0)
endFunction


;/ Event OnTranslationComplete()
	WaypointIndex += 1
	if WaypointIndex == 1
		self.SplineTranslateTo(22680.3945, 2180.1492, 5652.7524, 0.0, 0.0, 96.0, TangentWeight, FlightSpeed, 0.0)
	elseif WaypointIndex == 2
		self.SplineTranslateTo( 48354.8086, -1531.9031, 5619.6567, 0.0, 0.0, 137.0, TangentWeight, FlightSpeed, 0.0)
	elseif WaypointIndex == 3
		self.SplineTranslateTo(55192.0, -10104.0, 5696.0, 0.0, 0.0, 270.0, TangentWeight, FlightSpeed, 0.0)
	elseif WaypointIndex >= 4
		self.reset()
		self.TranslateTo(-3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 68.0, FlightSpeed, 2.0)
		WaypointIndex = 0
endEvent /;


;;MQ201PrydPathMarkerA  -3370.8340, -2399.8315, 6949.7407, 0.0, 0.0, 68.0,
;;MQ201PrydPathMarkerB  22680.3945, 2180.1492, 5652.7524, 0.0, 0.0, 96.0, 
;;MQ201PrydPathMarkerC  48354.8086, -1531.9031, 5619.6567, 0.0, 0.0, 137.0,
;;MQ201PrydPathMarkerFinal 55192.0, -10104.0, 5696.0, 0.0, 0.0, 270.0,


;;Function SplineTranslateToRef(ObjectReference arTarget, float afTangentMagnitude, float afSpeed, float afMaxRotationSpeed = 0.0)