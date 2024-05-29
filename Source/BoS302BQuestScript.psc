Scriptname BoS302BQuestScript extends Quest

ActorBase Property Desdemona Auto Const
ActorBase Property Glory Auto Const
ActorBase Property DoctorCarrington Auto Const
ActorBase Property CompanionDeacon Auto Const
ActorBase Property TinkerTom Auto Const
ActorBase Property PAM Auto Const
GlobalVariable Property BoS302BBossKills Auto Const
GlobalVariable Property BoS302BDesDead Auto Const
GlobalVariable Property BoS302BGloryDead Auto Const
GlobalVariable Property BoS302BDeaconDead Auto Const
GlobalVariable Property BoS302BTomDead Auto Const
GlobalVariable Property BoS302BCarDead Auto Const
GlobalVariable Property BoS302BPAMDead Auto Const
ReferenceAlias Property Alias_Desdemona Auto Const
ReferenceAlias Property Alias_Glory Auto Const
ReferenceAlias Property Alias_Deacon Auto Const
ReferenceAlias Property Alias_Carrington Auto Const
ReferenceAlias Property Alias_TinkerTom Auto Const
ReferenceAlias Property Alias_PAM Auto Const
ObjectReference Property BoS302BCarringtonMarker Auto Const
ObjectReference Property BoS302BDeaconMarker Auto Const
ObjectReference Property BoS302BDesdemonaMarker Auto Const
ObjectReference Property BoS302BGloryMarker Auto Const
ObjectReference Property BoS302BTinkerTomMarker Auto Const
ObjectReference Property BoS302BPAMMarker Auto Const

Function DeathCheck()

	if Desdemona.GetDeadCount() == 1
		BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() + 1)
		BoS302BDesDead.SetValue(1)
	endif

	if Glory.GetDeadCount() == 1
		BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() + 1)
		BoS302BGloryDead.SetValue(1)
	endif

	if DoctorCarrington.GetDeadCount() == 1
		BoS302BCarDead.SetValue(1)
	endif

	if CompanionDeacon.GetDeadCount() == 1
		BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() + 1)
		BoS302BDeaconDead.SetValue(1)
	endif

	if TinkerTom.GetDeadCount() == 1
		BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() + 1)
		BoS302BTomDead.SetValue(1)
	endif

	if PAM.GetDeadCount() == 1
		BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() + 1)
		BoS302BPAMDead.SetValue(1)
	endif

endFunction

Function MoveCheck()

	if BoS302BDesDead.GetValue() == 0
		Alias_Desdemona.GetActorRef().MoveTo(BoS302BDesdemonaMarker)
	endif

	if BoS302BDeaconDead.GetValue() == 0
		Alias_Deacon.GetActorRef().MoveTo(BoS302BDeaconMarker)
	endif

	if BoS302BGloryDead.GetValue() == 0
		Alias_Glory.GetActorRef().MoveTo(BoS302BGloryMarker)
	endif

	if BoS302BTomDead.GetValue() == 0
		Alias_TinkerTom.GetActorRef().MoveTo(BoS302BTinkerTomMarker)
	endif

	if BoS302BCarDead.GetValue() == 0
		Alias_Carrington.GetActorRef().MoveTo(BoS302BCarringtonMarker)
	endif

	if BoS302BPAMDead.GetValue() == 0
		Alias_PAM.GetActorRef().MoveTo(BoS302BPAMMarker)
	endif

endFunction