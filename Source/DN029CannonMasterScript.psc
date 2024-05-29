Scriptname DN029CannonMasterScript extends ObjectReference Hidden


Weapon Property WeaponToFire Auto Const

Sound Property FiringSound Auto Const

Sound Property ChargeSound Auto Const
Sound Property FullChargeSound Auto Const

Ammo Property AmmoToFire Auto Const

Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const

Quest Property DN029FirstWave Auto Const
Quest Property DN029SecondWaveA Auto Const
Quest Property MS11 Auto Const
Scene Property MS11_Cannons_Ready Auto Const

Explosion Property CannonFireExplosion Auto Const

ObjectReference ChargeIndicator
ObjectReference CannonSwitch
Int NumberOfCannons


Event OnInit()
    CannonSwitch = GetLinkedRef(LinkCustom01)
    ChargeIndicator = GetLinkedRef(LinkCustom02)
EndEvent


Event OnLoad()
	NumberOfCannons = CountLinkedRefChain()
	ChargeIndicator.PlayAnimation("Stage2")
    RegisterForRemoteEvent(CannonSwitch, "OnActivate")
EndEvent


Function FireCannons()
	ChargeIndicator.PlayAnimation("Reset")

	int LinkCount = 1
	While LinkCount <= NumberOfCannons
		WeaponToFire.Fire(GetNthLinkedRef(LinkCount), AmmoToFire)
		debug.trace(self + " " + LinkCount + " Fired from " + GetNthLinkedRef(LinkCount))
		GetNthLinkedRef(LinkCount).PlaceAtMe(CannonFireExplosion, 1)
		debug.trace(self + " " + LinkCount + " Placed Explosion at " + GetNthLinkedRef(LinkCount))
		int instanceID = FiringSound.play(GetNthLinkedRef(LinkCount))  
		debug.trace(self + " " + LinkCount + " Played Firing Sound at " + GetNthLinkedRef(LinkCount))
		Sound.SetInstanceVolume(instanceID, 1)
		debug.trace(self + " " + LinkCount + " Set Volume " + GetNthLinkedRef(LinkCount))
		LinkCount = LinkCount + 1
		debug.trace(self + " " + LinkCount + " Increased Count " + GetNthLinkedRef(LinkCount))
		utility.Wait(utility.RandomFloat(0.05, 0.2))
		debug.trace(self + " " + LinkCount + " Waiting a random number of seconds " + GetNthLinkedRef(LinkCount))
	EndWhile

	int MaxCharge = 10
	int CurrentCharge
	float WaitTime = 5
	While CurrentCharge <= MaxCharge
		utility.Wait(WaitTime)
		WaitTime = WaitTime - 0.5
		int instanceID = ChargeSound.play(GetLinkedRef(LinkCustom02))  
		Sound.SetInstanceVolume(instanceID, 1)
		CurrentCharge = CurrentCharge + 1
		;debug.Notification(CurrentCharge + "/" + MaxCharge + " Charges.")
	EndWhile		

	int instanceID = FullChargeSound.play(GetLinkedRef(LinkCustom02))  
	Sound.SetInstanceVolume(instanceID, 1)

	if DN029FirstWave.GetStageDone(0) && !DN029FirstWave.GetStageDone(500)
		;MS11_Cannons_Ready.Start()
		MS11.SetObjectiveCompleted(173)
	endif

	if DN029SecondWaveA.GetStageDone(0) && !DN029SecondWaveA.GetStageDone(500)
		MS11_Cannons_Ready.Start()
	endif

	ChargeIndicator.PlayAnimation("Stage2")
	GoToState("ReadyToFire")
EndFunction



auto STATE ReadyToFire
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		if akSender == CannonSwitch
			GoToState("Recharging")
			if DN029FirstWave.GetStageDone(0) && !DN029FirstWave.GetStageDone(500)
				;MS11_Cannons_Ready.Start()
				MS11.SetObjectiveCompleted(173)
			endif
			FireCannons()
		endif
	EndEvent
EndSTATE


STATE Recharging
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		; Do Nothing
	EndEvent
EndSTATE


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	; Do Nothing
EndEvent

