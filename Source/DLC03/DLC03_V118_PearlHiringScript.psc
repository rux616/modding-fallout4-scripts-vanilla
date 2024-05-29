Scriptname DLC03:DLC03_V118_PearlHiringScript extends Quest Conditional


bool Property bWaitOutsideTown Auto Conditional hidden
bool Property bWaitOutsideHotel Auto Conditional hidden
bool Property bWaitAtElevator Auto Conditional hidden
bool Property bEscortToHotelActive Auto Conditional hidden
bool Property bEscortInHotelActive Auto Conditional hidden
bool Property bEscortToVaultDoorActive Auto Conditional hidden
int Property iEscortToHotelProgress Auto Conditional hidden
int Property iEscortInHotelProgress Auto Conditional hidden

referenceAlias Property Pearl Auto Const Mandatory

int Property OutsideHotelStage = 400 Auto Const
int Property BasementElevatorStage = 500 Auto Const
int Property BasementStage = 600 Auto Const

Scene Property DLC03_V118_PearlCommentsHotel Auto Const Mandatory
Scene Property DLC03_V118_PearlComments Auto Const Mandatory
Scene Property DLC03_V118_PearlVaultDoorScene Auto Const Mandatory

Function SetEscortVar(bool TravelToHotel = true, int iSetValue = 0)
	Debug.Trace(self + ": Called SetEscortVar")
	if TravelToHotel
		Debug.Trace(self + ": Traveling to hotel")
		iEscortToHotelProgress = iSetValue
		if iSetValue >= 5
			bWaitOutsideHotel = true
			SetStage(OutsideHotelStage)
		endif
		DLC03_V118_PearlComments.Start()
	else
		Debug.Trace(self + ": Traveling IN hotel")
		iEscortInHotelProgress = iSetValue
		if iSetValue >= 6 && iSetValue < 10
			Debug.Trace(self + ": Reached the elevator")
			SetStage(BasementElevatorStage)
			DLC03_V118_PearlCommentsHotel.Start()
		endif
		if iSetValue >= 10
			SetStage(BasementStage)
			if iSetValue >= 20
				Debug.Trace(self + ": Reached Vault Door")
				SetStage(700)
			endif
		endif
	endif
	Pearl.GetActorRef().EvaluatePackage()
EndFunction
ObjectReference Property DLC03_V118_PearlHiringTeleportMarkerRef Auto Const Mandatory

bool teleportDone
Function MovePearlToBasement()
	if !teleportDone
		Pearl.GetReference().MoveTo(DLC03_V118_PearlHiringTeleportMarkerRef)
		teleportDone = true
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Far Harbor Attack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Group FarHarborAttackProperties
	DCL03MQ00Script Property pDLC03MQ00 Auto Const Mandatory
EndGroup

Event OnQuestInit()

RegisterForCustomEvent(pDLC03MQ00, "DLC03FarHarborKickOut")

EndEvent

Event DLC03:DCL03MQ00Script.DLC03FarHarborKickOut(DCL03MQ00Script akSender, Var[] akArgs)
;STUFF!
	MovePearlFromAttack()
EndEvent

Function MovePearlFromAttack()
	
	;If pearl is waiting at far harbor
		;do some things
		;bWaitOutsideTown = false
	;endif
EndFunction

Faction Property PlayerFaction Auto Const Mandatory
ActorValue Property FollowerDistance Auto Const Mandatory
Function SetPearlFriend()
	; Make Pearl ignore combat
	Actor myActorRef = Pearl.GetActorRef()
	myActorRef.IgnoreFriendlyHits()
	myActorRef.GetActorBase().SetEssential(TRUE)
	myActorRef.AddToFaction(PlayerFaction)
	myActorRef.SetValue(FollowerDistance, 0)
EndFunction
