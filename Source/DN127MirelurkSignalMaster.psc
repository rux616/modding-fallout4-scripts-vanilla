Scriptname DN127MirelurkSignalMaster extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto
{Link to the on position trigger of the generator switch ON trigger.}
Keyword Property LinkCustom02 const auto
{Link to the generator sound marker, to be enabled when the generator is switche don.}
Keyword Property LinkCustom03 const auto
{Link to the on position of the sound switch ON trigger}
Keyword Property LinkCustom04 const auto
{Link to the signal switch itself, for allowing it to be flipped on}
Keyword Property LinkCustom05 const auto
{Link chained through all mirelurks so we can tell them to flee when the signal is turned on, and delete them when they unload.}
Keyword Property LinkCustom06 const auto
{Link to the looping mirelurk signal sound marker that should be enabled when the switch is flipped}

; KMK - added to turn on power
Keyword Property LinkCustom07 const auto
{Link to the workshop power source }
Keyword Property LinkCustom08 const auto
{Link to the workshop switch that turns on siren }

; KMK:
GlobalVariable Property SpectacleIslandMirelurkSirenOn Auto Const Mandatory
{ global to indicate whether the siren is on or off }

ObjectReference Property WorkshopWorkbench const auto

Location Property SpectacleIslandLocation const auto
{Location that we clear when the signal has been turned back on.}


Sound Property GeneratorSound const auto
{Sound to play when activating the generator, then a moment after enable the looping sound}
Sound Property SignalSound const auto
{Sound to play when you've successfully activated the signal switch.  This sound only plays once}

ObjectReference GeneratorSwitchOnTrigger
ObjectReference GeneratorLoopingSoundMarker
ObjectReference SignalSwitchOnTrigger
ObjectReference SignalSwitch
ObjectReference SignalLoopSoundMarker
; KMK:
ObjectReference GeneratorRef
ObjectReference WorkshopSwitchRef

Int GeneratorSoundInstance
Int SignalSoundInstance

Bool SignalTurnedOn = FALSE


Event OnInit()
    GeneratorSwitchOnTrigger = GetLinkedRef(LinkCustom01)
    GeneratorLoopingSoundMarker = GetLinkedRef(LinkCustom02)
    SignalSwitchOnTrigger = GetLinkedRef(LinkCustom03)
    SignalSwitch = GetLinkedRef(LinkCustom04)
    SignalLoopSoundMarker = GetLinkedRef(LinkCustom06)
    ; KMK:
    GeneratorRef = GetLinkedRef(LinkCustom07)
    WorkshopSwitchRef = GetLinkedRef(LinkCustom08)
    ; KMK - start with power off
	;GeneratorRef.SetOpen(true)
EndEvent

Event OnLoad()
    RegisterForRemoteEvent(GeneratorSwitchOnTrigger, "OnActivate")
    RegisterForRemoteEvent(SignalSwitchOnTrigger, "OnActivate")

    int count = 0
	int countmax = CountLinkedRefChain(LinkCustom05)
	debug.Trace(self + "Counted " + countmax + " Mirelurks.")
	while (count < countmax)
		count += 1
		RegisterForRemoteEvent(GetNthLinkedRef(count, LinkCustom05), "OnUnload")
		debug.Trace(self + "Registered " + GetNthLinkedRef(count, LinkCustom05) + " for OnUnload() event.")
	endwhile
EndEvent

Event ObjectReference.OnActivate(objectReference akSender, ObjectReference akActionRef)
	if akSender == GeneratorSwitchOnTrigger
		(SignalSwitch as CircuitBreakerMasterScript).DenyOnPosition = FALSE
		GeneratorSoundInstance = GeneratorSound.Play(GeneratorSwitchOnTrigger)
		Game.ShakeCamera(Game.GetPlayer(), 0.5, 1)
		utility.Wait(1.5)
		GeneratorLoopingSoundMarker.EnableNoWait()
	    ; KMK - turn power on
		GeneratorRef.SetOpen(false)
	endif

	if akSender == SignalSwitchOnTrigger && WorkshopSwitchRef.IsPowered() ; KMK - added IsPowered() check - shouldn't work if you turned off the generator before coming up here
		SignalTurnedOn = TRUE
		SignalSoundInstance = SignalSound.Play(SignalSwitchOnTrigger)
		SignalLoopSoundMarker.EnableNoWait()
		utility.Wait(1)
		self.Activate(self)
		utility.Wait(3)
		SpectacleIslandLocation.SetCleared()
		(WorkshopWorkbench as WorkshopScript).SetOwnedbyPlayer(true)

		; KMK: set global to turn off mirelurk attacks:
		SpectacleIslandMirelurkSirenOn.SetValue(1)
	    ; KMK - turn switch "on" = closed
		WorkshopSwitchRef.SetOpen(false)

		int count = 0
		int countmax = CountLinkedRefChain(LinkCustom05)
		debug.Trace(self + "Counted " + countmax + " Mirelurks.")
		while (count < countmax)
			count += 1
			if (GetNthLinkedRef(count, LinkCustom05).IsDisabled()) || ((GetNthLinkedRef(count, LinkCustom05) as Actor).GetSitState() == 3)
				GetNthLinkedRef(count, LinkCustom05).DisableNoWait()
				GetNthLinkedRef(count, LinkCustom05).Delete()
				(GetNthLinkedRef(count, LinkCustom05) as Actor).Kill()
				debug.Trace(self + "Actor NOT loaded, deleting " + GetNthLinkedRef(count, LinkCustom05) + " flee")
			else
				GetNthLinkedRef(count, LinkCustom05).SetValue(Game.GetAggressionAV(), 3)
				GetNthLinkedRef(count, LinkCustom05).SetValue(Game.GetConfidenceAV(), 0)
				debug.Trace(self + "Actor loaded, making " + GetNthLinkedRef(count, LinkCustom05) + " flee")
			endif
		endwhile

	endif
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSender)
	if SignalTurnedOn
    	akSender.DeleteWhenAble()
    endif
EndEvent