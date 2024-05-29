Scriptname TestRaceChangeStoolScript extends ObjectReference
{A script to change race on the activator to one of several races}

Race Property DeathclawRace Auto Const

Race Property MirelurkRace Auto Const

Race Property SuperMutantRace Auto Const

Race Property HumanRace Auto Const

int iLoopVar

Event OnInit()
	debug.trace( "TestRaceStool init" )
	Self.BlockActivation()
	
	iLoopVar = 0
EndEvent

Event OnActivate( ObjectReference akActionRef )
	Actor activatingActor = akActionRef as Actor
	activatingActor.UnequipAll()
	if( iLoopVar == 0 )
		activatingActor.SetRace( DeathclawRace )
	ElseIf( iLoopVar == 1 )
		activatingActor.SetRace( MirelurkRace )
	ElseIf( iLoopVar == 2 )
		activatingActor.SetRace( SuperMutantRace )
	ElseIf( iLoopVar == 3 )
		activatingActor.SetRace( HumanRace )
		iLoopVar = -1
	EndIf
	
	iLoopVar = iLoopVar + 1
EndEvent