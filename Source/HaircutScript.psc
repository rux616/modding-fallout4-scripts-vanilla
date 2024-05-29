Scriptname HaircutScript extends Actor  Conditional
{script for anyone who does haircuts}

ObjectReference Property BarberChair  Auto Const
{BarberChair to sit in for the haircut. Be sure to flag HasBarber on the FaceGenBarberHairScript on the Chair!}

GlobalVariable Property HaircutCost Auto Const
{Global value for how much the haircut costs}

ActorValue Property BoughtHaircutAV auto Const
{Used to Condition dialogue}

Keyword Property AnimFaceArchetypePlayer Auto Const
{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

InputEnableLayer Property BarberInputLayer Auto Hidden

; purchase haircut
function BoughtHaircut()
	Actor PlayerREF = Game.GetPlayer()
	debug.trace(self + " BoughtHaircut called on HaircutScript - barber chair is available")
	BarberChair.BlockActivation(True, False)
	PlayerREF.RemoveItem(Game.GetCaps(), HaircutCost.GetValueInt())
	; used to conditionalize barber dialogue
	SetValue(BoughtHaircutAV, 1.0)
	Self.EvaluatePackage()
	RegisterForRemoteEvent(PlayerREF, "OnSit")
	RegisterForRemoteEvent(PlayerREF, "OnGetUp")
	RegisterForRemoteEvent(BarberChair, "OnActivate")
endFunction

;reset everything
function ResetBarberChair()
	Actor PlayerREF = Game.GetPlayer()
 	debug.trace(self + " ResetBarberChair called on HaircutScript - haircut used or expired")
	BarberChair.BlockActivation(True, True)

	; used to conditionalize dialogue
	SetValue(BoughtHaircutAV, 0.0)
	Self.EvaluatePackage()
	UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
	UnRegisterForRemoteEvent(BarberChair, "OnActivate")
endFunction

;if I load again, reset the chair
Event OnLoad()
	ResetBarberChair()
EndEvent

; if I die, reset the chair
Event OnDeath(Actor akKiller)
	ResetBarberChair()
endEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
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
			akSender.Activate(PlayerREF, True)
		EndIf
	EndIf
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	If (akFurniture == BarberChair) && (akSender == PlayerREF)
		;set player face to neutral
		PlayerREF.ChangeAnimFaceArchetype(None)
		;allow player to get up out of the chair when the menu closes
		BarberChair.BlockActivation(False, False)
		Game.ShowRaceMenu(uimode = 2)
		UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	EndIf
EndEvent

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	If (akFurniture == BarberChair) && (akSender == PlayerREF)
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