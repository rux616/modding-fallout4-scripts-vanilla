Scriptname DLC04:DLC04ThirstZapperRefillScript extends ObjectReference Const


Ammo Property DLC04_Ammo_ThirstZapper_Water Auto Const Mandatory
int Property MaxAmmoCount = 999 Auto Const

Event OnEquipped(Actor akActor)
    Actor PlayerActor = game.GetPlayer()
    if akActor == PlayerActor
    	RefillAmmo(PlayerActor)
    Endif
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    Actor PlayerActor = game.GetPlayer()
    if akNewContainer == PlayerActor
    	RefillAmmo(PlayerActor)
    Endif
EndEvent

Function RefillAmmo(actor PlayerActor)
	int AmmoCount = PlayerActor.GetItemCount(DLC04_Ammo_ThirstZapper_Water)
	if AmmoCount < MaxAmmoCount
		int AmmoToAdd = MaxAmmoCount - AmmoCount
		PlayerActor.AddItem(DLC04_Ammo_ThirstZapper_Water, AmmoToAdd, abSilent = true)
	endif
EndFunction