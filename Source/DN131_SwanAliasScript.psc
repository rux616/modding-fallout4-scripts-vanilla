ScriptName DN131_SwanAliasScript extends ReferenceAlias Hidden
{Script for Swan's alias on DN131. Controls his approach and triggers his ambush animation.}

Quest property DN131 Auto Const Mandatory
{DN131}

RR101TourBotManagerScript property RR101TourBotManager Auto Const Mandatory
{The manager script for the R101 Tourbot.}

int property CombatRange = 675 Auto Const Hidden
{If the player is this distance from Swan or less, Swan's ambush triggers.}

int property TurnRotationSpeed = 8 Auto Const Hidden
{Rotation speed used when translating Swan while the player is not in the pond.}

ObjectReference property DN131_SwanRotationHeadingMarker Auto Const
{Marker that Swan translates to.}

Faction property PlayerFaction Auto Const
{Player's faction.}


Actor Swan 						;The actor in this alias.
Actor player 						;The player.

bool hitTriggered					;Has Swan been hit by an attack from the player? If so, trigger the ambush.
bool translationFinishedTriggered		;Is the player within the OuterCombatRadius, and Swan's translation has finished?
bool boathouseEnteredTriggered		;Has the player entered the boathouse? If so, trigger the ambush.
bool ambushTriggered				;Has the player triggered the ambush?

float resetTimer = 0.0				;Timer used to track the delay before resetting Swan.			
int resetDelay = 5 					;Number of seconds before we reset swan.


Event OnAliasInit()
	;If we haven't initialized yet, do so now.
	if (Swan == None)
		Swan = Self.GetActorRef()
		player = Game.GetPlayer()
		;Enable Swan (he starts disabled).
		Swan.EnableNoWait()
		;Set Swan Restrained.
		;Swan.SetRestrained(True)
		;Register for a hit event.
		Self.RegisterForHitEvent(Self, PlayerFaction)
	EndIf
	;If Swan is already loaded (which is probably the case), start his translation timer.
	if (Swan.GetSitState() == 3)
		;Debug.Trace("SWAN: Timer started by OnAliasInit + " + Swan.GetSitState())
		StartTimer(1, 1)
	EndIf
EndEvent

Event OnSit(ObjectReference akFurniture)
	;Debug.Trace("SWAN: Timer started by OnSit " + Swan.GetSitState())
	StartTimer(1, 1)
EndEvent

Event OnLoad()
	if (Swan.GetSitState() == 3)
		;Debug.Trace("SWAN: Timer started by OnLoad " + Swan.GetSitState())
		StartTimer(1, 1)
	EndIf
EndEvent

Event OnUnload()
	CancelTimer(1)
	CancelTimer(2)
	ResetSwan()
EndEvent

;Handles Swan's translation events, and triggers his ambush when appropriate.
Event OnTimer(int timerID)
	if (timerID == 1)
		;Debug.Trace("SWAN: Timer ping.")
		if (Swan.Is3DLoaded() && !Swan.IsDead())
			if (!ambushTriggered)
				;Are we ready to trigger the ambush?
				;Debug.Trace("SWAN: Checking for Swan ambush: " + hitTriggered + ", " + boathouseEnteredTriggered + ", " + Swan.GetDistance(player))
				if (hitTriggered || boathouseEnteredTriggered || (Swan.GetDistance(player) < CombatRange) || ((Swan.GetSitState() != 2) && (Swan.GetSitState() != 3)))
					;Debug.Trace("SWAN: Triggering ambush.")
					;Player has triggered the ambush.
					ambushTriggered = True
					;Force the Tourbot to sleep, since Swan is active.
			    		RR101TourBotManager.ForceTourbotToSleep()
					;Stop Swan's translation.
					Swan.StopTranslation()
					;Set Swan Restrained.
					;Swan.SetRestrained(False)
					;Activate Swan to trigger the ambush animation.
					Swan.Activate(Swan)
					;Start a timer to force Swan into combat.
					StartTimer(3, 2)
			    	ElseIf (!player.HasDetectionLoS(Swan))
			    		;Debug.Trace("SWAN: Snap-Rotate")
			    		;Player is not close enough to trigger the ambush and does not have LoS to Swan. Snap Swan to face them.
			    		TranslateSwan(player, 10000)
			    		;Check again in 0.5s.
			    		StartTimer(0.5, 1)
			    	ElseIf (player.GetDistance(Swan) > 3000)
			    		;Debug.Trace("SWAN: Rotate")
			    		;Player is not facing Swan, but is still a distance away. Rotate Swan to face them.
			    		TranslateSwan(player, TurnRotationSpeed)
			    		;Check again in 0.5s.
			    		StartTimer(0.5, 1)
			    	Else
			    		;Debug.Trace("SWAN: Holding")
			    		;Check again in 0.5s.
			    		StartTimer(0.5, 1)
			    	EndIf
		    Else
		    		if ((player.GetDistance(Swan) > 3000) && !player.HasDetectionLoS(Swan) && !Swan.HasDetectionLoS(player))
		    			if (resetTimer == 0.0)
		    				resetTimer = Utility.GetCurrentRealTime()
		    				StartTimer(1, 1)
		    			ElseIf ((Utility.GetCurrentRealTime() - resetTimer) > resetDelay)
		    				;Debug.Trace("Resetting Swan")
		    				ResetSwan()
		    			Else
		    				StartTimer(1, 1)
		    			EndIf
		    		Else
		    			;Debug.Trace("Player in Combat with Swan")	
		    			resetTimer = 0.0
		    			StartTimer(1, 1)
		    		EndIf
		    EndIf
		EndIf
	ElseIf (timerID == 2)
		;Push Swan into combat with the player.
		Swan.SetValue(Game.GetAggressionAV(), 2)
		Swan.StartCombat(player)
		Swan.EvaluatePackage()
		;Reset the main timer, now watching for whether we need to reset Swan.
		StartTimer(3, 1)
	EndIf
EndEvent

;Swan now uses rotational translation only.
Function TranslateSwan(ObjectReference target, int rotationSpeed)
	DN131_SwanRotationHeadingMarker.SetAngle(0, 0, player.GetAngleZ() + 180)
	;Debug.Trace("Swan: Set heading marker " + DN131_SwanRotationHeadingMarker + " to " + DN131_SwanRotationHeadingMarker.GetAngleZ())
	;Debug.Trace("Swan LOS: " +  player.HasDetectionLoS(Swan) + ", " + player.HasDirectLoS(Swan))
	if (!player.HasDetectionLoS(Swan))
		Swan.SplineTranslateToRef(DN131_SwanRotationHeadingMarker, 0.2, 0, 10000)
	Else
		Swan.SplineTranslateToRef(DN131_SwanRotationHeadingMarker, 0.2, 0, TurnRotationSpeed)
	EndIf
EndFunction

;When the area unloads, the pond trigger calls this function to reset the ambush.
Function ResetSwan()
	if (!Swan.IsDead())
		;Debug.Trace("SWAN: Resetting Swan.")

		;Reset local variables.
		Swan.StopTranslation()
		hitTriggered = False
		boathouseEnteredTriggered = False
		translationFinishedTriggered = False
		ambushTriggered = False
		resetTimer = 0.0

		;Reset Swan
		Swan.Disable()
		Swan.Reset()
		Swan.Enable()

		;Set Swan Restrained.
		;Swan.SetRestrained(True)

		;Register for another hit event.
		Self.RegisterForHitEvent(Self, PlayerFaction)
	EndIf
EndFunction

;If Swan is attacked by the player, trigger his ambush after he's hit.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	hitTriggered = True
	StartTimer(0, 1)
EndEvent

;If the player enters the boathouse, trigger the ambush. Called by a trigger.
Function PlayerEnteredBoathouse()
	boathouseEnteredTriggered = True
	StartTimer(0, 1)
EndFunction

;Swan is 'active' if he's alive and his ambush has triggered.
bool Function IsActive()
	return (!Swan.IsDead() && ambushTriggered)
EndFunction