Scriptname DN131_SwansLogScript extends ObjectReference Hidden Const
{Script on note DN131_SwanLog04. Sets a player knowledge global later referenced by other quests (BoSM04, etc.).}

GlobalVariable property PlayerKnowsSwanBackstory Auto Const Mandatory
{The Swan Backstory global.}

Event OnRead()
	PlayerKnowsSwanBackstory.SetValue(1)
EndEvent