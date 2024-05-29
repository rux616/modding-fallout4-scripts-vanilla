Scriptname DLC06:DLC06E01Script extends Quest

ReferenceAlias Property Alias_Workshop Auto Const mandatory

ReferenceAlias Property Alias_Clem Auto Const mandatory

ReferenceAlias Property Alias_PowerCycle Auto Const mandatory

ActorValue property PowerGenerated auto const mandatory 

Explosion Property GeneratorExplosion Auto Const

Explosion Property DLC06StaggerExplosion Auto Const

ImagespaceModifier property DLC06BlurImod auto const mandatory 

Keyword Property VaultSuitKeyword auto const mandatory

Activator property DLC06VaultWorkshopGenerator01_NoEdit auto const mandatory 

WorkshopObjectScript property MainGeneratorRef auto 
{ filled in when turned off by explosion }

int property VaultSuitWornStage = 175 auto const 
{ stage to set when Clem puts on vault suit }

Function StartWaitTimer(int nTimer = 500)
	StartTimerGameTime(1, nTimer)
EndFunction

Function CancelWaitTimer()
	CancelTimerGameTime(500)
	CancelTimerGameTime(800)
	CancelTimerGameTime(900)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, progress the quest
	if iTimer == 500
		Actor clem = Alias_Clem.GetActorRef()
		ObjectReference bike = Alias_PowerCycle.GetRef()
		; if clem is actually riding bike - done
		if bike.IsFurnitureInUse(true) && clem.GetSitState() == 3
			if !GetStageDone(600)
				CancelTimerGameTime(500)
				SetStage(600)
			endif
		else
			; otherwise run timer again
			StartWaitTimer(500)
		endif
	endif

	; repair main generator
	if iTimer == 800
		MainGeneratorRef.Repair()
	endif

	if iTimer == 900
		if !GetStageDone(900)
			CancelTimerGameTime(900)
			SetStage(1000)
		endif
	endif

EndEvent

function DamageAllGenerators()
	debug.trace(self + "DamageAllGenerators")
	WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
	ObjectReference[] generators = workshopRef.GetWorkshopResourceObjects(PowerGenerated)
	ObjectReference cycle = Alias_PowerCycle.GetRef()

	utility.wait(2.0)

	debug.trace(self + "  apply imod...")
	DLC06BlurImod.Apply()

	; controller rumble
	debug.trace(self + "  explosion at Clem's cycle...")
	cycle.RampRumble(power = 0.5, duration = 0.25, falloff = 4000.0)
	cycle.PlaceAtMe(DLC06StaggerExplosion)
	cycle.DamageObject(9999)

	int i = 0
	while i < generators.Length
		ObjectReference theGenerator = generators[i]
		if theGenerator != cycle
			debug.trace(self + "  explode " + theGenerator)
			if theGenerator.GetBaseObject() == DLC06VaultWorkshopGenerator01_NoEdit
				MainGeneratorRef = theGenerator as WorkshopObjectScript
				theGenerator.SetDestroyed()
			endif
			theGenerator.PlaceAtMe(GeneratorExplosion)
			theGenerator.DamageObject(9999)

			utility.wait(utility.randomFloat(0.1, 1.0))
		endif
		i += 1
	endWhile
endFunction

function CheckForVaultSuit()
	; first check if Clem is already in vault suit
	Actor clem = Alias_Clem.GetActorRef()
	if clem.WornHasKeyword(VaultSuitKeyword)
		SetStage(VaultSuitWornStage)
		UnregisterForRemoteEvent(clem, "OnItemEquipped")
	else 
		; watch for him to equip a vault suit
		RegisterForRemoteEvent(clem, "OnItemEquipped")
	endif
endFunction

Event Actor.OnItemEquipped(Actor akSource, Form akBaseObject, ObjectReference akReference)
	if akSource == Alias_Clem.GetActorRef()
		if akBaseObject.HasKeyword(VaultSuitKeyword)
			CheckForVaultSuit()
		endif
	endif
endEvent 