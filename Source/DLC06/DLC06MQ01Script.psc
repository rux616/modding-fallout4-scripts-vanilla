Scriptname DLC06:DLC06MQ01Script extends Quest Conditional

ReferenceAlias Property Alias_Workshop auto const mandatory 

Worldspace Property Commonwealth auto const mandatory 

Location Property QuincyQuarryLocation auto const mandatory 

Location Property DLC06Vault88Location auto const mandatory 

int property MinPlayerLevel = 25 auto const
{ min player level to start MQ01, unless they enter the quarry location }

group quests
	Quest property MQ102 auto const mandatory 

	DLC06:DLC06WorkshopParent property DLC06WorkshopParent auto const mandatory 
endGroup

Event OnQuestInit()
	; ready to start quest? If not, register for events as needed
	if CheckForMQStart() == false
		; use location change events to start DLC01 main quest
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif
endEvent

bool function CheckForMQStart()
	debug.trace(self + " CheckForMQStart")
	
	actor player = Game.GetPlayer()

	if ( player.GetLevel() >= MinPlayerLevel && player.GetWorldSpace() == Commonwealth ) || player.IsInLocation(QuincyQuarryLocation) || player.IsInLocation(DLC06Vault88Location)
		SetStage(100)
		; register for events from vault workshop
		RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopMode")
		return true
	else
		return false
	endif
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ; check if time to start
	debug.trace(self + "OnLocationChange")
  	CheckForMQStart()
EndEvent

Event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	if akSource == Alias_Workshop.GetRef()
		SetStage(200)
		UnregisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopMode")
	endif		
endEvent