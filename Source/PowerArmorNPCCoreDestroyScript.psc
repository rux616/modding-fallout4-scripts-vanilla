Scriptname PowerArmorNPCCoreDestroyScript extends ObjectReference
{This script does all the gameplay effects for destroying a fusion core of an NPC in power armor.}

Sound Property UIPowerArmorBatteryCoreEjectStart Auto Const Mandatory
ObjectMod Property PA_FusionCore01 Auto Const Mandatory
Idle Property IdlePowerless Auto Const Mandatory
PROJECTILE Property FusionCoreShortFuseProjectile Auto Const Mandatory
Armor Property PowerArmorCoreGlow Auto Mandatory
ActorValue Property PowerArmorBattery Auto Mandatory
ActorValue Property WheelConditionValue Auto Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if( IsBoundGameObjectAvailable() ) ; the game repeatly kills us out from under the script system
		debug.trace( "power armor frame " + GetBaseObject() + " being transfered from " + akOldContainer + " to " + akNewContainer )
		
		if( akNewContainer != None )
			Actor ArmorWearer = akNewContainer as Actor
			if( ArmorWearer != Game.GetPlayer() )
				debug.trace("Power Armor: listening for core destruction on " + ArmorWearer)
				; also register for death and unloading - if we remain registered to OnCripple, we will never fully unload this actor, even if they are temp
				RegisterForRemoteEvent(ArmorWearer, "OnCripple")
				RegisterForRemoteEvent(ArmorWearer, "OnUnload")
				RegisterForRemoteEvent(ArmorWearer, "OnDeath")
			endIf
		elseIf( akOldContainer && akOldContainer.WaitFor3DLoad() )
			Actor ArmorWearer = akOldContainer as Actor
			if( ArmorWearer != Game.GetPlayer() )
				debug.trace("Power Armor: Stopped listening for core destruction on " + ArmorWearer)
				UnregisterForAllRemoteEvents()
			endIf
		endIf
	endIf
EndEvent

Event Actor.OnCripple(Actor akSender, ActorValue akActorValue, bool abCrippled)
	debug.trace("Power armored actor " + akSender + " was crippled in the " + akActorValue + " but the core had already been crippled so ignoring" )
EndEvent

Auto State CoreInArmor
	Event Actor.OnCripple(Actor akSender, ActorValue akActorValue, bool abCrippled)
		GoToState("CoreEjected")
		debug.trace("Power armored actor " + akSender + " was crippled in the " + akActorValue )
		If( akActorValue == WheelConditionValue )
			debug.trace(" doing core ejection" )
			
			UnregisterForAllRemoteEvents()
			
			akSender.equipItem(PowerArmorCoreGlow, true, true)
			Utility.Wait(1.5)
			akSender.PlaySubGraphAnimation("stage2")
			Utility.Wait(1.5)
			akSender.PlaySubGraphAnimation("stage3")
			
			Utility.Wait(1.5)
			
			UIPowerArmorBatteryCoreEjectStart.Play( akSender )
			akSender.UnequipItem(PowerArmorCoreGlow, true, true)

			; equipping and firing the weapon like we do in the core eject script won't work for some unknown reason
			; the core always seems to fire forward (from the normal fire node?)
			; Placing the projectile directly seems to work fine.
			akSender.PlaceAtNode("Wheel", FusionCoreShortFuseProjectile)
			
			; now we must remove the fusion core mod so the furniture won't have a fusion core in it when it loads in
			akSender.RemoveModFromInventoryItem( GetBaseObject(), PA_FusionCore01 )
			akSender.SetValue(PowerArmorBattery, -1.0) ; this should force them to walk only
			
			Utility.Wait(8)
			if( !akSender.IsDead() )	
				; finally, get them out of the suit (if they're still alive)
				akSender.SwitchToPowerArmor(None)
			endIf
		Else
			GoToState("CoreInArmor")
		EndIf
	EndEvent
EndState

State CoreEjected
EndState

Event Actor.OnDeath(Actor akSender, Actor akKiller)
	UnregisterForAllRemoteEvents()
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSender)
	UnregisterForAllRemoteEvents()
EndEvent
