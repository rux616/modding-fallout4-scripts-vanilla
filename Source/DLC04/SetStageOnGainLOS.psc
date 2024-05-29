Scriptname DLC04:SetStageOnGainLOS extends Quest

ReferenceAlias[] Property AliasesToCheckIfPlayerCanSee Auto Const Mandatory

int Property StageToSet = -1 Auto Const Mandatory
{stage to set when ANY aliases in AliasesToCheckIfPlayerCanSee can be seen by player}

Event OnQuestInit()
	RegisterAliasesForLOS()
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
    ;ASSUMES akViewer is player and akTarget is one of the objectrefs in the Aliases in AliasesToCheckIfPlayerCanSee
    
    Debug.Trace(self + "OnGainLOS() akViewer" + akViewer + ", akTarget: " + akTarget + ". Setting StageToSet: " + StageToSet)

    RegisterAliasesForLOS(false)
EndEvent

Function RegisterAliasesForLOS(bool registerForLOS = true)
	int i = 0
    While (i < AliasesToCheckIfPlayerCanSee.length)
    	
    	Actor PlayerRef = Game.GetPlayer()
	    ObjectReference currentRef = AliasesToCheckIfPlayerCanSee[i].GetReference()

	    if registerForLOS
	    	RegisterForDetectionLOSGain(PlayerRef, currentRef)
	    else
	    	UnregisterForLOS(PlayerRef, currentRef)
	    endif
	    
	    i += 1
    EndWhile

EndFunction