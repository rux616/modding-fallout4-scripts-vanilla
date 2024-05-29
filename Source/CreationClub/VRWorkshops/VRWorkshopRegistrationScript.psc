Scriptname CreationClub:VRWorkshops:VRWorkshopRegistrationScript extends WorkshopAddLocationsScript

ObjectReference Property DestinationMarkerRef Auto Const Mandatory
{The primary heading marker or map marker for the VR worldspace}

ReferenceAlias Property VRWorkshopTravelMarkerRefAlias Auto Const Mandatory
{The corresponding reserved RefAlias in the VRWorkshopParentQuest}

Function OnQuestInitCustom()
	VRWorkshopTravelMarkerRefAlias.ForceRefTo(DestinationMarkerRef)
EndFunction