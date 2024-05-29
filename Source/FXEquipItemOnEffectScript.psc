Scriptname FXEquipItemOnEffectScript extends ActiveMagicEffect
{This script will add equip and item on the target actor.}

Armor Property ArmorToEquip Auto Const

keyword property SynthKeyword Auto Const
keyword property ArmorTypePower Auto Const

Bool Property bRemoveWhenFinished = False Auto Const
{Should the item be removed when the effect wears off?}
bool property preferLimbOnlyEffect = FALSE auto Const


Event OnInit()
	if preferLimbOnlyEffect
		if (GetTargetActor().IsDismembered( ))
			GotoState("LimbOnlyState")
		endif
	endif
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if ((akTarget.HasKeyword(SynthKeyword) == false) && (akTarget.WornHasKeyword(ArmorTypePower) == False))
		akTarget.EquipItem(ArmorToEquip)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if bRemoveWhenFinished
		akTarget.RemoveItem(ArmorToEquip)
	endif
EndEvent


State LimbOnlyState

	Event OnEffectStart(Actor akTarget, Actor akCaster)
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
	EndEvent
	
EndState