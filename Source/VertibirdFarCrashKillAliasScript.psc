Scriptname VertibirdFarCrashKillAliasScript extends ReferenceAlias
{Kills actors that disembark if the vertibird is far from the player}

Float Property KillDistance = 2000.0 Auto Const
{if any actor gets off the vertibird farther than this from the player, we'll instantly kill them}

Event OnExitFurniture(ObjectReference akActionRef)
	Actor rider = akActionRef as Actor
	ObjectReference vertibird = GetReference()
	debug.trace("Actor " + rider + " getting off bird " + vertibird )
	;wait a second to let people flung from the vertibird fly a little before we test their distance
	;sometimes people can get stuck to a piece of teh destroyed vertibird and fly crazy with them
	Utility.Wait(2)
	float fdistance = Game.GetPlayer().GetDistance(rider)
	if( vertibird && rider && ( fdistance > KillDistance ) )
		debug.trace("Killing " + rider + " that is getting off of vertibird " + vertibird + " because they are too far from the player" )
		rider.Kill()
	else
		debug.trace( "Not killing vertibird rider " + rider + " because they are " + fdistance + " from the player" )
	endIf
EndEvent