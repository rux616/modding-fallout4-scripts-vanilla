Scriptname DLC04:DLC04OperatorParlorRifleScript extends ReferenceAlias

GlobalVariable Property DLC04OperatorPatrolRifleGlobal Auto Const Mandatory
{The global to set that negates the travel package, allowing the actor to go back to their patrol package.}

Int Property RifleTimer Auto Const Mandatory
{How many game hours until we set the global to 1 to swap to the travel package to play the rifle animation.}

Event OnLoad()
	StartRifleTimer()
EndEvent

Function StartRifleTimer()
	StartTimerGameTime(RifleTimer)
EndFunction

Event OnTimerGameTime(int aiTimerID)
	If GetActorRef().Is3DLoaded()
		; Roll to determine what to set the global value which will determine which rifle package to use.
		Int Roll = Utility.RandomInt(0, 1)
			If (Roll == 0)
				DLC04OperatorPatrolRifleGlobal.SetValue(1)
			Else
				DLC04OperatorPatrolRifleGlobal.SetValue(2)
			EndIf
		StartTimerGameTime(RifleTimer)
	EndIf
EndEvent

