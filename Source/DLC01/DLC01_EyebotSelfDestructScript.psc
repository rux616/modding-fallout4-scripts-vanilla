Scriptname DLC01:DLC01_EyebotSelfDestructScript extends RobotSelfDestructScript
{Self Destruct script for the Mechanist's Eyebots.}
;
;In the base game, Eyebots didn't have the race-based self destruct script the other robots did (eg. abProtectronSelfDestruct).
;This is an actor-level version of the standard self-destruct script that adds the ability for this specific group of Eyebots.

Explosion Property robotSelfDestructExplosionSmall Auto Const Mandatory
{Explosion FX for this specific Robot when they self destruct.}

;Local variables.
bool onFire = false     ;do once for setting on fire.
int ChaseSpeed = 200    ;Actor's chase speed once the Self Destruct has started.
int sound01             ;Holds self d sound loacally so we can stop it
Explosion ExplodeFX     ;holds ExplosionFX locally
bool bBiped             ;Is the actor a Biped
int selfDTimerID = 1    ;timer IDs

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
        if akActionRef == RobotSelfDestructerREF
            goTostate("SelfDestruct")
	   Endif
	EndEvent
EndState


State SelfDestruct
    Event OnBeginState(string asOldState)
        Actor selfRef = Self.GetTargetActor()
        selfRef.SetValue(SpeedMult, ChaseSpeed)
        StartSelfDestructAndWait(selfRef, robotSelfDestructExplosionSmall, true, timeTilDestruct)
    EndEvent
endState

;self destruct process start
Function startSelfDestructAndWait(Actor selfRef, Explosion ExplosionType, bool Biped, float akWaitTime)
    selfActorRef = selfRef
    ExplodeFX = ExplosionType
    bBiped = Biped
    selfActorRef.equipItem(SelfDestructBot)
    PCoreMEltdownVE.play(selfActorRef)
    selfActorRef.AddSpell(crCoreMeltdownCloak01)
    sound01 = NPCRobotSelfDestructChargeA.Play(selfActorRef)
    startTimer(akWaitTime, selfDTimerID)
EndFunction

Function selfDestruct()
    GoToState("Done")

    ;blow DF up based on race
    selfActorRef.placeAtMe(ExplodeFX)
    selfActorRef.kill()
    ;DO NOT attach pile
    ;selfActorRef.AttachAshPile(AshPileRobot01)

    utility.wait(0.15)
    selfActorRef.SetAlpha (0.0,True)
    ;stop fx

    PCoreMEltdownVE.Stop(selfActorRef)
    ;stop sound
    utility.wait(0.15)
    Sound.StopInstance(sound01)
endFunction

Function ResetSelfDestruct()
    GoToState("")
    Actor selfRef = self.GetTargetActor()
    selfRef.RemoveSpell(crCoreMeltdownCloak01)
    pRobotFireFXS.Stop(selfRef)
    onFire = False
EndFunction