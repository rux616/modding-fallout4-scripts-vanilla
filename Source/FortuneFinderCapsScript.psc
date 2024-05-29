Scriptname FortuneFinderCapsScript extends ActiveMagicEffect

Explosion Property PerkExplosionMoneyShotFortuneFinder Auto Const
String Property SwfName Auto Const

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.IsDead() == true
		akTarget.PlaceAtMe(PerkExplosionMoneyShotFortuneFinder)
		game.ShowPerkVaultBoyOnHUD(SwfName)
		Game.IncrementStat("Money Shots")
	endif
EndEvent
