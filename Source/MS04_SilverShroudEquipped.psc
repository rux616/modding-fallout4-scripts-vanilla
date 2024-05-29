Scriptname MS04_SilverShroudEquipped extends ObjectReference
{Sets a quest stage when the Silver Shroud is equipped.}

Quest Property myQST auto
{Quest upon which to set stage. Default is the Alias's owning quest.}
int Property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int Property StageToSet auto
{Set this stage when the player picks up this item.}

Event OnEquipped(Actor akActor)

 	Debug.Trace(self + "OnEquipped()")

	if ( akActor == Game.GetPlayer() )
		Debug.Trace(self + "OnEquipped() by player.")
		myQST.SetStage(stageToSet)

		;Add temp perk to the player
		Debug.Trace("Fake perk added.")
		Game.GetPlayer().AddPerk(pShroudPerk)
	endIf
	
	
endEvent

Event OnUnequipped(Actor akActor)

	if ( akActor == Game.GetPlayer() )
		;Remove temp perk to the player
		Game.GetPlayer().RemovePerk(pShroudPerk)
	endIf

EndEvent


Perk Property pShroudPerk Auto Const
