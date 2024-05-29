Scriptname DLC06:WorkshopBarberChairScript extends workshopobjectscript

group BarberChairProperties
	Faction property DLC06WorkshopVendorFactionBarber auto const mandatory

	ActorValue Property BoughtHaircutAV auto Const
	{Used to Condition dialogue}

	Keyword Property AnimFaceArchetypePlayer Auto Const
	{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

	InputEnableLayer Property BarberInputLayer Auto Hidden
endGroup

function AssignActor(WorkshopNPCScript newActor = None)
	; add/remove special combat faction
	; also protected status
	if newActor
		AssignFacegenVendor(newActor, true)
	else
		WorkshopNPCScript oldActor = GetActorRefOwner() as WorkshopNPCScript
		if oldActor
			AssignFacegenVendor(oldActor, false)
		endif
	endif
	Parent.AssignActor(newActor)
endFunction

function AssignFacegenVendor(WorkshopNPCScript assignedActor, bool bAssign)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)

	if bAssign
		assignedActor.AddToFaction(DLC06WorkshopVendorFactionBarber)
	else
		assignedActor.RemoveFromFaction(DLC06WorkshopVendorFactionBarber)
	endif
	ResetBarberChair()
endFunction


; purchase haircut
function BoughtHaircut(Actor barber)
	Actor PlayerREF = Game.GetPlayer()
	debug.trace(self + " BoughtHaircut called on HaircutScript - barber chair is available")
	BlockActivation(True, False)
	; used to conditionalize barber dialogue
	barber.SetValue(BoughtHaircutAV, 1.0)
	barber.EvaluatePackage()
	RegisterForRemoteEvent(PlayerREF, "OnSit")
	RegisterForRemoteEvent(PlayerREF, "OnGetUp")
endFunction

;reset everything
function ResetBarberChair()
	Actor PlayerREF = Game.GetPlayer()
 	debug.trace(self + " ResetBarberChair called on HaircutScript - haircut used or expired")
	BlockActivation(True, True)

	ObjectReference[] barbers = GetLinkedRefChildren(AssignedActorLinkKeyword) ; should be only 1
	int i = 0
	while i < barbers.Length
		Actor barber = barbers[i] as Actor 
		if barber
			; used to conditionalize dialogue
			barber.SetValue(BoughtHaircutAV, 0.0)
			barber.EvaluatePackage()
		endif
		i += 1
	endwhile
	UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
endFunction

;if I load again, reset the chair
Event OnLoad()
	ResetBarberChair()
	Parent.OnLoad()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If akActionRef == PlayerREF
		If PlayerREF.IsInCombat()
			;do nothing
		ElseIf PlayerREF.IsInPowerArmor()
			;do nothing
		ElseIf PlayerREF.GetSitState()!=0
			;do nothing
		Else
			;disable controls and force player into the chair
			BarberInputLayer = InputEnableLayer.Create()
			BarberInputLayer.DisablePlayerControls()
			Activate(PlayerREF, True)
		EndIf
	EndIf
	Parent.OnActivate(akActionRef)
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()

	If (akFurniture == self) && (akSender == PlayerREF)
		;set player face to neutral
		PlayerREF.ChangeAnimFaceArchetype(None)
		;allow player to get up out of the chair when the menu closes
		BlockActivation(False, False)
		Game.ShowRaceMenu(uimode = 2)
		UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	EndIf
EndEvent

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()

	If (akFurniture == self) && (akSender == PlayerREF)
		;reset barber chair
		ResetBarberChair()

		;enable controls
		BarberInputLayer.EnablePlayerControls()
		BarberInputLayer = None

		;make sure player face is back to Player archetype
		PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)
		UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
	EndIf
EndEvent