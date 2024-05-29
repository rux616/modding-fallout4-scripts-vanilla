Scriptname SentryBotShoulderClusterScript extends ActiveMagicEffect Const
{Toggles the shoulder wep based on indoor/outdoor}

Weapon Property pSentryBotLeftShoulderClusterLauncher Auto Const

Weapon Property pSentryBotLeftShoulderClusterLauncherIndoors Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    ;swap for interior weapon if needed
    if akCaster.IsInInterior()
  		Debug.Trace(akCaster + " is inside!")
  		akCaster.unequipItem(pSentryBotLeftShoulderClusterLauncher)
  		akCaster.equipItem(pSentryBotLeftShoulderClusterLauncherIndoors)
  	else
  		Debug.Trace(akCaster + " is outside!")
	endIf
EndEvent
