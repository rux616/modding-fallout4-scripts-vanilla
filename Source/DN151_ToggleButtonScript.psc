Scriptname DN151_ToggleButtonScript extends DN151_WaterObject Hidden
{Script for the DN151 water puzzle toggle buttons. Toggle the button state based on the water level.}

Group Required_Properties
	int property DeactivateIfAboveThisHeight = -1 Auto Const
	{If >=0, set the toggle button to inactive if the water is above this height. Set it active when the water falls below this height.}
EndGroup

ToggleButtonScript myToggleButton ;Self cast to a ToggleButtonScript.


Event OnInit()
	myToggleButton = (Self as ObjectReference) as ToggleButtonScript
EndEvent

Function PerformWaterUpdateActions(int waterStage, float waterZ)
	if ((waterZ > DeactivateIfAboveThisHeight) && (myToggleButton.GetState() == "Active"))
		myToggleButton.SetActive(False)
	ElseIf ((waterZ <= DeactivateIfAboveThisHeight) && (myToggleButton.GetState() == "Inactive"))
		myToggleButton.SetActive(True)
	EndIf
EndFunction