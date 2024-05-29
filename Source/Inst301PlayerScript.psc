Scriptname Inst301PlayerScript extends ReferenceAlias
{Tracks location changes on the player to control X6 follow behavior}

Location Property LibertaliaLocation Auto Const
Scene Property Inst301SceneX6ReturnToLibertalia Auto
ReferenceAlias Property Alias_X6 Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from player")
	; watch for player OnLocationChange events:
	if akOldLoc == LibertaliaLocation && akNewLoc != LibertaliaLocation && (GetOwningQuest() as Inst301Script).X6Following == 1
	    	; player leaves the Libertalia location while X6 is following
	   		Inst301SceneX6ReturnToLibertalia.Start()
	   		Utility.Wait(2)
	   		(GetOwningQuest() as Inst301Script).X6Following = 0
	   		Alias_X6.GetActorRef().EvaluatePackage()
	endif
	if akOldLoc != LibertaliaLocation && akNewLoc == LibertaliaLocation && (GetOwningQuest() as Inst301Script).X6Following == 0 && GetOwningQuest().GetStageDone(300)
	    	; player enters the Libertalia location while X6 is not following and stage 300 has been set
	   		(GetOwningQuest() as Inst301Script).X6Following = 1
	   		Alias_X6.GetActorRef().EvaluatePackage()
	endif
endEvent