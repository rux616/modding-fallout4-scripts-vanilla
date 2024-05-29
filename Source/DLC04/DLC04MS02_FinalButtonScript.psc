Scriptname DLC04:DLC04MS02_FinalButtonScript extends ReferenceAlias

Scene Property MS02RideIsSpinning Auto Const Mandatory
Quest Property DLC04MS02 Auto Const Mandatory
ObjectReference Property DLC04UFOConsoleRef Auto Const Mandatory
Cell Property DLC04NWJunkyardUFO01 Auto Const Mandatory
Perk Property PowerArmorPerk Auto Const Mandatory

ObjectReference Property DLC04_DaraHubbellRef Auto Const Mandatory
ObjectReference Property DLC04_CLeansedRef Auto Const Mandatory
ObjectReference Property DLC04_MauriceTurnerRef Auto Const Mandatory
ObjectReference Property DLC04_TulaSpinneyRef Auto Const Mandatory
ObjectReference Property DLC04_PhilRollerRef Auto Const Mandatory
ObjectReference Property DLC04_RolandaHoopsRef Auto Const Mandatory
ObjectReference Property DLC04MS02UFOentryRef Auto Const Mandatory

Event OnLoad()
	if DLC04MS02.GetStage() != 905
		DLC04UFOConsoleRef.BlockActivation()
	endIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if DLC04MS02.GetStage() == 905 && akActionRef == game.GetPlayer() && game.GetPlayer().HasPerk(PowerArmorPerk) == false
		if DLC04_DaraHubbellRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_DaraHubbellRef as Actor).IsDead() == false
			DLC04_DaraHubbellRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		if DLC04_CleansedRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_CleansedRef as Actor).IsDead() == false
			DLC04_CleansedRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		if DLC04_PhilRollerRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_PhilRollerRef as Actor).IsDead() == false
			DLC04_PhilRollerRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		if DLC04_MauriceTurnerRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_MauriceTurnerRef as Actor).IsDead() == false
			DLC04_MauriceTurnerRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		if DLC04_RolandaHoopsRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_RolandaHoopsRef as Actor).IsDead() == false
			DLC04_RolandaHoopsRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		if DLC04_TulaSpinneyRef.GetParentCell() != game.GetPlayer().GetParentCell() && (DLC04_TulaSpinneyRef as Actor).IsDead() == false
			DLC04_TulaSpinneyRef.MoveTo(DLC04MS02UFOentryRef)
		endIf
		MS02RideIsSpinning.Start()
	endIf
EndEvent

Event OnExitFurniture(ObjectReference akActionRef)
	if akActionRef == game.GetPlayer()
		DLC04UFOConsoleRef.BlockActivation()
	endif
EndEvent
