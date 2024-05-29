Scriptname DLC03:DLC03_PerkArcadia_Script extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If Utility.RandomFloat() < ChanceBonus
		;game.ShowPerkVaultBoyOnHUD(ArcadiaSwfName, UIPerkArcadia)
		ArcadiaSpell.Cast(akCaster, akCaster)
		;Game.GetPlayer().SayCustom(PlayerArcadiaDialogue)
	Endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.DispelSpell(ArcadiaSpell)
EndEvent


SPELL Property ArcadiaSpell Auto Const

String Property ArcadiaSwfName Auto Const

Sound Property UIPerkArcadia Auto Const

Keyword Property PlayerArcadiaDialogue Auto Const

Float Property ChanceBonus = 0.2 Auto Const