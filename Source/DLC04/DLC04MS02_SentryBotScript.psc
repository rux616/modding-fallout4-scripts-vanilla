Scriptname DLC04:DLC04MS02_SentryBotScript extends ReferenceAlias

Quest Property DLC04MS02 Auto Const Mandatory

Event OnDeath(Actor akKiller)
	DLC04MS02.SetStage(65)
EndEvent