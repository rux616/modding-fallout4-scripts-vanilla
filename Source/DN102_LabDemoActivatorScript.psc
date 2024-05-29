Scriptname DN102_LabDemoActivatorScript extends ObjectReference
{Script for the activators associated with the buttons that trigger the lab demos. These buttons call a function on DN102 to manage the demo scenes.}

DN102QuestScript property DN102 Auto Const Mandatory
{DN102}

int property myDemo Auto Const Mandatory
{Demo number associated with this activator.}


Event OnActivate(ObjectReference akActivator)
	DN102.StartLabDemo(myDemo)
EndEvent