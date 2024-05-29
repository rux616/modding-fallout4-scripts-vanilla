Scriptname MS13Script extends Quest Conditional

bool initialized = false

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(DarcyPembroke.GetActorRef(), "OnDeath")
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if GetStageDone(20) && !GetStageDone(100) && akOldLoc == DiamondCityColonialTaphouseLocation
	    	; player has left Colonial Taphouse after triggering intro scene - set stage to release NPCs from quest packages
	    	debug.trace(self + " setstage 100")
	   		SetStage(100)
		endif

		; player leaves Taphouse during intro fight scene
		if GetStageDone(15) && !GetStageDone(18) && akOldLoc == DiamondCityColonialTaphouseLocation
	    	; player has left Colonial Taphouse after triggering intro scene - set stage to finish fight
	    	debug.trace(self + " setstage 18")
	   		SetStage(18)
		endif

		; after refusing to help, if player leaves Diamond City while Paul is waiting to confront Cooke, Paul goes alone (and dies)
		if GetStageDone(230) && !GetStageDone(220) && !GetStageDone(210) && !GetStageDone(250) && !GetStageDone(340) && akOldLoc == DiamondCityLocation && !DiamondCityLocation.IsChild(akNewLoc)
			; variant B1 - Cooke kills Paul
	    	debug.trace(self + " setstage 340")
			setstage(340)
		endif

		; player has left Taphouse during Cooke fight - resolve fight somehow...
		if GetStageDone(250) && GetStageDone(305) && !GetStageDone(400) && akOldLoc == DiamondCityColonialTaphouseLocation
	    	debug.trace(self + " leave Taphouse during Cooke fight - setstage 380")
	   		SetStage(380)
		endif


		; player has left Taphouse after Cooke confrontation - clean up bodies etc.
		if GetStageDone(400) && !GetStageDone(390) && akOldLoc == DiamondCityColonialTaphouseLocation
	    	debug.trace(self + " leave Taphouse after confrontation - setstage 390")
	   		SetStage(390)
		endif

		; player has left Taphouse after Paul dies during confrontation - same cleanup.
		if GetStageDone(280) && !GetStageDone(390) && !GetStageDone(400) && akOldLoc == DiamondCityColonialTaphouseLocation
	    	debug.trace(self + " leave Taphouse after Paul dies during confrontation - setstage 390")
	   		SetStage(390)
		endif

		; player enters Diamond City with split loot not resolved
		
		; Variant B1: next time player enters Diamond City or Goodneighbor, advance plot to C4 - Nelson killed at ambush
		if GetStageDone(340) && !GetStageDone(440) && (akNewLoc == DiamondCityLocation || akNewLoc == GoodneighborLocation)
			; variant B1 - Cooke kills Paul
	    	debug.trace(self + " setstage 440")
			setstage(440)
		endif
	endif
EndEvent

Event Actor.OnDeath(Actor akSender, Actor akKiller)
	debug.trace(self + " received OnDeath from " + akSender)
	if akSender == DarcyPembroke.GetActorRef()
		; Darcy died - fail quest if necessary
		if GetStageDone(400) == 0
			SetStage(2000)
		endif
	endif
EndEvent

; increment Paul's "breaking bad" level
function PaulBreaksBad()
	PaulBreakingBadLevel += 1
endFunction

; call to divide spoils
function DivideSpoils(float paulCut = 0.5)
	debug.trace(self + "DivideSpoils: paulCut=" + paulCut)
	bool nelsonIsDead = NelsonAtAmbush.GetActorRef().IsDead()
	
	Actor paul = PaulPembroke.GetActorRef()
	Actor player = Game.GetPlayer()

	if nelsonIsDead
		Actor crateOwner
		if paulCut >= 0.5
			; Paul gets all the crates
			crateOwner = paul
			PaulShouldLootCrates = true
		else
			; player gets all the crates
			crateOwner = player
		endif
		int i = 0
		while i < AmbushCrates.GetCount()
			AmbushCrates.GetAt(i).SetActorRefOwner(crateOwner)
			AmbushCrates.GetAt(i).BlockActivation(false)
			i += 1
		endwhile
	else
		; if Nelson is alive, just divide the crates
		float paulCrates = (AmbushCrates.GetCount() as float) * paulCut
		int paulCount = math.Floor(paulCrates + 0.5)
		debug.trace(self + " paulCount=" + paulCount)
		int i = 0
		while i < AmbushCrates.GetCount()
			AmbushCrates.GetAt(i).BlockActivation(false)
			Actor crateOwner
			if i < paulCount 
				; Paul gets the crate
				crateOwner = paul
				PaulShouldLootCrates = true
			else
				; player gets the crate
				crateOwner = player
			endif
			AmbushCrates.GetAt(i).SetActorRefOwner(crateOwner)
			i+=1
		endwhile
	endif
endFunction

Function PaulLootCrates()
	Actor paul = PaulPembroke.GetActorRef()

	; give Paul the contents of the crates he owns
	int i = 0
	while i < AmbushCrates.GetCount()
		ObjectReference theCrate = AmbushCrates.GetAt(i)
		if theCrate.GetActorRefOwner() == paul
			theCrate.RemoveAllItems(paul)
			; clear ownership
			theCrate.SetActorRefOwner(NONE)
		endif
		i+=1
	endwhile
endFunction

; who should own Cooke's house/bar?
Function UpdateCookeHouseStatus()
	actor paul = PaulPembroke.GetActorRef()
	actor darcy = DarcyPembroke.GetActorRef()

	; check to see who should own Cooke's house
	; if Paul is alive and has money, he buys it
	if GetStageDone(820) == false && GetStageDone(830) == false && paul.IsDead() == false
		; Paul buys it
		CookeHouseStatus = 1
		; Set up all faction/vendor stuff for Paul, Darcy and Pete
		paul.AddToFaction(DmndColonialTaphouseOwnerFaction)
		darcy.AddToFaction(DmndColonialTaphouseOwnerFaction)
		paul.AddToFaction(ServicesDmndTaphouse)
	else
		; otherwise, available for player to buy
		CookeHouseStatus = 2
	endif

endFunction

function TestIsInScene(Actor testActor)
	debug.trace(" " + testActor + ".IsInScene()=" + testActor.IsInScene())
endFunction


bool Property PhaseBPlayerHelping = false auto conditional
{ this gets set to true when the player agrees to help Paul, either in phase A, or in conversation during phase B 
  (can also get set back to false during phase B)}

Location Property DiamondCityColonialTaphouseLocation const auto

Location Property DiamondCityLocation Auto Const

Location Property GoodneighborLocation Auto Const

Bool Property CookeVanishes Auto Conditional
{set to true if Cooke survives ambush and "vanishes"}

Bool Property LatimerAmbushWitness Auto Conditional
{set to true if someone escapes the Latimer Ambush}

Bool Property DivideSpoils = true Auto Conditional
{set to true if player has to divide spoils after ambush}

Bool Property PaulShouldLootCrates = false Auto Conditional
{ set to true if Paul should loot crates after dividing spoils }

Bool Property DarcyAllowedTaphouse = true Auto Conditional
{ set to false to turn off her package in the Taphouse }

Bool Property NPCsAllowedTaphouse = true Auto Conditional
{ set to false to turn off all NPCs from going to Taphouse }

Bool Property CookeAtTaphouse = true Auto Conditional
{ set to false to turn off all NPCs from going inside Taphouse }

Bool Property PlayerMeanToDarcy auto Conditional
{ set to true when player is mean to Darcy }

int Property CookeHouseStatus auto Conditional
{
 	0 = starting state - owned by Cooke
	1 = owned by Paul Pembroke
	2 = available for player to buy
}

int Property PaulBreakingBadLevel auto Conditional
{
	0 = starting
	+1 for each level of "Waltness" that Paul achieves
	the higher the number, the more ruthless Paul will become
}

Bool Property PaulAngryAtPlayer auto Conditional
{ set to true when player takes more than 50/50 cut }

RefCollectionAlias Property AmbushCrates Auto Const

ReferenceAlias Property PaulPembroke Auto Const

ReferenceAlias Property DarcyPembroke Auto Const

ReferenceAlias Property NelsonAtAmbush Auto Const

int Property NelsonLootAmount = 1000 Auto Const Conditional
{ the amount of caps Nelson is carrying to the chems deal }

Faction Property DmndColonialTaphouseOwnerFaction auto const
Faction Property ServicesDmndTaphouse auto const
