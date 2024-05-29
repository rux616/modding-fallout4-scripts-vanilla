Scriptname DN084_DescentActorRefScript extends Actor Hidden Const
{Script for the enemies in the DN084 Descent Sequence.}
;
;The enemies in the descent sequence emerge (or teleport in) as the elevator passes various floors, then retreat once the elevator is out of range.
;This script sets actor values that control their packages. It also handles teleporting in the synths (normally handled by TeleportInActorScript)
;since this sequence requires more precise timing than the default script provides.

Group Required_Properties
    ActorValue property DN084DescentStartFloor Auto Const Mandatory
    {Start Floor AV.}

    ActorValue property DN084DescentEndFloor Auto Const Mandatory
    {End Floor AV.}

    ActorValue property DN084_DescentHasTeleported Auto Const Mandatory
    {AV indicating if this actor has teleported in.}

    int property startFloorValue  Auto Const Mandatory
    {When the elevator reaches this floor, the enemy will emerge.}

    int property endFloorValue  Auto Const Mandatory
    {When the elevator reaches this floor, the enemy will retreat.}
EndGroup

Group Teleport_Properties
    ;NOT Mandatory-- the BoS soldiers don't teleport.
    Spell property TeleportInSpell Auto Const
EndGroup


Event OnLoad()
    ;Set the start and end floor actor values.
	Self.SetValue(DN084DescentStartFloor, startFloorValue)
	Self.SetValue(DN084DescentEndFloor, endFloorValue)
EndEvent

Function UpdateDescentActor(int newFloor)
    ;Called by DN084_QuestScript. Each time the elevator reaches a new floor, check to see if we should start or end our attack run.
	Self.EvaluatePackage()
	if ((Self.IsEnabled()) && (newFloor <= startFloorValue) && (Self.GetValue(DN084_DescentHasTeleported) == 0) && (TeleportInSpell != None))
		;Debug.Trace(Self + " Teleports in!")
		Self.SetValue(DN084_DescentHasTeleported, 1)
        ;Start a timer to run the Teleport VFX in a different thread.
		Self.AddSpell(TeleportInSpell)
	EndIf
EndFunction