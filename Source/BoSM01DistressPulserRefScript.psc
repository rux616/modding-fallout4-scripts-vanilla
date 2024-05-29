Scriptname BoSM01DistressPulserRefScript extends ObjectReference Hidden Const
{Script on the BoSM01 Distress Pulser Refs. On load, makes sure the distress signals quest is running so their scenes play correctly.}
;
;BoSM01DistressSignals is normally started by BoSM01, which in turn is started by MQ102 15. But this acts as a failsafe in case
;of debug testing that skipped MQ102, which otherwise causes this quest to behave strangely.

Quest property BoSM01DistressSignals Auto Const Mandatory
{BoSM01DistressSignals}

Quest property BoSM01 Auto Const Mandatory
{BoSM01}

Event OnLoad()
	if (!BoSM01DistressSignals.IsRunning())
		BoSM01.Start()
	EndIf
EndEvent