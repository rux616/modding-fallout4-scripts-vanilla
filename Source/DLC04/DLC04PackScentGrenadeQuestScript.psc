Scriptname DLC04:DLC04PackScentGrenadeQuestScript extends Quest

ReferenceAlias[] Property MarkerAliases Auto Const Mandatory
{Array of markers near the player}

RefCollectionAlias Property ViciousDogs Auto Const Mandatory
{Possible attacker ref collection}

RefCollectionAlias Property Bloodbugs Auto Const Mandatory
{Possible attacker ref collection}

RefCollectionAlias Property YaoGuai Auto Const Mandatory
{Possible attacker ref collection}

RefCollectionAlias Property Deathclaw Auto Const Mandatory
{Possible attacker ref collection}

RefCollectionAlias Property Attackers Auto Const Mandatory
{Holder ref for the attackers (handles all the actual AI)}

ReferenceAlias Property LeadBeast Auto Const Mandatory
{One of the attackers chosen to lead the scene}

GlobalVariable Property DLC04PackScentGrenadeCoolDownDays Auto Const Mandatory
{Global that manages how long between throws player can use grenade}

GlobalVariable Property DLC04PackScentGrenadeCurrentCoolDown Auto Const Mandatory
{Global that manages grenade cooldown}

REScript Property myREScript Auto Const Mandatory
{Used to manage the attacker count of these NPCs}

group NPCSounds
{Sounds to player when the player summons a group}

Sound Property DeathclawSound Auto Const Mandatory

Sound Property DogSound Auto Const Mandatory

Sound Property YaoGuaiSound Auto Const Mandatory

Sound Property BloodBugSound Auto Const Mandatory

EndGroup

;Local vars
int iCreatureIndex = 0 ;used to handle which creature group to spawn( 1 = Dogs, 2 = Bloodbugs, 3 = Yao Guai, 4 = Deathclaw)
bool bCreaturesSpawned = false ;bool used to let script know if we successfully spawned some NPCs 

Function Initialize()

	;Roll for who we're spawning in
	int iRand = Utility.RandomInt(1, 100)
	iCreatureIndex = 0

	if iRand >= 96
		iCreatureIndex = 4
		SetUpAttackers(Deathclaw, YaoGuai, Bloodbugs, ViciousDogs)
	elseif iRand >= 70
		iCreatureIndex = 3
		SetUpAttackers(YaoGuai, Deathclaw, Bloodbugs, ViciousDogs)
	elseif iRand >= 40
		iCreatureIndex = 2
		SetUpAttackers(Bloodbugs, Deathclaw, YaoGuai, ViciousDogs)
	else
		iCreatureIndex = 1
		SetUpAttackers(ViciousDogs, Deathclaw, YaoGuai, Bloodbugs)
	endif

EndFunction

Function SetUpAttackers(RefCollectionAlias aiCollectionToEnable, RefCollectionAlias aiCollectionToDelete01,\ 
						RefCollectionAlias aiCollectionToDelete02, RefCollectionAlias aiCollectionToDelete03)

	SetupRefCollection(aiCollectionToEnable, true)
	SetupRefCollection(aiCollectionToDelete01, false)
	SetupRefCollection(aiCollectionToDelete02, false)
	SetupRefCollection(aiCollectionToDelete03, false)

EndFunction

Function SetupRefCollection(RefCollectionAlias aiCollection, bool bInitialize)
		int i = 0
		int iCount = aiCollection.GetCount()
		debug.trace("DLC04 Scent Grenade: Set up ref collection: " + aiCollection + ". Count: " + iCount + ". Init: " + bInitialize)

		;If these are the animal we want to spawn in, enable them now and add them to attackers collection. Otherwise, delete.
		if bInitialize

			;Spawning in creatures. Mark the bool
			bCreaturesSpawned = true

			;Find a valid marker to move all these folks to
			bool foundMarker = false
			ObjectReference marker

			while i < MarkerAliases.Length && foundMarker == false
				marker = MarkerAliases[i].GetRef()
				if marker && Game.GetPlayer().HasDirectLOS(marker) == false && Game.GetPlayer().HasDetectionLOS(marker) == false
					foundMarker = true
					debug.trace(self + " found valid marker " + marker + " (distance=" + marker.GetDistance(game.Getplayer()) + ")")
					
					aiCollection.MoveAllTo(marker)
				else
					debug.trace(self + " skipping marker " + marker + " (distance=" + marker.GetDistance(game.Getplayer()) + ")")
				endif
				i += 1
			endWhile

			;Now, decide how many attackers we're going to have
			int iActualCount = 0
			if iCount >= 4
				iActualCount = Utility.RandomInt(iCount - 2, iCount)
			elseif iCount >= 2
				iActualCount = Utility.RandomInt(iCount - 1, iCount)
			else
				iActualCount = iCount
			endif

			debug.trace(self + "Number of NPCs to enable: " + iActualCount + ". NPCs in collection: " + iCount)

			;Now get them all in the right collection
			Attackers.AddRefCollection(aiCollection)

			;Update the REScript alias count
			myREScript.UpdateDeadCountGroupSize(0, Attackers.GetCount())

			;Now enable them or delete them as needed	
			if iActualCount >= iCount
				aiCollection.EnableAll()
			else
					
				i = 0
				while i < iCount
					if i < iActualCount
						debug.trace("DLC04 Scent Grenade attacker set up. Enabling NPC " + i)
						aiCollection.GetAt(i).Enable()
					else
						debug.trace("DLC04 Scent Grenade attacker set up. Deleting NPC " + i)
						(aiCollection.GetAt(i) as Actor).KillSilent() 
					endif
					i += 1
				endWhile
			endif
					
			;Play the greeting sound of the appropriate NPC
			PlayAnimalSound(iCreatureIndex, marker)

			;And loop through the attackers collection and make the first creature we find lead beast
			i = 0

			while (i < iCount) && LeadBeast.GetRef() == none
				ObjectReference obj = Attackers.GetAt(i)
					;If we got one, make them lead beast
				if obj != none
					LeadBeast.ForceRefTo(Attackers.GetAt(0))	
				endif
				i += 1
			endwhile
		else
			; Or, if these aren't the animals we want, delete everyone and clear their collection
			while i < iCount
				debug.trace("DLC04 Scent Grenade: Deleting attacker: " + i)
				aiCollection.GetAt(i).Delete()
				i += 1
			endwhile 

			;If we're deleting folks, clear the collection when finished
			aiCollection.RemoveAll()
		endif
EndFunction

Function PlayAnimalSound(int iIndex, ObjectReference aiSource)
	;Play the sound appropriate to the spawned animal at the chosen spawn marker

	if iIndex == 1
		DogSound.Play(aiSource)
	elseif iIndex == 2 
		BloodBugSound.Play(aiSource)
	elseif iIndex == 3
		YaoGuaiSound.Play(aiSource)
	elseif iIndex == 4
		DeathclawSound.Play(aiSource)
	endif

EndFunction

function Shutdown()
	; set next available time global to current time + cooldownDays
	if bCreaturesSpawned
		DLC04PackScentGrenadeCurrentCoolDown.SetValue(Utility.GetCurrentGameTime() + DLC04PackScentGrenadeCoolDownDays.Getvalue())
	endif
endFunction