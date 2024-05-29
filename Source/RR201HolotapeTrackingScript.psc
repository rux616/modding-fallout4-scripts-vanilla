Scriptname RR201HolotapeTrackingScript extends ObjectReference 
{Script to check to see if the holotape has been given away and needs handling for the Railroad.}


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	; If the holotape is being given to Sturges or Proctor Ingram then let RR201 know (and possibly react)
	if ( akNewContainer == Sturges.GetUniqueActor() || akNewContainer == BoSProctorIngram.GetUniqueActor() )
		(pRR201 as RR201Script).HolotapeGivenAway()
	endif

	; If the holotape is being given to the player let RR201 know, as well
	if ( akNewContainer == Game.GetPlayer() )
		(pRR201 as RR201Script).HolotapePickedUp()
	endif

EndEvent

Quest Property pRR201 Auto Const Mandatory
ActorBase Property Sturges Auto
ActorBase Property BoSProctorIngram Auto
