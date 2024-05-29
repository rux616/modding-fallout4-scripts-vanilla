Scriptname CZCageGateScript extends ReferenceAlias

Quest Property CZ Auto Const
int Property PreReqStage Auto Const
int Property EndStage Auto Const
Scene Property CZ_TommyInCage_Scene Auto Const
ObjectReference PlayerRef


Event OnInit()
	PlayerRef = Game.GetPlayer()
EndEvent

Event OnActivate(ObjectReference akActionRef)
  ;Debug.Trace("Activated by " + akActionRef)

	if akActionRef == PlayerRef && CZ.GetStageDone(PreReqStage) && !CZ.GetStageDone(EndStage)
		if !CZ_TommyInCage_Scene.IsPlaying()  		
			CZ_TommyInCage_Scene.Start()	
		endif
	endif

EndEvent