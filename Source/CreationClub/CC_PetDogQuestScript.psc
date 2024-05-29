Scriptname CreationClub:CC_PetDogQuestScript extends Quest
{Quest script used to handle Creation Club workshop dogs}

Group DogNames
{Array of dog name ref aliases to stamp onto the dog actors.}
	ReferenceAlias[] Property DogNames Auto Mandatory
EndGroup

Group Messages
{Display and confirmation messages}
	Message Property RenameConfirmMsg Auto Const Mandatory
EndGroup

Group ActivatePerks
{Perks added to the player to give RENAME and PET activate options}
	Perk Property CC_PetDogs_RenamePerk Auto Const Mandatory
	Perk Property CC_PetDogs_PetPerk Auto Const Mandatory	
EndGroup

Group IdleAnims
{Animations for petting}
	Idle Property PairedDogmeatHumanGreetHand Auto Const
	Idle Property PairedDogmeatHumanGreetPetKneel Auto Const
EndGroup

Bool renameLock = False

Function NameDog(ObjectReference dogToName)
{Public function called by quest fragments, perk fragments, etc. to name, or re-name dogs.}

	If(renameLock == False)
		renameLock = True ;stop player from spamming

		CreationClub:RescuedDogScript thisDog = dogToName as CreationClub:RescuedDogScript

		;ApplyToRef won't work if applied a second time, so we have to find and remove the previous name if it exists, THEN apply a new name
		If(thisDog.CurrentName)
			debug.trace("CC: Previous name " + thisDog.CurrentName + " found, looking up position in name array")
			Int previousNamePosition = DogNames.Find(thisDog.CurrentName)
			
			If(previousNamePosition > -1)
				debug.trace("CC: Previous name value found in array as position " + previousNamePosition + ", attempting to remove data")
				DogNames[previousNamePosition].RemoveFromRef(thisDog)
			EndIf
		EndIf
		
		If(DogNames.Length > 0)
			debug.trace("CC: Dog names found, renaming dog")
			int i = Utility.RandomInt(0, (DogNames.Length - 1))
			debug.trace("CC: Naming dog to" + DogNames[i])
			DogNames[i].ApplyToRef(thisDog)
			thisDog.CurrentName = DogNames[i] ;update the dog's internal var so we can remove later, as above
		Else
			debug.trace("CC: No dog names found, leaving default.")

		EndIf
		renameLock = False
		
	EndIf
	
EndFunction

Function GivePlayerRenamePerk()
{Called from quest fragment in dog Creations}

	;Give the player perks that enable them to rename and pet the dogs as activation choices
	If(!Game.GetPlayer().HasPerk(CC_PetDogs_RenamePerk))
		Game.GetPlayer().AddPerk(CC_PetDogs_RenamePerk)
	EndIf
	
EndFunction

Function PetDog(ObjectReference dogToPet)
{Called from Hello dialogue, so sometimes when the player initiates "Talk" he pets the dog instead of making the dog bark.}

	If(Utility.RandomInt(0, 100) < 50)
		Game.GetPlayer().playIdleWithTarget(PairedDogmeatHumanGreetPetKneel, dogToPet)
	Else
		Game.GetPlayer().playIdleWithTarget(PairedDogmeatHumanGreetHand, dogToPet)	
	EndIf

EndFunction


;-- Called from perk to rename dog
Function NameDogWithConfirmation(ObjectReference dogToName)
	
	If(renameLock == False)

		Int iButton = RenameConfirmMsg.Show()
		
		If iButton == 0 ;Yes
			NameDog(dogToName)
		EndIf
		
	EndIf
EndFunction

