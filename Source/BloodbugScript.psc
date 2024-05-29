Scriptname BloodbugScript extends Actor Conditional
{Gameplay and VFX Scripting for the Bloodbug.}

int property sacState auto conditional
{State of the bloodbug's blood sac. 0=Empty, 1=Red, 2=Green, 3=Random.}

Keyword property ActorTypeIrradiated auto
{If this keyword is on the target, fill with green blood, otherwise with red.}

MiscObject property BloodbugSacEmpty auto
{Empty sac.}

MiscObject property BloodbugSacFilledRed auto
{Red blood filled sac}

MiscObject property BloodbugSacFilledGreen auto
{Green blood filled sac}

Explosion property BloodbugDeathRedExplosion auto
{Red blood death explosion}

Explosion property BloodbugDeathGreenExplosion auto
{Green blood death explosion}

ActorValue property AvailableCondition2 auto
ActorValue property AvailableCondition1 auto

Ammo property AmmoBloodbug auto
{Bloodbug blood spit ammo}

String property BloodbugFeedEventName = "FillingRed" auto hidden const     ;Event that fills the blood sac.
String property BloodbugSpitEventName = "WeaponFire" auto hidden const      ;Event that drains the blood sac.

ObjectReference lastAggressor   ;Track which actor the last hit event came from so death can be attributed properly.
bool initialized                ;Have we run initialization yet?

Event OnLoad()
    if Is3DLoaded()
        if !initialized
            initializeBloodbug()
        endIf
        RegisterForHitEvent(self) ; get one hit event, any source
    endif
EndEvent

Event onUnload()
    UnregisterForAllHitEvents()
    ;added by markiepoo
    UnregisterForAnimationEvent(self, BloodbugFeedEventName)
    UnregisterForAnimationEvent(self, BloodbugSpitEventName)
endEvent

Function InitializeBloodbug()
    ;Debug.Trace("Initializing")
    initialized = True

    ;Removed by Mark on 5/21 and added to creature as armor add on
    ;Set up VFX.
    ;BloodbugBugNoseBloodFX.play(Self)

    ;Register for feed events.
    RegisterForAnimationEvent(self, BloodbugFeedEventName)
    RegisterForAnimationEvent(self, BloodbugSpitEventName)

    ;Determine initial state.
    if (sacState == 3)
        sacState = Utility.RandomInt(0, 2)
        ;Debug.Trace(Self + " RANDOM SELECTION: " + sacState)
    endif
    if (sacState == 1)
        Self.playSubgraphAnimation("FillRed")
        ;Debug.Trace(Self + " Starts Red.")
    elseif (sacState == 2)
        Self.playSubgraphAnimation("FillGreen")
        ;Debug.Trace(Self + " Starts Green.")
    endif
    ;Debug.Trace("Sac State for " + Self + " is " + sacState)
EndFunction

Event OnAnimationEvent(ObjectReference source, string eventName)
    if ((eventName == BloodbugFeedEventName) && (sacState == 0) && (Self.GetValue(AvailableCondition2) > 0))
        Debug.Trace(Self + " received Event: " + eventName)
        if (Self.GetCombatTarget() != None && Self.GetCombatTarget().HasKeyword(ActorTypeIrradiated))
            Self.AddItem(AmmoBloodbug, 4 - Self.GetItemCount(AmmoBloodbug)) ;Give Blood Ammo
            Self.EquipItem(AmmoBloodbug)                                    ;Force equip it.
            sacState = 2                                                    ;Record that we're filled w/ Green Blood
            Self.SetValue(AvailableCondition1, 1)        ;Reduce sac health to 1.
            Self.playSubgraphAnimation("FillGreen")     ;Fill w/ Green Blood
            Self.EvaluatePackage()
            ;Debug.Trace("BLOODBUG: Sac State Updated")
            DrinkBloodSpell.Cast(self)
        else
            Self.AddItem(AmmoBloodbug, 4 - Self.GetItemCount(AmmoBloodbug)) ;Give Blood Ammo
            Self.EquipItem(AmmoBloodbug)                ;Force equip.
            sacState = 1                                ;Record that we're filled w/ Red Blood
            Self.SetValue(AvailableCondition1, 1)        ;Reduce sac health to 1.
            Self.playSubgraphAnimation("FillRed")       ;Fill w/ Red Blood
            Self.EvaluatePackage()
            ;Debug.Trace("BLOODBUG: Sac State Updated")
            DrinkBloodSpell.Cast(self)
        endif
    endif
    if ((eventName == BloodbugSpitEventName) && (sacState != 0))
        Self.playSubgraphAnimation("emptyRed")
        sacState = 0
	    Self.EvaluatePackage()
        ;Debug.Trace("BLOODBUG: Sac State Updated")
    endIf
EndEvent

;Console function for debugging.
Function ConsoleFillButt()
       Self.AddItem(AmmoBloodbug, 4 - Self.GetItemCount(AmmoBloodbug)) ;Give Blood Ammo
       Self.EquipItem(AmmoBloodbug)                ;Force equip.
       sacState = 1                                ;Record that we're filled w/ Red Blood
       Self.SetValue(AvailableCondition1, 1)        ;Reduce sac health to 1.
       Self.playSubgraphAnimation("FillRed")       ;Fill w/ Red Blood
       Self.EvaluatePackage()
       ;Debug.Trace("BLOODBUG: Sac State Updated")
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference aggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    lastAggressor = aggressor
    RegisterForHitEvent(self) ; re-add the event so we get another one
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
    Debug.Trace("Cripple received " + akActorValue)
    ;AvailableCondition2= Sac.
    if ((akActorValue == AvailableCondition2) && (sacState > 0) && abCrippled)
        ;Debug.Trace("Bloodbug sac was crippled while full!")
        ;Debug.Trace("Bloodbug explodes!")
        Self.Kill(lastAggressor as Actor)
        if (sacState == 1) ;RED Sac?
            Self.PlaceAtMe(BloodBugDeathRedExplosion)
            Self.playSubgraphAnimation("PopRed")
        Else
            Self.PlaceAtMe(BloodBugDeathGreenExplosion)
            Self.playSubgraphAnimation("PopGreen")
        EndIf
    EndIf
EndEvent

Event OnDying(Actor akKiller)
    if (Self.GetValue(AvailableCondition1) > 0)
        if (sacState == 1)
            Self.AddItem(BloodbugSacFilledRed)
        ElseIf (sacState == 2)
            Self.AddItem(BloodbugSacFilledGreen)
        EndIf
    EndIf
EndEvent
SPELL Property DrinkBloodSpell Auto Const
