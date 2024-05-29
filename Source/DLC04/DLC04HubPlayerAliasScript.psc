Scriptname DLC04:DLC04HubPlayerAliasScript extends ReferenceAlias
{For use with freeform activity in the DLC04DialogueSettlement quest.}

; Properties
GlobalVariable Property DLC04FFMaddoxGlobal Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory
Quest Property DLC04DialogueSettlement Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  		if akOldLoc == DLC04NukaTownUSALocation && DLC04FFMaddoxGlobal.GetValue() == 1
    		Debug.Trace("Player has left the Nuka-Town hub location, update global")
    		DLC04DialogueSettlement.SetStage(120)

  		endIf
endEvent