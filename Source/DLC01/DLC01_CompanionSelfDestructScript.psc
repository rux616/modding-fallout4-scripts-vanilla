Scriptname DLC01:DLC01_CompanionSelfDestructScript extends RobotSelfDestructScript
{A version of RobotSelfDestructScript used for DLC01COMRobotCompanionTalk, to handle the player ordering their robot companion to self-destruct.}

ObjectReference property DLC01RobotSelfDestructOrderRef Auto Const Mandatory

Race property SentryBotRace Auto Const Mandatory
Explosion property RobotSelfDestructExplosion Auto Const Mandatory

int mySoundID
Explosion myExplosion
bool isBiped
bool triggeredSelfDestruct


Event OnEffectStart(Actor akTarget, Actor akCaster)
    ;Clear the Essential and Protected flags.
    ;Force-Dismiss the Companion. (We have to do this because the Follower alias also makes them Essential.)
    FollowersScript.GetScript().DismissCompanion(akTarget, False, True)
    akTarget.SetEssential(0)
    akTarget.SetProtected(0)

    ;Play the self-destruct SFX & VFX.
    PCoreMEltdownVE.play(akTarget)
    akTarget.AddSpell(crCoreMeltdownCloak01)
    mySoundID = NPCRobotSelfDestructChargeA.Play(akTarget)
EndEvent


Event OnActivate(ObjectReference akActivator)
    if ((akActivator == DLC01RobotSelfDestructOrderRef) && (!triggeredSelfDestruct))
        triggeredSelfDestruct = True
        Actor mySelf = GetTargetActor()

        ;pop off any stuff thats left before the main blast
        mySelf.DamageValue(availablecondition1, 100)
        mySelf.DamageValue(availablecondition2, 100)
        mySelf.DamageValue(availablecondition3, 100)
        mySelf.DamageValue(attackconditionalt1, 100)
        mySelf.DamageValue(attackconditionalt2, 100)
        mySelf.DamageValue(rightmobilitycondition, 100)
        mySelf.DamageValue(leftmobilitycondition, 100)

        ;Play the Self-Destruct Explosion
        if (mySelf.GetRace() == SentryBotRace)
            ;Sentry Bots always explode when they die. We don't want two explosions, so trigger
            ;their explosion by killing them.
            mySelf.Kill()
        Else
            mySelf.placeAtMe(RobotSelfDestructExplosion)
        Endif

        ;Deal lethal damage to the robot.
        mySelf.DamageValue(Health, mySelf.GetValue(Health) + 100)

        PCoreMEltdownVE.Stop(mySelf)
        utility.wait(0.15)
        Sound.StopInstance(mySoundID)
    EndIf
EndEvent