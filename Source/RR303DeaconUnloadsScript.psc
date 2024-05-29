Scriptname RR303DeaconUnloadsScript extends ReferenceAlias Const Default
{When Deacon unload at the right point set a stage.}

Event OnUnload()
	if ( pRR303.GetStageDone(750) && !pRR303.GetStageDone(800) )
		pRR303.SetStage(802)
	endif
EndEvent

Quest Property pRR303 Auto Const Mandatory
