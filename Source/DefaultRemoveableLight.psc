Scriptname DefaultRemoveableLight extends ObjectReference Const
{This script handles "always off", takeable/breakable," and workshop powered lights

Always off: use an activator
Takeable/Breakable: use a light
Workshop Powered: use a light, and set Advanced data

Naming convention: Prefix all with rl_

Destruction Data:
Bulb should have 100 health
Stages:
<= 1 	Has Bulb - 100% health [Cap Damage, Ignore External]
2		No bulb - 99% health [Ignore External]
3		Broken Bulb - 50% health [Cap Damage, Ignore External]

Should have a rl_LightBulbLocD (DefaultRemoveableLightDamageHelper) moveable static linkedRef TO this object

THIS ASSUMES ANY Non-Keyworded linked refs in the link ref chain on this object are lights and that should be turned off if the light turns off
}





Group Properties
bool Property isTakeable = false const auto
{default: false; is this light object takeable. If false, it represents a static fixture in the world}

bool Property startsOn = true const auto
{initial state of light}

MiscObject Property Item const auto
{If isTakeable, this is the item that it replaces itself with in the player's inventory}

MiscObject Property BrokenItem const auto
{If isTakeable, this is the item that (if broken) it replaces itself  with in the player's inventory}

MiscObject property Bulb const auto
{which Bulb represents the light bulb for this object}

MiscObject property BrokenBulb const auto
{which Bulb represents the broken light bulb for this object}

Endgroup


Group Advanced Collapsed
bool Property IgnoreWorkshopPowerState = true const auto
{Default: True - object doesn't care if its near power grid or not.
False - need to have power and a bulb (destruction state 0) to be lit

Lights created by workshop should have this set to false.
Non-moveable Lights placed by artists should leave this set to true}

Light Property LightToSpawnIfPowered const auto
{ spawn this light if IgnoreWorkshopPowerState is false
	also delete when powerOff
 }

bool property SendLightsOutStoryEvent = true auto Const
{Default: True; do we send a story manager event for actors in the area to realize the light went out}
Endgroup

CustomEvent AO_DeleteMarkerEvent		; sent to markers to tell them to delete themselves


Event OnLoad()
	debug.trace(self + "OnLoad()")

	BlockActivation()
   	;SetMotionType(self.Motion_Keyframed)
   	if IgnoreWorkshopPowerState
   		if startsOn == false
			TurnOff(shouldSendDeleteEvent = false)
		endif
	else
		if IsPowered()
			TurnOn(shouldPlaceAOMarker = false)
		else
			TurnOff(shouldSendDeleteEvent = false)
		endif
	endif

;	if IgnoreWorkshopPowerState == false || startsOn == false
;		TurnOff(shouldSendDeleteEvent = false)
;	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	
	debug.trace(self + "OnActivate()")
	debug.trace(self + "OnActivate() GetCurrentDestructionStage():" + GetCurrentDestructionStage())
	debug.trace(self + "OnActivate() GetLinkedRef():" + GetLinkedRef() )

	if isTakeable

		TurnOffLinkedRefChain(shouldDisable = true, shouldDelete = true, responsibleActor = (akActionRef as Actor) )

		disable()
		delete()

		GiveItem(akActionRef) 
		GiveBulb(akActionRef) ;may or may not have a bulb associated with it

	elseif  GetCurrentDestructionStage() <= 1 ;has bulb
		if GetLinkedRef() ;we assume this a working light
			damageObject(1) ;no bulb destruction stage
			GiveBulb(akActionRef, 1)

		else ;we assume this is a non working light
			damageObject(50) ;broken bulb state
			GiveBulb(akActionRef, 2)
		endif
		
	elseif GetCurrentDestructionStage() == 2 ;has no bulb (it was taken from a previously working light)

		if akActionRef.GetItemCount(Bulb) >= 1 ;put bulb back in
			ClearDestruction()
			akActionRef.RemoveItem(Bulb)
			; turn on or off?
			; if this is a remote receiver, check state on that
			RemovableLightRemoteReceiver lightReceiver = (self as ObjectReference) as RemovableLightRemoteReceiver
			if lightReceiver
				; set bulb to current state, no delay
				lightReceiver.SetBulbState(lightReceiver.iState, true)
			else
				; otherwise, always turn on
				TurnOnLinkedRefChain(responsibleActor = akActionRef as Actor)
			endif
		endif

	endif

EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

	debug.trace(self + "OnDestructionStageChanged() aiOldStage:" + aiOldStage + ", aiCurrentStage:" + aiCurrentStage)

	if aiCurrentStage == 2 ;missing bulb
		TurnOffLinkedRefChain(shouldDisable = true, shouldDelete = false)
	elseif aiCurrentStage == 3 ;broken bulb
		
		if isTakeable == false
			SetDestroyed()
		endif

		TurnOffLinkedRefChain(shouldDisable = true, shouldDelete = true)
	endif

EndEvent


Function GiveBulb(ObjectReference akActionRef, int BulbState = -999) ;gives bulb or broken bulb based on destruction stage
	if BulbState == -999
		BulbState = GetCurrentDestructionStage()
	endif

	if BulbState <= 1 ;unbroken bulb
		if Bulb
			akActionRef.addItem(Bulb)
		endif

	elseif BulbState == 3 ;broken bulb
		if BrokenBulb
			akActionRef.addItem(BrokenBulb)
		endif

	endif

EndFunction

Function GiveItem(ObjectReference akActionRef, int BulbState = -999) ;gives bulb or broken bulb based on destruction stage
	if BulbState == -999
		BulbState = GetCurrentDestructionStage()
	endif

	if BulbState <= 1 ;unbroken bulb
		if Item
			akActionRef.addItem(Item)
		endif

	elseif BulbState == 3 ;broken bulb
		if BrokenItem
			akActionRef.addItem(BrokenItem)
		endif

	endif

EndFunction


Function TurnOffLinkedRefChain(bool shouldDisable, bool shouldDelete = false, bool shouldPlaceAOMarker = true, Actor responsibleActor = None, bool shouldSendDeleteEvent = true)
	;get rid of the linked ref chain (this ASSUMES these are lights / things that should go away)
	; shouldSendDeleteEvent: needed because OnLoad is triggered by change in destruction states - otherwise we get 2 events sent when the bulb is removed

	ObjectReference[] linkedRefChain = GetLinkedRefChain()

	debug.trace(self + "TurnOffLinkedRefChain() linkedRefChain:" + linkedRefChain)

	; detection event or place AO marker if changing from default state
	if startsOn
		SendLightChangeStateStoryEvent(responsibleActor, false, shouldPlaceAOMarker)
	elseif shouldSendDeleteEvent
		; send deletion event to clean up previously placed markers
		SendCustomEvent("AO_DeleteMarkerEvent", None)
	endif

	int i = 0
	while (i < linkedRefChain.length)

		if shouldDisable
			debug.trace(self + "TurnOffLinkedRefChain() disabling: " + linkedRefChain[i])
			linkedRefChain[i].disable()
		endif

		if shouldDelete
			debug.trace(self + "TurnOffLinkedRefChain() deleting: " + linkedRefChain[i])
			linkedRefChain[i].delete()
		endif

		i += 1
	endwhile

EndFunction

function TurnOnLinkedRefChain(Actor responsibleActor = None, bool shouldPlaceAOMarker = true)
	ObjectReference[] linkedRefChain = GetLinkedRefChain()

	; detection event or place AO marker if changing from default state
	if startsOn == false
		SendLightChangeStateStoryEvent(responsibleActor, true, shouldPlaceAOMarker)
	else
		; send deletion event to clean up previously placed markers
		SendCustomEvent("AO_DeleteMarkerEvent", None)
	endif

	int i = 0
	while (i < linkedRefChain.length)

		debug.trace(self + "TurnOnLinkedRefChain() enabling: " + linkedRefChain[i])
		linkedRefChain[i].enable()
	

		i += 1
	endwhile

EndFunction

Function SendLightChangeStateStoryEvent(Actor ActorTakingLight, bool LightTurningOn, bool shouldPlaceAOMarker)
	EEScript.GetScript().StartLightChangeStateQuest(self, ActorTakingLight, LightTurningOn, shouldPlaceAOMarker)
EndFunction

function BeingDamaged()
;see DefaultRemoveableLightDamageHelper script
;this function call in conjunction with stage 0 preventing all damage is used to prevent circular damage/destruction stage firing

	debug.trace(self + "BeingDamaged()")
	
	if GetCurrentDestructionStage() <= 1 ;unbroken bulb
		debug.trace(self + "BeingDamaged() damaging object")
		damageObject(50) ;break bulb

	else
		debug.trace(self + "BeingDamaged() ignoring damage")
	endif

EndFunction



;see RemovableLightRemoteReceiver
Function TurnOn(bool shouldPlaceAOMarker = true)
	debug.trace(self + "TurnOn()")

;	Enable()

	SetAnimationVariableFloat("fDampRate", 0.03) 
	SetAnimationVariableFloat("fToggleBlend", false as int) 

	if IgnoreWorkshopPowerState == false && LightToSpawnIfPowered
		SetLinkedRef(placeAtMe(LightToSpawnIfPowered))
	endif

	if IgnoreWorkshopPowerState
		TurnOnLinkedRefChain(shouldPlaceAOMarker = shouldPlaceAOMarker)
	endif
EndFunction

Function TurnOff(bool shouldPlaceAOMarker = true, bool shouldSendDeleteEvent = true)
	debug.trace(self + "TurnOff()")
;	OffRef.Moveto(self) ;gets cleaned up by the calling script
;	Disable()

	SetAnimationVariableFloat("fDampRate", 1.0) 
	SetAnimationVariableFloat("fToggleBlend", true as int) 

	if IgnoreWorkshopPowerState
		TurnOffLinkedRefChain(shouldDisable = true,  shouldDelete = false, shouldPlaceAOMarker = shouldPlaceAOMarker, shouldSendDeleteEvent = shouldSendDeleteEvent)
	endif
		
EndFunction

Event OnPowerOn(ObjectReference akPowerGenerator)
	if IgnoreWorkshopPowerState == false
		debug.trace(self + " OnPowerOn akPowerGenerator=" + akPowerGenerator)
		TurnOn()
	endif
EndEvent

Event OnPowerOff()
	if IgnoreWorkshopPowerState == false
		debug.trace(self + " OnPowerOff")
		TurnOff()
	endif
EndEvent
