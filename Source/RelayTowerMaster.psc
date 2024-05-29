Scriptname RelayTowerMaster extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto
{Link pointing to Switch}
Keyword Property LinkCustom02 const auto
{Link pointing to Tower}
Keyword Property LinkCustom03 const auto
{Link pointing to Transmitter}
Keyword Property LinkCustom04 const auto
{Link pointing to Receiver}


ObjectReference Tower
ObjectReference Switch
ObjectReference Transmitter
ObjectReference Receiver

bool TowerRaised


Event OnLoad()
    Switch = GetLinkedRef(LinkCustom01)
    Tower = GetLinkedRef(LinkCustom02)
    Transmitter = GetLinkedRef(LinkCustom03)
    Receiver = GetLinkedRef(LinkCustom04)

    RegisterForRemoteEvent(Switch, "OnActivate")
	RegisterForRemoteEvent(Receiver, "OnActivate")
EndEvent


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)

	if akSender == Switch	;if switch is turned on
		Tower.PlayAnimationAndWait("Play01", "Done")	;raise the tower
		TowerRaised = true
		if Receiver.IsRadioOn()	;if radio is on
			Transmitter.EnableNoWait()	;enable the transmitter
		endif
	endif

	if akSender == Receiver	;if radio is activated
		utility.wait(1)
		if TowerRaised && Receiver.IsRadioOn()	;if tower is raised and the radio is on
			Transmitter.EnableNoWait()	;enable transmitter
		elseif TowerRaised && !Receiver.IsRadioOn()	;if tower is raised and radio is off
			Transmitter.DisableNoWait()	;disable transmitter
		endif
	endif

EndEvent
