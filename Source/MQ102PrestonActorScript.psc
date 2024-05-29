Scriptname MQ102PrestonActorScript extends Actor

;script to handle Preston needing to have his Musket equipped over any other weapon
;need to have this script on the actor form since we need to have Preston equip weapons normally again, but only AFTER MQ102 is done

Quest Property MQ102 Auto const
Weapon Property CompPrestonLaserMusket Auto const

Auto State MQ102State

	Event OnLoad()
		If MQ102.GetStageDone(200) == 0
			;preston must keep the musket equipped until we tell him otherwise
			Self.EquipItem(CompPrestonLaserMusket, abPreventRemoval=True)
		Else
			;preston can now equip anything
			gotostate("hasbeentriggered")
			Self.EquipItem(CompPrestonLaserMusket, abPreventRemoval=False)
		EndIf
	EndEvent

EndState

State hasbeentriggered
	;empty state
EndState