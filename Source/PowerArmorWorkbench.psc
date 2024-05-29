Scriptname PowerArmorWorkbench extends ObjectReference
{Script on the power armor workbench}

Keyword Property powerArmorFurnitureKW Auto
Keyword Property workbenchAnimKeyword Auto
Keyword Property workbenchKeyword Auto
Keyword Property ignoreWorkbenchDataKeyword Auto
Keyword Property powerArmorKW Auto
Keyword Property LinkedWorkbenchContainerKeyword Auto
Keyword Property AnimFurnWorkbenchPowerArmor Auto
Message Property WorkbenchPowerArmorNoArmorMSG Auto
Message Property WorkbenchPowerArmorRecallArmorMSG Auto
Message Property cantUseInArmorMSG Auto
Quest Property Tutorial Auto Const

ObjectReference powerArmorWorkingOn
ReferenceAlias lastusedPowerArmor
Actor activatingActor

int ActivateLock = 0
int EnterFailsafeTimer = 13
float EnterFailsafeTimeout = 8.0

bool ExitingPowerArmor = false
int ExitingPowerArmorTimer = 14 Const
float ExitingPowerArmorTime = 3.0 Const

ReferenceAlias Property PlayerAlias Auto

Event OnInit()
	BlockActivation()
endEvent

Event OnLoad()
	;Check for nearby power armors
	debug.trace( Self + " checking for nearby power armor suits..." )
	ObjectReference[] nearbyPowerArmors = FindAllReferencesWithKeyword(powerArmorFurnitureKW, 60.0)

	debug.trace( "Found " + nearbyPowerArmors.Length + " nearby unoccupied power armors" )
	If nearbyPowerArmors.Length > 0
		ObjectReference nearestPowerArmor
		float fnearestDistance = 9999.0
		int i = 0
		while (i < nearbyPowerArmors.Length)
			float fcurrentDistance = GetDistance(nearbyPowerArmors[i])
			if( fcurrentDistance < fnearestDistance )
				nearestPowerArmor = nearbyPowerArmors[i]
				fnearestDistance = fcurrentDistance
			endIf
			i = i + 1
		endWhile
		
		debug.trace("Found nearest power armor " + nearestPowerArmor + " teleporting it to workbench")
		; teleport it to us
		nearestPowerArmor.MoveTo(Self)
		; Add keyword to allow NPC sandbox animations
		Self.AddKeyword(AnimFurnWorkbenchPowerArmor)
	Else
		Self.RemoveKeyword(AnimFurnWorkbenchPowerArmor)
	endif
endEvent

auto STATE Inactive
	Event OnActivate( ObjectReference akActionRef )
		if( ActivateLock == 0 && Game.GetPlayer() == akActionRef )
			ActivateLock = 1
		
			debug.trace("Power Armor workbench got activate while inactive")
			activatingActor = akActionRef as Actor
			If ( !ExitingPowerArmor )
				If !activatingActor.WornHasKeyword( powerArmorKW )
					; find nearest suit of power armor
					ObjectReference[] nearbyPowerArmors = FindAllReferencesWithKeyword(powerArmorFurnitureKW, 500.0)
					;lastusedPowerArmor = (PlayerAlias as AliasPowerArmorRecallScript).GetPowerArmorLastUsed()

					debug.trace( "Found " + nearbyPowerArmors.Length + " nearby unoccupied power armors" )
					
					ObjectReference nearestPowerArmor
					If nearbyPowerArmors.Length > 0
						float fnearestDistance = 999999999999.9
						int i = 0
						while (i < nearbyPowerArmors.Length)
							float fcurrentDistance = GetDistance(nearbyPowerArmors[i])
							if( fcurrentDistance < fnearestDistance && nearbyPowerArmors[i].IsEnabled() )
								nearestPowerArmor = nearbyPowerArmors[i]
								fnearestDistance = fcurrentDistance
							endIf
							i = i + 1
						endWhile
						
						if( nearestPowerArmor )
							debug.trace("Found nearest power armor " + nearestPowerArmor + " teleporting it to workbench")
							; teleport it to us
							nearestPowerArmor.MoveTo(Self)
													
							; switch keywords out
							; i don't think we can remove keywords that are on the base form. this is unfortunate. but maybe it won't matter?
							nearestPowerArmor.AddKeyword( workbenchAnimKeyword )
							nearestPowerArmor.AddKeyword( workbenchKeyword )
							;this will prevent the normal power armor entry from occuring
							nearestPowerArmor.RemoveKeyword( powerArmorFurnitureKW )
							nearestPowerArmor.RemoveKeyword( ignoreWorkbenchDataKeyword )
							
							; slave the workbench so it also gets the anim events sent to the power armor furniture
							activatingActor.AddDependentAnimatedObjectReference( Self )
							
							; set the hoist as the container for the workbench
							nearestPowerArmor.SetLinkedRef( Self, LinkedWorkbenchContainerKeyword )
							
							; make the player activate it
							nearestPowerArmor.Activate( akActionRef )
							powerArmorWorkingOn = nearestPowerArmor
							
							if( activatingActor )
								RegisterForRemoteEvent( activatingActor, "OnSit" )
								; in case the user fails to ever enter the working animation on the power armor
								StartTimer( EnterFailsafeTimeout, EnterFailsafeTimer )
							endIf
							gotoState("Entering")
						endIf
					EndIf
					
					if( nearestPowerArmor == None )
						;If lastusedPowerArmor.GetReference() != None
						;	RecallPowerArmor()
						;Else
						;If player activates PA workbench without PA, throw tutorial message
						if (Tutorial as TutorialScript).bPABenchFindMessageActive == 0
							Tutorial.SetStage(1760)
						endif
						;EndIf
					EndIf
				Else
					;If player activates PA workbench while in PA, throw tutorial message
					if (Tutorial as TutorialScript).bPABenchExitMessageActive == 0
						Tutorial.SetStage(1770)
					endif
					debug.trace("workbench forcing " + activatingActor + " out of power armor")
					ExitingPowerArmor = true
					StartTimer( ExitingPowerArmorTime, ExitingPowerArmorTimer )
					activatingActor.SwitchToPowerArmor(None)
				EndIf
			Else
				debug.trace("workbench " + Self + " refused activation by " + activatingActor + " because we expect them to be exiting power armor")
			EndIf
			
			ActivateLock = 0
		ElseIf( Game.GetPlayer() == akActionRef )
			debug.trace("power armor workbench " + Self + " prevented an activation because another was already in process" )
		EndIf
	EndEvent
	
	Event OnTimer( int aiTimerID )
		if( aiTimerID == ExitingPowerArmorTimer )
			ExitingPowerArmor = false
		endIf
	EndEvent
EndState

STATE Entering
	Event OnTimer( int aiTimerID )
		if( aiTimerID == EnterFailsafeTimer )
			gotoState( "Inactive" )
			debug.trace( activatingActor + " FAILED to enter working animation on " + powerArmorWorkingOn + " undoing workbench stuff" )
			UnregisterForRemoteEvent( activatingActor, "OnSit" )
			UndoWorkbenchStuff()
		endIf
	EndEvent

	Event Actor.OnSit( Actor akSender, ObjectReference akActionRef )
		if( akSender == activatingActor )
			gotoState( "InUse" )
			CancelTimer( EnterFailsafeTimer )
			debug.trace( akSender + " has entered working animation on " + powerArmorWorkingOn + " killing enter fail timer" )
			UnregisterForRemoteEvent( activatingActor, "OnSit" )
			RegisterForRemoteEvent( activatingActor, "OnGetUp" )
		endIf
	EndEvent
	
	Event OnActivate( ObjectReference akActionRef )
		debug.trace("Power Armor workbench " + powerArmorWorkingOn + " got activate while Entering; Ignoring")
	EndEvent
EndState

STATE InUse
	Event OnActivate( ObjectReference akActionRef )
		debug.trace("Power Armor workbench " + powerArmorWorkingOn + " got activate while ACTIVE; THIS IS NOT SUPPOSED TO HAPPEN")
	EndEvent
EndState

Event Actor.OnSit( Actor akSender, ObjectReference akActionRef )
	debug.trace("Power Armor Workbench " + powerArmorWorkingOn + " got sit while not entering; THIS IS NOT SUPPOSED TO HAPPEN")
EndEvent

Event Actor.OnGetUp( Actor akSender, ObjectReference akActionRef )
	if( akSender == activatingActor )
		gotoState( "Inactive" )
		debug.trace("leaving Power Armor workbench " + powerArmorWorkingOn)
		UnregisterForRemoteEvent( activatingActor, "OnGetUp" )
		UndoWorkbenchStuff()
	endIf
EndEvent

Function RecallPowerArmor()
	; Move the last used power armor to the bench
	WorkbenchPowerArmorRecallArmorMSG.Show()
	Game.FadeOutGame(True, True, 0.0, 1.0, True)
	Utility.Wait(2.0)
	lastusedPowerArmor.TryToMoveTo(Self)
	Game.FadeOutGame(False, True, 0.0, 1.0)
	Utility.Wait(1.0)
EndFunction

Function UndoWorkbenchStuff()
	;remove all dynamic keywords
	if( powerArmorWorkingOn )
		powerArmorWorkingOn.RemoveKeyword( workbenchAnimKeyword )
		powerArmorWorkingOn.RemoveKeyword( workbenchKeyword )
		powerArmorWorkingOn.AddKeyword( powerArmorFurnitureKW )
		powerArmorWorkingOn.AddKeyword( ignoreWorkbenchDataKeyword )
		activatingActor.RemoveDependentAnimatedObjectReference( powerArmorWorkingOn )
		powerArmorWorkingOn.SetLinkedRef( None, LinkedWorkbenchContainerKeyword )
		activatingActor = None
	endIf
EndFunction