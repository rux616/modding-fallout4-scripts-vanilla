Scriptname REParentScript extends Quest Conditional

REParentScript Function GetScript() global ;used for making functions global
	return (Game.GetFormFromFile(0x0002DFEE, "Fallout4.esm") as Quest) as REParentScript ;this script attached to REParent quest
EndFunction

; Kill the actor and apply a force to make the body fall in a more natural way
; NOTE: this function will wait for actor to have 3D (up to a failsafe amount of seconds)
; abKillSilent: true = use KillSilent instead of Kill
Function KillWithForce(Actor akVictim, Actor akKiller = None, bool abKillSilent = true)
	debug.trace(self + " KillWithForce akVictim=" + akVictim + " akKiller=" + akKiller)
	; wait for 3D to load - a little bit
	int waitCount = 0
	float afForceMagnitude = 150.0
	while !akVictim.Is3DLoaded() && waitCount < 10
		debug.trace(self + "KillWithForce - waiting for 3D")
		waitCount = waitCount + 1
		utility.wait(0.5)
	endWhile

	if abKillSilent
		akVictim.KillSilent(akKiller)
	else
		akVictim.Kill(akKiller)
	endif

	if akVictim.Is3DLoaded()
		int aiForceDirection = Utility.RandomInt(1, 4)
		debug.trace(self + "KillWithForce - applying magnitude " + afForceMagnitude + " direction " + aiForceDirection)
		akVictim.ApplyHavokImpulse(0, 0, 1.0, 250)
		utility.wait(0.2)
		debug.trace(self + "KillWithForce - placing explosion")
		akVictim.PlaceAtMe(REDeathExplosion)
	endif

endFunction

function LootContainer(ObjectReference lootingRef, ObjectReference targetRef)
	debug.trace(self + " LootContainer: " + lootingRef + " looting " + targetRef)
	targetRef.RemoveAllItems(lootingRef)
	targetRef.AddKeyword(RELootedCorpse)
endFunction

function ShowWorkshopAssignmentMenu()
	debug.trace(self + "ShowWorkshopAssignmentMenu " + WorkshopAssignableNPC.GetRef())
	WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(WorkshopAssignableNPC.GetActorRef())
	debug.trace(self + "ShowWorkshopAssignmentMenu: Done - " + WorkshopAssignableNPC.GetActorRef() + " in WorkshopNPCFaction? " + WorkshopAssignableNPC.GetActorRef().IsInFaction(WorkshopNPCFaction))
endFunction

function AddToWorkshopAssignableAlias(Actor assignableActor)
	if assignableActor
		WorkshopAssignableNPC.ForceRefTo(assignableActor)
	else
		; set "done" actor value
		WorkshopAssignableNPC.GetActorRef().SetValue(REOfferToJoinWorkshop, 1.0)
		; clear alias
		WorkshopAssignableNPC.Clear()
	endif
endFunction

; update global cooldown timer
function UpdateGlobalCooldown()
	REGlobalCooldown.SetValue(GameDaysPassed.GetValue() + GlobalCooldownDays)
endFunction

; utility function
; NOTE: ALWAYS KILLS IF IT DOESN'T ENABLE
function RandomlyEnableOrKill(ReferenceAlias theAlias, int PercentChanceEnable = 50, int PercentChanceKill = 50)
	RandomlyEnableOrKillActor(theAlias.GetActorRef(), PercentChanceEnable, PercentChanceKill)
endFunction

function RandomlyEnableOrKillCollection(RefCollectionAlias theCollection, int PercentChanceEnable = 50, int PercentChanceKill = 50, int minimumEnableCount = 1)
	int i = 0
	while i < theCollection.GetCount()
		Actor theActor = theCollection.GetAt(i) as Actor
		if i < minimumEnableCount
			theActor.Enable()
		else
			RandomlyEnableOrKillActor(theActor, PercentChanceEnable, PercentChanceKill)
		endif
		i += 1
	endWhile
endFunction

function RandomlyEnableOrKillActor(Actor theActor, int PercentChanceEnable = 50, int PercentChanceKill = 50)
	if theActor
		if Utility.RandomInt() <= PercentChanceEnable
			theActor.Enable()
			if Utility.RandomInt() <= PercentChanceKill
				theActor.KillSilent()
			endif
		else
			theActor.KillSilent()
		endif
	endif
endFunction

function SendCleanupEvent()
	SendCustomEvent("RECheckForCleanup")
endFunction


;/ PROPERTIES AND VARIABLES /;

CustomEvent RECheckForCleanup		; custom event to tell RE quests to check for cleanup 

Group ConstProperties
	Faction Property REPlayerFriend Auto Const
	Faction Property REPlayerEnemy Auto Const


	MiscObject Property Caps001 Auto Const

	Faction Property REIgnoreForCleanup Auto Const
	{ add actors to this faction to have them ignored during cleanup check
	  i.e. quest can clean up even if they are loaded/alive
	}

	GlobalVariable Property GameDaysPassed Auto Const

	GlobalVariable Property REGlobalCooldown Auto Const
	{ global variable which holds the time that GameDaysPassed has to exceed before another RE can trigger }
	
	float Property GlobalCooldownDays = 0.00 Auto
	{ how long after a RE is triggered before another encounter can trigger? }

	Explosion Property REDeathExplosion Auto Const

	Keyword Property RELootedCorpse Auto Conditional Const

	WorkshopParentScript Property WorkshopParent Const Auto

	ReferenceAlias Property WorkshopAssignableNPC Const Auto

	GlobalVariable Property PlayerBeenToDiamondCity Auto Const

	ActorValue Property REOfferToJoinWorkshop Auto Const

	Faction Property WorkshopNPCFaction auto Const

	ActorValue Property WorkshopActorAlert Auto Const Mandatory

endGroup


Group CustomFlags
	; flags for RE quests that need to be saved globally
	Bool Property bRETravel04Verified = false Auto Conditional
	{set to true once Mister Gutsy has verified you are not a Commie}

	Bool Property bREScene01Triggered = false Auto Conditional
	{set to true once the player has picked up the Scene01 note}

	Bool Property bREScene03Triggered = false Auto Conditional
	{set to true once the player has spoken to the dog}

	Bool Property bREScene03DogHelped = false Auto Conditional
	{set to true once the player has helped the dog}

	Bool Property bRECOMHancockDone = false Auto Conditional
	{set to true once the player has helped the dog}

	Bool Property bREChokepointCT02MetStash = false Auto Conditional
	{set to true once the player has met Stash}

	Bool Property bRETravelCT06SimonCutOff = false Auto Conditional
	{set to true once the player has Simon cut off}

	Bool Property bRETravelCT06SimonIgnored = false Auto Conditional
	{set to true once the player ignores Simon's addiction}

	Bool Property bREChokepointCT02PCHitOrStole = false Auto Conditional
	{set to true once the player attacks or steals from Stash or crew}

	Bool Property bRECampCT07PCSawCamp = false Auto Conditional
	{set to true once the player has encountered this quest}

endGroup

