Scriptname DN017_ToggleButtonDoorScript extends ToggleButtonScript
{Variant of the standard toggle button used for the DN017 Security Doors. Calls the quest to handle opening and closing the door, and keeping it updated on their state.}

Group DN017_Properties
	DN017QuestScript property DN017 Auto Const Mandatory
	{DN017}
EndGroup

State Active
	Event OnActivate(ObjectReference akActionRef)
		Parent.OnActivate(akActionRef)
		DN017.DoorButtonActivated()
	EndEvent
EndState