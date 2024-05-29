Scriptname BloodyMessNearbyScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if utility.RandomFloat() <= ChanceDismember && aktarget.IsEssential() == false && akTarget != game.GetPlayer() && akTarget.IsDead() == false && akTarget.IsHostileToActor(game.GetPlayer()) == true
		akTarget.Dismember( "Torso", true, true, true )
		akTarget.Kill()
	endif
EndEvent

Float Property ChanceDismember Auto Const
