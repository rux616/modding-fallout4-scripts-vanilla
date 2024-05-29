Scriptname BoSM01OnActivatePlayScene extends ObjectReference Const Hidden
{Used for the power armor frames at the BoSBattleSite. Plays a scene when the player activates them.}

Scene property BoSM01_Player_BattleSitePowerArmorComments Auto Const Mandatory
{The scene to play when the player activates the armor.}

Event OnLoad()
	Self.SetNoFavorAllowed()
	Self.BlockActivation()
EndEvent

Event OnActivate(ObjectReference akActivator)
	Debug.Trace("A")
	if ((akActivator == Game.GetPlayer()) && (!BoSM01_Player_BattleSitePowerArmorComments.IsPlaying()))
		Debug.Trace("B")
		BoSM01_Player_BattleSitePowerArmorComments.Start()
	EndIf
EndEvent