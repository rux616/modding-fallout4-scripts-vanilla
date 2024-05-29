Scriptname DLC04:InstallNonPlayableModOnEquip extends ObjectReference

ObjectMod Property DLC04_mod_SetNonPlayable Auto Const Mandatory
bool Equipped
bool ModAttached
Event OnEquipped(Actor akActor)
	Debug.Trace("EQUIPPING")
	if !Equipped
		Debug.Trace("ATTACHING MOD")
		AttachMod(DLC04_mod_SetNonPlayable)
		Equipped = true
	elseif !ModAttached
		Debug.Trace("MOD ATTACHED")
		ModAttached = true
	endif
EndEvent

Event OnUnequipped(Actor akActor)
	Debug.Trace("UNEQUIPPING")
	if Equipped && ModAttached
		Debug.Trace("REMOVING MOD")
		RemoveMod(DLC04_mod_SetNonPlayable)
		Equipped= false
		ModAttached = false
		Game.GetPlayer().additem(self, 1, true)
	endif
EndEvent
