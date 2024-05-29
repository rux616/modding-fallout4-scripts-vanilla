Scriptname CreationClub:RescuedDogScript extends ObjectReference

ReferenceAlias Property CurrentName Auto Hidden
{Used to track the dog's current name stamped from refdata, so we can remove it for renaming later - not intended to be filled in the CK}

Idle Property Dogmeat_Neutral_ToyShake Auto Const Mandatory
MiscObject Property TeddyBear Auto Const Mandatory
Actor thisDogActor

Event OnInit()
	IgnoreFriendlyHits()
	;I have to explicitly cast twice or I get a type mismatch error using Self.GetActorRef	or casting as Actor
	thisDogActor = (Self as ObjectReference) as Actor
	thisDogActor.AllowPCDialogue(true)
EndEvent

;Dogs AI packages don't immediately update with the new ref alias location which feels like a bug.  I just need the AI packages to reset.  ResetAI in the console works every time.
Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)
Debug.Trace("ccBGSFO4050: " + self + " has been directed to transfer to the workshop at " + akNewWorkshop + " with the " \
    + akActionKW + " action")
	
		;The workshop dog AI package does not reload the new RefAlias location when it changes, so the dog stands around until the player either leaves for long periods of time or sleeps a full night, which feels like a bug, so let's kick the dog's AI to make them immediately move
		
		;This issue affects base game dogs as well, but felt more obvious here since more attention is on a new shiny dog
		
		Utility.Wait(3.0) ;no wait time was too short, 1.0 worked, but let's give ample time to make sure settlement assignment finished
		thisDogActor.EvaluatePackage(True)
	
EndEvent