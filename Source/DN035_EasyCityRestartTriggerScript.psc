Scriptname DN035_EasyCityRestartTriggerScript extends ObjectReference Const Hidden
{During the Prydwen Crash, we have to disable the radios at Easy City Downs to prevent interference. This trigger re-enables them if appropriate.}

Quest property DN035_EasyCityRadioOverrides Auto Const Mandatory
{The Radio Overrides quest.}

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		DN035_EasyCityRadioOverrides.Stop()
		Self.DisableNoWait()
	EndIf
EndEvent

Event OnUnload()
	DN035_EasyCityRadioOverrides.Stop()
	Self.DisableNoWait()
EndEvent