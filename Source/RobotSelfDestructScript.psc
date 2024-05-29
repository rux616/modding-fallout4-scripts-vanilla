Scriptname RobotSelfDestructScript extends ActiveMagicEffect
{handles robot self destruction and a few other robot fx that apply to all  bots (chance to burn and frenzy fx.}

    Group Robot_Properties
        Activator property AshPileRobot01 auto const
        {The object we use as a pile.}
    	weapon Property SelfDestructBot Auto Const
        {weapon given to robots when they lose all ability to attack}
    	Sound Property NPCRobotSelfDestructChargeA Auto Const
        {Self destruct charge up sound}
        VisualEffect Property PCoreMEltdownVE Auto Const
        {Visual to attach as they begin to self d}
	    SPELL Property crCoreMeltdownCloak01 Auto Const
        {Radiation cloak spell to use while melting down}
        objectreference property RobotSelfDestructerREF auto const
        {This object will be sending an activate to kill it.}

        Keyword property robotNoDisintegrateOnSelfDestruct auto const
        {Robots with this keyword will take lethal damage when they Self Destruct, but will not be reduced to ash piles.}

        ActorValue  property availablecondition1 Auto const
        ActorValue  property availablecondition2 Auto const
        ActorValue  property availablecondition3 Auto const
        ActorValue  property attackconditionalt1 Auto const
        ActorValue  property attackconditionalt2 Auto const
        ActorValue  property attackconditionalt3 Auto const
        ActorValue  property leftattackcondition Auto const
        ActorValue  property rightattackcondition Auto const
        ActorValue  property braincondition Auto const
        ActorValue  property leftmobilitycondition Auto const
        ActorValue  property rightmobilitycondition Auto const
        ActorValue  property endurancecondition Auto const
        ActorValue  property SpeedMult Auto const

    endgroup

    Group Frenzy_Properties
        float Property fChance auto
        {Chance to change targets every interval}
        float Property fInterval auto
        {The interval to calc to see if the frenzied NPC changes targets. 0=no frenzy}
        EffectShader Property PRobotFrenzyFXS Auto Const
        {FX shader for frenzy}
        VisualEffect Property PFrenzyFXSLightVE Auto Const
        {Attached light for frenzy}
    endgroup

    Group DamageFX_Properties
        EffectShader Property pRobotFireFXS Auto Const
        {FIre fx}
        ActorValue property Health Auto Const
        {AV to test for fire}
    endgroup

    ;below this health % chance to burn on cripple
    float property healthPercentToBurn = 50.0 auto Const
    ;Holds self d sound loacally so we can stop it
    int sound01
    ;Holds actor castor
    actor property selfActorRef auto
    ;holds ExplosionFX locally
    Explosion ExplodeFX
    ;Is the actor a Biped
    bool bBiped
    ;time until self destruct
    float property timeTilDestruct = 10.0 auto Const
    ;timer IDs
    int selfDTimerID =1

;store data about self
Event OnEffectStart(Actor akTarget, Actor akCaster)

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == selfDTimerID
        selfDestruct()

    endif

    if aiTimerID == 0
        pRobotFireFXS.Stop(selfActorRef)

    endif

EndEvent

state SelfDestruct

    Event OnDying(Actor akKiller)
       ;debug.trace("Dying")
       
        CancelTimer(selfDTimerID)
        selfDestruct()
        ;clean up particle fx on death
        PRobotFrenzyFXS.Stop(selfActorref)
        pRobotFireFXS.Stop(selfActorref) 


    endEvent
    
endState

Function FireTimer(Actor selfRef)
    selfActorRef = selfRef
    StartTimer(60, 0)

endFunction

;fx to played when frenzied
Function frenzyFX(float fChance = 0.1, float fInterval = 5.0)
    selfActorRef.StartFrenzyAttack(fChance, fInterval)
    ;palsy blend on bots
    selfActorRef.SetAnimationVariableFloat("fCrippledNoiseRamp", 1.0)
    ;sparks and light
    PRobotFrenzyFXS.Play(selfActorRef)
    PFrenzyFXSLightVE.Play(selfActorRef)

endFunction

;self destruct process start
Function startSelfDestructAndWait(Actor selfRef, Explosion ExplosionType, bool Biped, float akWaitTime)
    ;debug.trace("Starting destruct")
    selfActorRef = selfRef
    ExplodeFX = ExplosionType
    bBiped = Biped
    selfActorRef.equipItem(SelfDestructBot) ;add fake weapon to get them to run after you
    PCoreMEltdownVE.play(selfActorRef) ;play visual fx for meltdown
    selfActorRef.AddSpell(crCoreMeltdownCloak01);add a local radiation fx
    sound01 = NPCRobotSelfDestructChargeA.Play(selfActorRef);start sound fx buildup
    ;set timer and wait to blow
    startTimer(akWaitTime, selfDTimerID)

endFunction

;self destruct process end after timer
Function selfDestruct()
    ;debug.trace("Destructing")
    GoToState("Done")
   ;pop off any stuff thats left before the main blast
    selfActorRef.DamageValue(availablecondition1, 100)
    selfActorRef.DamageValue(availablecondition2, 100)
    selfActorRef.DamageValue(availablecondition3, 100)
    utility.wait(0.1)
    selfActorRef.DamageValue(attackconditionalt1, 100)
    selfActorRef.DamageValue(attackconditionalt2, 100)

    ;only kill SBs legs since the others would fall down
    utility.wait(0.1)
    if !bBiped
        selfActorRef.DamageValue(rightmobilitycondition, 100)

    endif

    if selfActorRef.GetValue(rightmobilitycondition) != 0 || !bBiped
        selfActorRef.DamageValue(leftmobilitycondition, 100)

    endif

    ;Play the Self-Destruct Explosion
    selfActorRef.placeAtMe(ExplodeFX)

    ;Does the robot have the robotNoDisintegrateOnSelfDestruct keyword?
    if (selfActorRef.HasKeyword(robotNoDisintegrateOnSelfDestruct))
        ;If so, we deal lethal damage to them.
        ;We damage health instead of using Kill() to make sure Protected and Essential actors go into bleedout.
        selfActorRef.DamageValue(Health, selfActorRef.GetValue(Health) + 100)
    Else
        ;Otherwise, retain the default behavior from the base game.
        selfActorRef.kill()
        selfActorRef.AttachAshPile(AshPileRobot01)
        utility.wait(0.15)
        selfActorRef.SetAlpha(0.0,True)
    EndIf


    PCoreMEltdownVE.Stop(selfActorRef)
    ;stop sound
    utility.wait(0.15)
    Sound.StopInstance(sound01)

    ;Does the robot have the robotNoDisintegrateOnSelfDestruct keyword?
    if (selfActorRef.HasKeyword(robotNoDisintegrateOnSelfDestruct))
        ;If so, the self-destruct might not kill them (if they're Protected, Essential, Invulnerable, Deferred Kill, etc.)
        ;We need to reset the self-destruct, so if they recover, they can self-destruct again later.
        ResetSelfDestruct()
    EndIf
endFunction

Event OnDying(Actor akKiller)
    ;debug.trace("Dying")
       
    CancelTimer(selfDTimerID)
    ;clean up particle fx on death
     PRobotFrenzyFXS.Stop(selfActorref)
     pRobotFireFXS.Stop(selfActorref) 
     GoToState("Done")

endEvent

state Done
;do nothing

    Event OnCripple(ActorValue akActorValue, bool abCrippled)
        ;do nothing
        
    endEvent

endState


;Do whatever is necessary to allow the robot to Self-Destruct again.
;Scripts that extend this one will likely need to implement their own variants.
Function ResetSelfDestruct()
    GoToState("")
EndFunction