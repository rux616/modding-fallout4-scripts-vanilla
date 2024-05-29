Scriptname MS09Script extends Quest Conditional

CustomEvent LorenzoTelekinesisEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()
;		debug.TraceFunction()
		(self + " player OnLocationChange akOldLoc=" + akOldLoc + ", akNewLoc=" + akNewLoc)
		
		; player enters Third Rail (ever)
		if GetStageDone(20) == false && akNewLoc == GoodneighborTheThirdRailLocation
			setStage(20)
		endif

		; player arrives at Parsons on Mission 1
		if GetStageDone(400) && !GetStageDone(405) && akNewLoc == ParsonsStateLocation
			setStage(405)
		endif

		; player exits Cabot House after getting objective to Parsons
		if GetStageDone(850) && !GetStageDone(860) && akOldLoc == CabotHouseInteriorLocation
			setStage(860)
		endif

		; player exits Cabot House after final battle
		if GetStageDone(1600) && !GetStageDone(1650) && akOldLoc == CabotHouseLocation && akNewLoc != CabotHouseInteriorLocation
			setStage(1650)
		endif

		; player arrives at Parsons on Mission 3
		if GetStageDone(850) && !GetStageDone(900) && akNewLoc == ParsonsStateLocation
			setStage(900)
		endif

		; player exits Parsons after Lorenzo room resolved (free or dead)
		if GetStageDone(1190) && !GetStageDone(1320) && akOldLoc == ParsonsStateLocation
			setStage(1320)
		endif

		; player returns to Cabot House exterior after Lorenzo room resolved (free only)
		if GetStageDone(1190) && !GetStageDone(1230) && !GetStageDone(1345) && akNewLoc == CabotHouseLocation
			setStage(1345)
		endif


		; player returns to Cabot House
		if akNewLoc == CabotHouseInteriorLocation
			; increment last visit global - used for dialogue conditions
			MS09CabotHouseLastVisit.Mod(1.0)
			; player returns to Cabot House after mission 3
			if GetStageDone(1300) && !GetStageDone(1350)
				setstage(1350)
			endif

			; make sure correct doors are unlocked
			if GetStageDone(750)
				UnlockInteriorDoors()
			endif
		elseif akOldLoc == CabotHouseLocation
			; player leaves Cabot House - always reset (invisible maid service)
			CabotHouseInteriorLocation.Reset()
		endif
	endif
EndEvent

int property LorenzoEscapeTimerID = 1 auto const
int property RewardTimerID = 2 auto const
int property RunOutOfSerumTimerID = 3 auto const

Event OnTimerGameTime(int aiTimerID)
    debug.trace(self + "OnTimerGameTime")
    if aiTimerID == LorenzoEscapeTimerID && GetStageDone(1210) == false
    	setStage(1270)
	elseif aiTimerID == RewardTimerID
    	MS09MiscJackReward.Start()
	elseif aiTimerID == RunOutOfSerumTimerID
		if Game.GetPlayer().GetCurrentLocation() != CabotHouseInteriorLocation
			SetStage(1660)
		else
			; run short timer to wait for player to leave
			StartTimerGameTime(1.0, RunOutOfSerumTimerID)
		endif
    endif
EndEvent

function PlayerInsultsJack()
	JackInsultCount += 1
endFunction

; track how Emogene feels about the player
function PlayerInsultsOrComplimentsEmogene(bool bInsult = true)
	if bInsult
		EmogeneInsultCount += 1
	else
		EmogeneInsultCount += -1
	endif
endFunction

; manually cast telekinesis spell
function LorenzoCast(ObjectReference spellTarget)
	MS09LorenzoTelekinesisSpellFake.Cast(Alias_Lorenzo.GetRef(), spellTarget)
endFunction

function LorenzoDeathSpell()
	MS09LorenzoDeathSpell.Cast(Alias_Lorenzo.GetRef(), NONE)
endFunction

; called if player hits trigger box near Lorenzo
function EndingTriggerLorenzo()
	; stop all ending scenes
	int i = 0
	while i < CabotHouseEndingScenes.Length
		CabotHouseEndingScenes[i].Stop()
		i += 1
	endWhile
	MS09Mission3EndingLorenzo01.Start()
endFunction

function GiveRadiationGun(Actor targetActor)
	debug.trace(self + " GiveRadiationGun " + targetActor)
	ObjectReference gun = Alias_RadiationGun.GetRef()
	targetActor.AddItem(gun)
	gun.Enable()
	targetActor.Additem(MS09AmmoJackRadiationGun, 10)
endFunction


function EquipRadiationGun(bool bEquip)
	actor jack = Alias_Jack.GetActorRef()
	actor lorenzo = Alias_Lorenzo.GetActorRef()
	if jack.IsDead() == false
		ObjectReference gun = Alias_RadiationGun.GetRef()
		if bEquip
			debug.trace(self + " equipping radiation gun")
			; TEMP:
			;jack.RemoveItem(HuntingRifle)
			; /temp
			jack.EquipItem(gun.GetBaseObject(), true)
			jack.StartCombat(lorenzo, true)
		else
			debug.trace(self + " unequipping radiation gun")
			; TEMP:
			;jack.AddItem(HuntingRifle)
			; /temp
			jack.UnequipItem(gun.GetBaseObject(), true)
			jack.StartCombat(lorenzo, false)
		endif
	endif
endFunction

function GiveLorenzoSerum()
	debug.trace(self + "GiveLorenzoSerum")
	; make sure player has only 1
	if Alias_LorenzoReward.GetRef() == NONE
		debug.trace(self + "  giving serum to player")
		Actor player = Game.GetPlayer()
		ObjectReference serum = player.PlaceAtMe(akFormToPlace = MS09LorenzoSerum, aiCount = 1, abForcePersist = false, abInitiallyDisabled = true, abDeleteWhenAble = false)
		Alias_LorenzoReward.ForceRefTo(serum)
		player.AddItem(serum)
		serum.Enable()
	endif
endFunction

function UnlockInteriorDoors()
; unlock Cabot House interior doors - player has access to whole house now
	int i = 0
	while (i < Alias_CabotHouseLockedInteriorDoors.GetCount())
		ObjectReference theDoor = Alias_CabotHouseLockedInteriorDoors.GetAt(i)
		if theDoor
			theDoor.SetLockLevel(0)
			theDoor.Unlock()
		endif
		i += 1
	endwhile
endFunction

; used to disable player controls during Parsons sequence
InputEnableLayer parsonsEnableLayer

; used to disable player controls during Wilhelmina sequence
InputEnableLayer wilhelminaEnableLayer

ImageSpaceModifier Property FadetoBlackImod Auto Const

bool property triggerIntro auto Conditional
{ MS09Intro can now be triggered - e.g. player has fought guards at Parsons }

group DialogueConditions

	int property DN031RespawnCount auto Conditional
	{ pulled from DN031, how many guards did player kill at Parsons }

	bool property IntroTalkedAboutParsons auto Conditional
	{ if Edward hires player because of attack on Parsons }
	
	Bool Property IntroExtraReward Auto Conditional

	Bool Property PlayerCalledJackCrazy Auto Conditional

	Int Property JackInsultCount Auto Conditional
	{how many times has the player insulted Jack}

	int Property EmogeneInsultCount auto Conditional

	bool Property IntercomSpeechChallenge auto Conditional
	{ set to TRUE if player wins first intercom speech challenge }

	; PLAYER CAN KNOW THESE PRIOR TO MISSION 3:
	Bool Property PlayerKnowsAlienTheory Auto Conditional

	Bool Property PlayerKnowsFatherFoundLostCity Auto Conditional
	{set to true when player finds out about Jack's father excavating lost city}

	Bool Property PlayerAskedAboutFathersAge Auto Conditional
	{set to true when player asks about how old Lorenzo is }

	Bool Property PlayerKnowsLostCityDisturbing Auto Conditional
	{ set to true when Jack talks about how disturbing the alien artifacts are }

	Bool Property PlayerKnowsLorenzoAtParsons Auto Conditional

	Bool Property PlayerKnowsImmortality Auto Conditional
	{set to true when player finds out about Lorenzo's immortality}

	Bool Property PlayerKnowsSerumImmortality Auto Conditional
	{set to true when player finds out that the serum grants immortality}

	Bool Property PlayerKnowsEmogeneOld Auto Conditional
	{set to true when player finds out that Emogene is 400 years old}

	; MISSION 3
	Bool Property PlayerKnowsSerumLorenzo Auto Conditional
	{set to true when player finds out that Lorenzo is the source of the serum}

	Bool Property PlayerKnowsLorenzoAbilities Auto Conditional
	{ true when Jack tells player about Lorenzo's abilities }
	
	Bool property JackPromisedSerum auto Conditional
	{ set to true when Jack promises serum to player }

	Bool property JackKnowsPlayerPrewar auto Conditional
	{ set to true when player tells Jack he is from before the Great War }
endGroup

group Mission2
	bool Property CultPlayerAskedAboutMission auto Conditional
endGroup

group Mission3 
	bool Property Mission3LorenzoFreed auto Conditional
	{ set to true if Lorenzo was freed from the cell }

	bool Property Mission3PlayerSidesWithCabots auto Conditional
	{ set to true if player convinces Jack - default is that player is on Lorenzo's side (false) }

	bool Property Mission3EndJackFriendly auto Conditional
	{ set to true if Jack ends the quest in a friendly state }

endGroup

; location properties
Location Property CabotHouseLocation Auto Const
Location Property CabotHouseInteriorLocation Auto Const
Location Property ParsonsStateLocation Auto Const
Location Property GoodneighborTheThirdRailLocation Auto Const

; quests
Quest Property MS09MiscJackReward auto Const


Scene[] Property CabotHouseEndingScenes Auto Const
{scenes that need to be shut down prior to Lorenzo confrontation scene}

Scene Property MS09Mission3EndingLorenzo01 Auto Const
{ Lorenzo ending scene }

Ammo Property MS09AmmoJackRadiationGun auto const
Weapon Property MS09JackRadiationGun auto const
Spell Property MS09LorenzoTelekinesisSpellFake auto const
Spell Property MS09LorenzoDeathSpell auto const

ReferenceAlias Property Alias_Jack auto const
ReferenceAlias Property Alias_Lorenzo auto const
ReferenceAlias Property Alias_RadiationGun auto const

RefCollectionAlias Property Alias_CabotHouseLockedInteriorDoors Auto Const

Potion Property MS09LorenzoSerum auto const
{ reward from Lorenzo }
ReferenceAlias Property Alias_LorenzoReward auto const
{ alias to store reward - make sure player has only 1 }

Globalvariable Property MS09CabotHouseLastVisit auto const
{ global to track last player visit to Cabot House }