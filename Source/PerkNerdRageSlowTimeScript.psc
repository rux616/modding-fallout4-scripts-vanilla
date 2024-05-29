Scriptname PerkNerdRageSlowTimeScript extends ActiveMagicEffect

Hardcore:HC_ManagerScript Property HC_Manager Auto Const Mandatory
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster)

	;#93600 Nerd Rage activates after sleeping with less than 20% health
	if HC_Manager.IsProcessingSleep()
		HC_Manager.trace(self, "OnEffectStart() BAILING OUT because IsProcessingSleep()")
		RETURN
	endif

	game.ShowPerkVaultBoyOnHUD(NerdRageSwfName, UIPerkNerdRage)
	Game.IncrementStat("Fits of Rage")
	If SlowTime != None
		SlowTime.Cast(akCaster)
	Endif

	Game.GetPlayer().SayCustom(PlayerNerdRageDialogue)

	; This effect can stop/start when going into VATS, so make sure to stop the fade in/out imods if they're present
	FadeOutImod.Remove()
	FadeInImod.popto(FadeInImod)
	;utility.wait(0.35)
	ImodEffect.ApplyCrossFade(1.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;FadeOutImod.popto()	
	ImodEffect.Remove()

	; PopTo itself to kill previous instances if the effect was stopped/started
	FadeOutImod.popto(FadeOutImod)
EndEvent

Event OnKill(Actor akVictim)
	If game.GetPlayer().HasMagicEffect(SlowTimeEffect) == true && game.GetPlayer().HasPerk(NerdRage03) == true
		Game.GetPlayer().RestoreValue(Health, HealAmount)
	Endif
EndEvent

SPELL Property SlowTime Auto Const

MagicEffect Property SlowTimeEffect Auto Const

Float Property HealAmount Auto Const

ActorValue Property Health Auto Const

Perk Property NerdRage03 Auto Const

ImageSpaceModifier Property FadeInImod Auto Const

ImageSpaceModifier Property ImodEffect Auto Const

ImageSpaceModifier Property FadeOutImod Auto Const

String Property NerdRageSwfName Auto Const

Sound Property UIPerkNerdRage Auto Const Mandatory

Keyword Property PlayerNerdRageDialogue Auto Const Mandatory