Scriptname WellRestedScript extends ActiveMagicEffect

Message Property MyMessage Auto
String Property WellRestedSWFname Auto Const
Sound Property UIPerkWellRested Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MyMessage.Show()
	Game.ShowPerkVaultBoyOnHUD(WellRestedSwfName, UIPerkWellRested)
EndEvent
