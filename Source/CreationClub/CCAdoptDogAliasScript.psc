Scriptname CreationClub:CCAdoptDogAliasScript extends ReferenceAlias
{Used on the dog to control initial interactions and stages.}

Group Messages
	Message Property messageAdopt Auto Const
EndGroup

Group Idles
	Idle Property PairedDogmeatHumanGreetHand Auto Const
	Idle Property PairedDogmeatHumanGreetPetKneel Auto Const
EndGroup

Group Quests
	WorkshopParentScript Property WorkshopParent Auto Const
	GenericGoHomeScript Property GenericGoHome Auto Const
EndGroup

Keyword Property CC_PetDogs_HasBeenAdopted Auto Const

Event OnActivate(ObjectReference akActionRef)
	;debug.trace("activate dog")

	Quest thisQuest = Self.GetOwningQuest()
	
	;stage 0 - greet the dog, first interaction
	If(thisQuest.GetStage() == 0)
	
		;Greet the dog
		Game.GetPlayer().playIdleWithTarget(PairedDogmeatHumanGreetPetKneel, Self.GetRef())
		
		thisQuest.SetStage(10)
		
		;Set the activation text to now be adopt
		Self.GetRef().SetActivateTextOverride(messageAdopt)
	
	;stage 10 - send the dog to a settlement, player can cancel and dog/quest will stay in this state until they send dog to initial home
	ElseIf(thisQuest.GetStage() == 10)
	
		WorkshopParent.AddActorToWorkshopPlayerChoice(Self.GetActorRef(), true)
	
	EndIf
	
EndEvent

Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)
	Debug.Trace("Dog Ref Alias: " + self + " has been directed to transfer to the workshop at " + akNewWorkshop + " with the " + akActionKW + " action")

	ObjectReference thisRef = Self.GetRef()
	
	;If this fires, that means the player has assigned the dog to an initial settlement.  If the player has no settlements, this will never trigger, so the dog and quest stays in the "adopt" objective state until the player unlocks a home.
	
	;Add the keyword so we know later this dog has been adopted
	thisRef.AddKeyword(CC_PetDogs_HasBeenAdopted)
	
	;Reset text override to standard
	thisRef.SetActivateTextOverride(None)
	
	;Add generic to generic go home refs
	GenericGoHome.GoHomeActors.AddRef(thisRef)
	
	;Set stage and finish the quest, and this event will never be caught again, as the alias is cleared
	Self.GetOwningQuest().SetStage(20)
	
EndEvent