Scriptname DogmeatQuestDogmeatAliasScript extends ReferenceAlias conditional
{Handle ongoing Dogmeat-specific stuff}
;-------------------------------------------------------------------------------;
Scene Property DogmeatIntroScene Auto Const
scene property DogmeatIntroGarageFetch auto const

float property fDistToAbandonRRIntroScene = 4000.0 auto const

Location Property RedRocketTruckStopLocation Auto Const
objectReference property RedRocketMarker auto const
Faction Property HasBeenCompanionFaction Auto Const
Quest Property DogmeatQuest Auto Const

;empty state - functions must be defined here or we can't compile
Event Actor.OnLocationChange(actor akSender, Location akOldLoc, Location akNewLoc)
	;empty
EndEvent

Event Quest.OnStageSet(quest akSender, int auiStageID, int auiItemID)
	;empty
EndEvent

Function SkipToDogmeatMQ106State()
	GotoState("DogmeatMQ106State")
	unregisterforRemoteEvent(GetOwningQuest(),"OnStageSet")
	unregisterforRemoteEvent(game.getPlayer(),"onLocationchange")
EndFunction

Function IntroStateOver()
	GoToState("IntroOverState")
	unregisterforRemoteEvent(GetOwningQuest(),"OnStageSet")
	unregisterforRemoteEvent(game.getPlayer(),"onLocationchange")
EndFunction

Auto State DogmeatBaseIntroState
	;-------------------------------------------------------------------------------;
	EVENT onInit()
		registerforRemoteEvent(GetOwningQuest(),"OnStageSet")
	endEVENT
	;-------------------------------------------------------------------------------;
	EVENT onDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
		; player has left the immediate red rocket area after intro stuff kicked off.  
		; Snuff any scenes that might be lingering there.
		debug.trace("Dogmeat Alias: Player:RRocket distance check complete.  Player is >"+fDistToAbandonRRIntroScene+" from Dogmeat.  Kill scene(s)")
		debug.trace("Dogmeat Alias: getReference().getDistance(game.getPlayer()) = "+getReference().getDistance(game.getPlayer()))
		debug.trace("								akObj1 = "+akObj1)
		debug.trace("								akObj2 = "+akObj2)
		debug.trace("					        afDistance = "+afDistance)
		debug.trace("			fDistToAbandonRRIntroScene = "+fDistToAbandonRRIntroScene)
		
    	DogmeatIntroScene.Stop()
    	DogmeatIntroGarageFetch.Stop()
		UnregisterForDistanceEvents(game.getPlayer(), RedRocketMarker)
		IntroStateOver()
	endEVENT
	;-------------------------------------------------------------------------------;
	Event Actor.OnLocationChange(actor akSender, Location akOldLoc, Location akNewLoc)
		debug.trace("Dogmeat: Player has changed location from "+akOldLoc+" to "+akNewLoc)
	    if akOldLoc == RedRocketTruckStopLocation
	    	debug.trace("Dogmeat: player has left the red rocket location.  Kill scenes there.")
	    	; therefore, kill those scenes and make sure Dogmeat isn't left in a bad state.
	    	DogmeatIntroScene.Stop()
	    	DogmeatIntroGarageFetch.Stop()
	    	unregisterforRemoteEvent(game.getPlayer(),"onLocationChange")
	    	IntroStateOver()
	    endif
	EndEvent
	;-------------------------------------------------------------------------------;
	Event Quest.OnStageSet(quest akSender, int auiStageID, int auiItemID)
	 	debug.trace("Dogmeat: Received stage "+auiStageID+" from "+akSender)
	 	debug.trace("Dogmeat Alias: register for distance and loc change events on player.")
		if auiStageID == 110 ; player has kicked off intro scene sequence
			registerForDistanceGreaterThanEvent(game.getPlayer(), self, fDistToAbandonRRIntroScene)	
			registerforRemoteEvent(game.getPlayer(),"onLocationchange")
		endif
	endEVENT
	;-------------------------------------------------------------------------------;
EndState

State DogmeatMQ106State
	;
EndState

State IntroOverState
	;
EndState

