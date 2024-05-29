Scriptname DN136_AliasDeathCounter extends ReferenceAlias
{Script used to track how many times the player has killed the alias.}

GlobalVariable Property myGlobal Auto Mandatory
Quest Property myQuest Auto Const Mandatory
Int Property myStage Auto Const Mandatory

Event OnDying(Actor akKiller)
	if(akKiller == game.getPlayer())
		;set a global value
		myGlobal.setValueInt(myGlobal.getValueInt() + 1)
		if(myGlobal.getValueInt() > 5)
			myQuest.setStage(myStage)
		endif
	endif
EndEvent