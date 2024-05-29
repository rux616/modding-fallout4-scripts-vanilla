Scriptname MinDefendCastleAttackScript extends MinDefendCastleAttackROOT

Group General
    ReferenceAlias Property WorkshopAlias const auto

    WorkshopParentScript Property WorkshopParent Auto Const

    REParentScript Property REParent Auto
    {REParent quest, used to send cleanup custom event }

    RefCollectionAlias Property SpawnMarkers Auto Const

    RefCollectionAlias Property TeleportMarkers Auto Const

    int Property attackStrength auto hidden
    { passed in by starting event - used to determine how many attackers to enable }

    int Property attackStartStage = 150 auto const
    { stage which indicates the attack has started }
    int Property attackDoneStage = 200 auto const
    { stage which indicates the attack is done - attackers killed }

    ActorValue Property TeleportRefCollOptionalRequired Auto
    {Used for Teleporting script on refcollectionalias}
    ActorValue Property TeleportRefCollOnLoad Auto
    {Used for Teleporting script on refcollectionalias}
    ActorValue Property MinDefendCastleAttackerPhase Auto
    {This controls controls their combat travel packages}
    ActorValue Property MinDefendCastleAttackFromSouth Auto
    {This controls controls their combat travel packages}

    int Property MaxActiveAttackers = 15 Auto
    {used to throttle maximum allowed attackers for performance}

    ObjectReference Property MinDefendCastleLoadedRef Auto Const

    GlobalVariable Property MinCastleAttackersDeadPercent Auto Const
    int Property ObjectiveNumberDeathTracker = 30 Auto Const
EndGroup

Group DefenderProperties
    RefCollectionAlias Property Defenders Auto Const
    ReferenceAlias Property RonnieShaw Auto Const
    ReferenceAlias Property MinutemanBackupSpokesman Auto Const
    ReferenceAlias Property MinutemenRadioAnnouncer Auto Const

    RefCollectionAlias Property DefendMarkers Auto Const
    RefCollectionAlias Property DefendBreachMarkers Auto Const

    RefCollectionAlias Property AttackMarkers02N Auto Const
    RefCollectionAlias Property AttackMarkers02S Auto Const

    Keyword Property LinkCustom01 Auto Const
    Keyword Property LinkCustom02 Auto Const
    Keyword Property LinkCustom03 Auto Const
    Keyword Property LinkCustom04 Auto Const
    
    int property minInitialDefenders = 8 auto const
    { what's the minimum initial defenders - if there are less, enable up to 5 created Minutemen }
EndGroup

Group RadioProperties CollapsedOnRef
    Scene Property MinDefendCastleRadioAnnouncement Auto
    {Radio Announcer Scene}
    Scene Property MinDefendCastleRadioAfterBattle Auto
    {Post Battle Report}

    ;These Globals are used for the radio announcer
    GlobalVariable Property MinDefendCastleRadioTeleport Auto
    GlobalVariable Property MinDefendCastleRadioSquadNW Auto
    GlobalVariable Property MinDefendCastleRadioSquadSW Auto
    GlobalVariable Property MinDefendCastleRadioVertibird1 Auto
    GlobalVariable Property MinDefendCastleRadioVertibird2 Auto
    GlobalVariable Property MinDefendCastleRadioVertibird3 Auto
    GlobalVariable Property MinDefendCastleRadioBehemoth Auto

    GlobalVariable Property MinDefendCastleWallsBreached Auto
    GlobalVariable Property MinDefendCastleWallsBreachedExpired Auto

    
    ObjectReference Property DN133CastleSpeakerControllerRef Auto
EndGroup

;These quest are what we shove the vertibirds into for control
Group VertibirdQuests CollapsedOnRef
    Quest[] Property MinDefendCastleVertibirdQuests Auto Const
EndGroup

int CleanupStage = 200


Event OnInit()

endEvent

;Game Time Timers (in game hours)
float TimeoutAttackInHours = 2.0
int TimerNumTimeoutAttack = 99

Event OnTimerGameTime(int aiTimerID)
    debug.trace(self + "OnTimerGameTime >> " + aiTimerID)

	if aiTimerID == TimerNumTimeoutAttack && !GetStageDone(attackStartStage)
		; timer has expired without attack actually being triggered
        debug.trace(self + " setting stage " + attackStartStage)
		SetStage(attackStartStage)
	elseif aiTimerID == CleanupStage
		; send cleanup event - will resolve if everything is unloaded
		REParent.SendCustomEvent("RECheckForCleanup")
	endif
EndEvent

;Real Time Timers (in seconds)
int TimerNumAttackPhase0 = 10
float recheckTime = 10.0
int TimerNumRecheckAttackPhase = 111

Event OnTimer(int aiTimerID)
    debug.trace(self + "OnTimer >> " + aiTimerID)
    ;The band of timerIDs from 10-30 is reserved for phases
    if aiTimerID >= TimerNumAttackPhase0 && aiTimerID <= (TimerNumAttackPhase0 + 20)
        ;phase = TimerNumAttackPhase0 = 10
        ;   so the aiTimer - TimerNumAttackPhase0 should be the phase number
        int phaseToStart = aiTimerID - TimerNumAttackPhase0
        ;Start the phase
        Debug.Trace(self + "On Timer has decided it is time to try to start phase >> " + phaseToStart + " <<")
        TryToStartAttackPhase(phaseToStart)

    ;This is the recheck timer trying to recheck
    elseif aiTimerID == TimerNumRecheckAttackPhase
        Debug.Trace(self + " RecheckTimer!")
        TryToStartAttackPhase(-1)


    ;;;;;;;;;;;;;;;Combat Bark Timers;;;;;;;;;;;;;
    ;WallsBreache(200)
    elseif aiTimerID == TimerNumWallsBreached
        MinDefendCastleWallsBreachedExpired.SetValue(1)
    else
    endif
endEvent


bool CastleIsLoaded = true
;This function receives events thrown from an activator at the castle
;   It should manage pausing/unpausing the battle
;   We shouldn't need to cancel individual phase timers
;       as they just flag the array that the phase is ready to spawn
;       then when we trigger the recheck, it should start them if ready and able
Function SetAreaLoaded(Bool isAreaLoaded)
    ;/if GetStage() < 150
        if !isAreaLoaded
            Debug.Trace (self + "::: CASTLE HAS UNLOADED >> PAUSE ATTACK")
            CancelTimer(TimerNumRecheckAttackPhase)

        else ;isAreaLoaded == True
            Debug.Trace (self + "::: CASTLE HAS LOADED >> UNPAUSE ATTACK")
            ;This is call is what would happen from a recheck timer
            TryToStartAttackPhase(-1)
        Endif/;
    
    if GetStageDone(attackStartStage) && !GetStageDone(attackDoneStage)
        if !isAreaLoaded
            Debug.Trace (self + "::: CASTLE HAS UNLOADED >> PAUSE ATTACK")
            CancelTimer(TimerNumRecheckAttackPhase)

        else ;isAreaLoaded == True
            Debug.Trace (self + "::: CASTLE HAS LOADED >> UNPAUSE ATTACK")
            ;This is call is what would happen from a recheck timer
            TryToStartAttackPhase(-1)
        Endif
    Endif

    CastleIsLoaded = isAreaLoaded
EndFunction

;This function is called by the MinDefendCastleScript
;It starts a timer for when the attackers show up whether you are ready or not

function startTimeOutAttack()
    debug.trace(self + " startTimeOutAttack: TimeoutAttackInHours=" + TimeoutAttackInHours + ", TimerNumTimeoutAttack=" + TimerNumTimeoutAttack)
    StartTimerGameTime(TimeoutAttackInHours, TimerNumTimeoutAttack)
endFunction

function StartAttack(float initialWaitTime = 5.0)
    debug.tracestack(self + " StartAttack")
    ;Cancel the timout timer if it hasn't occured
    CancelTimerGameTime(TimerNumTimeoutAttack)

    ;Reset whether the walls have been breached
    MinDefendCastleWallsBreached.SetValue(0)

    ; reset days since last attack on this workshop
    WorkshopParent.RecordAttack(WorkshopAlias.GetRef() as WorkshopScript, AttackerTypes[AttackerTypeActual].AttackerFaction)

    ;Clean up any old data for safety
    AttackersActiveCurrently = 0
    TotalDeadAttackers = 0

    ; enable/kill attackers
    debug.trace(self + "    enabling attackers")
    totalAttackers = Attackers.GetCount()
    SetObjectiveVars()

    SetUpDefenders()

    ;This releases the attackers and starts the whole thing running
    (DN133CastleSpeakerControllerRef as DN133CastleSpeakerControllerScript).SetOn()
    MinDefendCastleRadioAnnouncement.Start()

    Utility.Wait(initialWaitTime)
    PhaseStates = new Int[10]
    TryToStartAttackPhase(0)
    ; if attack isn't resolved in X hours, can resolve offscreen
    ;NOT CURRENTLY USED
    ;StartTimerGameTime(2.0, CleanupStage)

    
endFunction

; called by MinutemenCentralQuest to restart radio scene
function StartRadioScene()
    if MinDefendCastleRadioAnnouncement.IsPlaying() == false
        debug.trace(self + " StartRadioScene")
        MinDefendCastleRadioAnnouncement.Start()
        debug.trace(self + " " + MinDefendCastleRadioAnnouncement.IsPlaying())
    endif
endFunction

;This Function adds all the defenders to the refCollectionAlias and gives them links to markers
Function SetUpDefenders()
    ;add everyone to the Defender alias
    ObjectReference[] defenderRefs = WorkshopParent.GetWorkshopActors(WorkshopAlias.GetRef() as WorkshopScript)
    Defenders.AddArray(defenderRefs)
    ; remove radio guy - we want him to stay on the radio
    Defenders.RemoveRef(MinutemenRadioAnnouncer.GetRef())
    ;Then link them to the markers
    Defenders.LinkCollectionTo(DefendMarkers, LinkCustom01, wrapLinks = true)
    Defenders.LinkCollectionTo(DefendBreachMarkers, LinkCustom02, wrapLinks = true)
EndFunction

; call this on startup - enable any initial reinforcements we need and assign to the workshop
function SetUpInitialReinforcements()
    WorkshopScript workshopRef = (WorkshopAlias.GetRef() as WorkshopScript)
    int currentDefenders = workshopRef.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int

    if minInitialDefenders > currentDefenders
        ; enable some of the initial defenders
        ; how many?
        int enableCount = minInitialDefenders - currentDefenders
        if enableCount > Defenders.GetCount()
            enableCount = Defenders.GetCount()
        endif

        debug.trace(self + " enableCount=" + enableCount)
        int i = Defenders.GetCount() - 1
        while i > -1
            ; loop through defenders, enable or remove refs as we go
            Actor theDefender = Defenders.GetAt(i) as Actor
            if enableCount > 0
                debug.trace(self + " assigning " + theDefender + " as reinforcement")
                ; enable
                theDefender.Enable()
                ; assign to workshop
                WorkshopParent.AddActorToWorkshopPUBLIC(theDefender as WorkshopNPCScript, workshopRef)
                ; make unprotected so they can die
                theDefender.SetProtected(false)
                enableCount += -1
            else
                debug.trace(self + " deleting " + theDefender)
                ; remove ref
                Defenders.RemoveRef(theDefender)
            endif
            i += -1
        endWhile
    endif
    ; always add backup spokesman to Defenders collection
    actor spokesman = MinutemanBackupSpokesman.GetActorRef()
    Defenders.AddRef(spokesman)
    WorkshopParent.AddActorToWorkshopPUBLIC(spokesman as WorkshopNPCScript, workshopRef)
    ; make unprotected so they can die
    spokesman.SetProtected(false)
endFunction

int iIncreasePerDeath
Function SetObjectiveVars()
    Debug.Trace(self + ": Setting Objective Vars")
    ;Set the vars needed to do this...
    ;myQuest.ModObjectiveGlobal(iIncreasePerDeath, MinCastleAttackersDeadPercent, ObjectiveNumberDeathTracker, 100.0)
    myQuest = self as quest
    float fIncreasePerDeath = (100.0/(totalAttackers-2))
    TotalActorsToKill = (totalAttackers-2)
    Debug.Trace(self + "::::: (totalAttackers-2) == " + (totalAttackers-2))
    Debug.Trace(self + "::::: fIncreasePerDeath == " + fIncreasePerDeath)
    iIncreasePerDeath = Math.Ceiling(fIncreasePerDeath)
    Debug.Trace(self + "::::: iIncreasePerDeath == " + iIncreasePerDeath)
    MinCastleAttackersDeadPercent.SetValue(0)
EndFunction

int attackerIndex = 0
int totalAttackers
int TotalDeadAttackers = 0
int attackPhase = 0
int AttackerTypeActual
int AttackersActiveCurrently
Actor[] DeadActorsForCleanup
int[] PhaseStates
quest myQuest
int TotalActorsToKill

;This attempts to start the attack phase
;   number of active attackers is throttled for performance
;   if it can't it marks it to check next time it is possible
Function TryToStartAttackPhase(int PhaseNumber)
    Debug.Trace(Self + ": Trying To start Attack Phase # " + PhaseNumber)
    ;If this is a recheck phase, skip
    if PhaseNumber != -1
        ;If this phase has not started, flag it to start
        if PhaseStates[PhaseNumber] == 0
            Debug.Trace(Self + ": Setting Phase Number # " + PhaseNumber + " to 1")
            PhaseStates[PhaseNumber] = 1
        endif
    endif

    ;If the Castle is loaded we can try to start a phase
    ;   If the castle is NOT loaded, do nothing and wait for recheck
    ;   External OnCellAttach call will fire off a recheck
    ;
    ;   But do a double check anyway. There were weird edge cases where you could leave at the right time and mess things up
    if MinDefendCastleLoadedRef.Is3dLoaded()
        CastleIsLoaded = True
    else
        CastleIsLoaded = false
    Endif

    if CastleIsLoaded
        int i = 0
        int count = AttackerPhases.Length
        int TotalToEnable
        bool Bail = false
        While i < count && !Bail
            ;if this phase is waiting to be active
            if PhaseStates[i] == 1
                ;Count how many actors we are trying to enable
                TotalToEnable = AttackerPhases[i].AttackerSquad.GetCount()

                ;***NOT SURE IF THIS IS NEEDED
                ;if AttackerPhases[i].VertibirdPhase
                ;    TotalToEnable += 4  ;Vertibirds have 4 actors, Technically 5?
                ;endif

                Debug.Trace (self + "::: TotalToEnable = " + TotalToEnable)

                ;If the number we want to enable is less than the current active do it!
                if (AttackersActiveCurrently + TotalToEnable) <= MaxActiveAttackers && AttackerPhases[i].VertibirdPhase
                    ;Check if a vertibird quest is free
                    ;if IsAVertibirdQuestAvailible()
                        IncrementActorCurrentlyActive(TotalToEnable)
                        StartAttackPhase(i)
                        ;Set this phase state to 2 so we know it is done
                        PhaseStates[i] = 2
                        Debug.Trace(Self + ": Setting Phase Number # " + i + " to 2")
                    ;endif

                elseif (AttackersActiveCurrently + TotalToEnable) <= MaxActiveAttackers
                        IncrementActorCurrentlyActive(TotalToEnable)
                        StartAttackPhase(i)
                        ;Set this phase state to 2 so we know it is done
                        PhaseStates[i] = 2



                ;If not lets try to clean up some dead actors
                ;Check the number of dead actors, if there is enough clear some
                elseif DeadActorsForCleanup.Length >= TotalToEnable
                    ;There are enough so clean them up!
                    int CleanupIndex = 0
                    while cleanupIndex < TotalToEnable
                        CleanupActor()
                        cleanupIndex +=1
                    EndWhile
                    ;Then subtract this by one so we can recheck
                    i -= 1

                ;Not enough to clean up, so bail and set a recheck timer
                else
                    bail = true
                    StartTimer(recheckTime, TimerNumRecheckAttackPhase)
                endif
            endif
            i += 1
        EndWhile
    else
        Debug.Trace (self + "::: CASTLE IS NOT LOADED >> PAUSING ATTACK ")
    Endif
EndFunction

;This should clean up dead actors for throttled number active
Function CleanupActor()
    ;Disable the actor, Reset it, Remove the entry from the array
    ; Then decriment the currently active Actors
    DeadActorsForCleanup[0].Disable()
    DeadActorsForCleanup[0].Reset()
    DeadActorsForCleanup.Remove(0)
    IncrementActorCurrentlyActive(-1)
EndFunction


Bool BattleHasEnded = false
Function AddActorToDeadList(Actor DeadActorRef)
    debug.trace(self + "AddActorToDeadList " + DeadActorRef)
    ;if this is none, make it an array with no elements
    if DeadActorsForCleanup == none
        DeadActorsForCleanup = new actor[0]
    endif
    DeadActorsForCleanup.Add(DeadActorRef)
    TotalDeadAttackers += 1
    ;CheckBattleEnd()

    ;Here we mod the global used for tracking how many guys we have killed
    ;if we reach 100% set the end stage
    if BattleHasEnded == false
       

        
        float currentPercent = MinCastleAttackersDeadPercent.GetValue()
        float previousPercent = (((TotalDeadAttackers as float)-1)/(TotalActorsToKill as float)) * 100
        float newPercent = ((TotalDeadAttackers as float)/(TotalActorsToKill as float)) * 100
        Debug.Trace(Self + "::::: previousPercent == " + previousPercent)
        Debug.Trace(Self + "::::: newPercent == " + newPercent)
        Debug.Trace(Self + "::::: currentPercent == " + currentPercent)
        ;Math Trickery to decide if it is time to redisplay the objective
        bool redisplayObjective = math.Floor(newPercent/10) > math.Floor(currentPercent/10)
        Debug.Trace(Self + "::::: redisplayObjective == " + redisplayObjective)
        float fModValue = newPercent - previousPercent
        Debug.Trace(Self + "::::: fModValue == " + fModValue)

        ;If we pass a redisplay objective threshold
        if redisplayObjective
            ;Force the fmod Value to ten so we stay at 10%, 20%, etc
            fModValue = 10.0
        else
            ;Otherwise set the fModValue to 0
            fModValue = 0.0
        endif
        ;/ ;;;;;;;;;;;; OLD METHOD ;;;;;;;;;;
        ; redisplay objective or not?
        ; every 10%?
        float currentPercent = MinCastleAttackersDeadPercent.GetValue()
        float newPercent = currentPercent + iIncreasePerDeath
        bool redisplayObjective = math.Floor(newPercent/10) > math.Floor(currentPercent/10)
        debug.trace(self + " AddActorToDeadList: redisplayObjective=" + redisplayObjective + "(newPercent=" + newPercent + ")")

        ; don't go over 100%
        newPercent = math.Min(newPercent, 100.0)
        float fModValue = iIncreasePerDeath
        /;

        ; always redisplay at end, and make sure don't increase above 100%
        if newPercent >= 98.0
            redisplayObjective = true
            fModValue = 100 - currentPercent
        endif

        if redisplayObjective
            if myQuest.ModObjectiveGlobal(fModValue, MinCastleAttackersDeadPercent, ObjectiveNumberDeathTracker, 100.0, abCountingUp = true, abCompleteObjective = true, abRedisplayObjective = redisplayObjective)
                DoBattleEnd()
            else
                debug.trace(self + " AddActorToDeadList: ModObjectiveGlobal returned false")
            endif
        endif
    endif
EndFunction


;Do whatever we need to when the battle is over
Function DoBattleEnd()
    debug.trace(self + " DoBattleEnd")
    ;Here is where we actually do the stuff
    BattleHasEnded = true
    SetStage(CleanupStage)  ;This should set stage 200
    MinDefendCastleRadioAnnouncement.Stop()
    ; KMK - removed this - MinDefendCastleRadioAfterBattle is started in stage 300, after Ronnie's speech
;    utility.wait(2.0)
;    MinDefendCastleRadioAfterBattle.Start()
    ReadyAttackersForPostCleanup()
EndFunction

Function ReadyAttackersForPostCleanup()
    debug.Trace(self + ": is registering attackers for onUnload")
    int i = 0
    int count = Attackers.GetCount()
    Actor currentAttacker
    while i < count
        currentAttacker = (Attackers.GetAt(i) as actor)
        if !currentAttacker.isDead() && !currentAttacker.isDisabled()
            RegisterForRemoteEvent(currentAttacker, "OnUnload")
            debug.Trace(self + "::::: Registered Attacker >> " + currentAttacker + " << for OnUnload")
        endif
        i += 1
    endWhile
EndFunction

Event ObjectReference.OnUnload(ObjectReference akSender)
    debug.Trace(self + "::::: Received onUnload from akSender >> " + akSender)
    UnRegisterForRemoteEvent(akSender, "OnUnload")
    akSender.Disable()
    akSender.Reset()
EndEvent

;;
Function DoBackupPostCleanup()
    debug.Trace(self + ": DoBackupPostCleanup")
    int i = 0
    int count = Attackers.GetCount()
    Actor currentAttacker
    while i < count
        currentAttacker = (Attackers.GetAt(i) as actor)
        ;if !currentAttacker.isDead() && !currentAttacker.isDisabled()
            debug.Trace(self + "::::: Cleaning up Ref >> " + currentAttacker)
            UnRegisterForRemoteEvent(currentAttacker, "OnUnload")
            currentAttacker.Disable()
            currentAttacker.Reset()
        ;endif
        i += 1
    endWhile

EndFunction

;This is where we actually start the attack phase
;Phases are queued in TryToStartAttackPhase()
Function StartAttackPhase(int PhaseNumber)
    ;int totalAttackers = Attackers.GetCount()
    Debug.Trace(self + "    Starting AttackPhase >> " + PhaseNumber)
    ;int AttackersToBeRelease = attackerIndex
    int p = PhaseNumber
    int AttackersToBeRelease = AttackerPhases[p].AttackerSquad.GetCount()

    ;If this phase wants the squad to use the southern approach
    if AttackerPhases[p].ApproachFromSouth
        RefCollectionAlias squad = AttackerPhases[p].AttackerSquad
        int i = 0
        int count = squad.GetCount()
        while i < count
            Squad.GetAt(i).SetValue(MinDefendCastleAttackFromSouth, 1)
            i += 1
        endWhile
    endif


    ;if this is a vertibird phase
    ;   This can happen concurrently with a normal attack phase
    if  AttackerPhases[p].VertibirdPhase
        ;Do Vertibird Stuff

    endif

     ;if this is a teleporter Phase
    if AttackerPhases[p].useTeleporter
        ;Do Teleporter stuff
        MoveToTeleportMarker(AttackerPhases[p].AttackerSquad)
    elseif  AttackerPhases[p].VertibirdPhase
        ;Do Vertibird Stuff
        ;MoveToVertibirdMarker(AttackerPhases[p].AttackerSquad, AttackerPhases[p].VertibirdStartMarker)
        MoveToVertibirdMarker(p)
    else
        ;Do normal attack spawning
        MoveToSpawnMarker(AttackerPhases[p].AttackerSquad)
        ;Set attack approach var for radio announcer
        if AttackerPhases[p].ApproachFromSouth
            MinDefendCastleRadioSquadSW.SetValue(1)
        else
            MinDefendCastleRadioSquadNW.SetValue(1)
        endif
    endif


    ;If there is another attacker phase after this
    int nextPhaseNumber = p + 1
    if AttackerPhases[nextPhaseNumber]
        debug.Trace(self + ": Starting Timer for phase >> " + (nextPhaseNumber))
        StartTimer(AttackerPhases[p].SecondsBeforeNextPhase, (TimerNumAttackPhase0 + nextPhaseNumber))
    else
        debug.Trace(self + ": No more phases >> " + AttackerPhases[nextPhaseNumber])
    endif

    attackPhase += 1
    Debug.Trace(self + "    Completed AttackPhase >> " + PhaseNumber)
EndFunction

;Does what it says. Used to stay thread safe
Function IncrementActorCurrentlyActive(int diff)
    AttackersActiveCurrently += diff
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                       MoveTo____   Block
;   This handles moving Squads to their marker and enabling them, depending on their method of arrival
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Move the squad to a non visible marker and send them on their way!
Function MoveToSpawnMarker(RefCollectionAlias Squad)
    int index
    int indexMax = (SpawnMarkers.GetCount() - 1)
    bool teleportResolved = false
    ObjectReference spawnMarker
    while !teleportResolved
        index = utility.randomInt(0, indexMax)
        spawnMarker = SpawnMarkers.getAt(index)
        if spawnMarker && !game.GetPlayer().HasDirectLOS(spawnMarker)
            Squad.MoveAllTo(spawnMarker)
            Squad.EnableAll()
            teleportResolved = true
        endif
    endWhile
endFunction

;This is for the Institute Teleporting in a squad
;we don't care if the destination is visible, that is actually prefered
;they are moved in disabled, spread out and then FX play when they are enabled
Function MoveToTeleportMarker(RefCollectionAlias Squad)
    int index
    int indexMax = (TeleportMarkers.GetCount() - 1)
    bool teleportResolved = false
    ObjectReference teleportMarker
    objectReference myTeleportMarker
    int attemptsAtVisible = 0
    int maxAttemptsAtVisible = 10
    while !teleportResolved
        index = utility.randomInt(0, indexMax)
        teleportMarker = TeleportMarkers.getAt(index)
        ;Try to teleport this in view of the player, but give up if you can't get one in X attempts
        if teleportMarker && (game.GetPlayer().HasDirectLOS(teleportMarker) || attemptsAtVisible >= maxAttemptsAtVisible)
            ;This replaces the normal MoveAllTo, so they are spread out
            int i = 0
            int count = Squad.GetCount()
            while i < count

                objectReference moveMarker
                moveMarker = TeleportMarker.GetNthLinkedRef(i)
                ;If we have run out of links, or don't have any, just fall back on the teleport marker
                if moveMarker == None
                    moveMarker = teleportMarker
                endif
                Squad.GetAt(i).SetValue(MinDefendCastleAttackerPhase, 2)
                Squad.GetAt(i).SetValue(TeleportRefCollOptionalRequired, 1)
                Squad.GetAt(i).moveto(moveMarker)
                i += 1
            endWhile


            Squad.EnableAll()


            teleportResolved = true
            MinDefendCastleRadioTeleport.SetValue(1)
        else
            attemptsAtVisible += 1
        endif
    endWhile
endFunction

;Function MoveToVertibirdMarker(RefCollectionAlias Squad, ReferenceAlias StartMarker)
Function MoveToVertibirdMarker(int PhaseNumber)

    ;The quest will deal with enabling these squads, so we need to find an open quest
    ;They are stored in a quest array, which should have multiple quest that are essentially dupes
    ;Each of the Vertibird Controller Quest has phases 0-9 that tell that quest which phase actors to grab
    MinDefendCastleVertibirdQuests[PhaseNumber].SetStage(PhaseNumber)

endFunction


; check to see if we need to resolve this attack by script
function CheckResolveAttack()
    debug.trace(self + " CheckResolveAttack")
	; attackers aren't all dead, so resolve
	if GetStageDone(attackDoneStage) == false
		WorkshopParent.ResolveAttack(WorkshopAlias.GetRef() as WorkshopScript, attackStrength, AttackerTypes[AttackerTypeActual].AttackerFaction)
	endif
endFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Set up Castle Attackers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;All of this happens right at the start of the Quest


; KMK - call this function prior to starting the quest
function ForceCastleAttacker(int iAttackerIndex)
    debug.trace(self + " ForceCastleAttacker " + iAttackerIndex)
    if iAttackerIndex < AttackerTypes.length
        MinCastleAttacker.SetValue(iAttackerIndex)
    endif
endFunction

;Sets who should be attacking the castle at this time
;Can be overRidden with the Function above, or by setting the MinCastleAttacker global before the quest starts
Function SetCastleAttacker()
    debug.Trace(self + ">>> SettingCastleAttacker")
    int newAttacker
    int i = 0
    int[] ValidAttackers = new int[0]
    int ValidAttackerIndex = 0
    int AttackerStructCount = AttackerTypes.length
    float LocationSafety = WorkshopParent.GetRating(WorkshopAlias.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingSafety)
    ;Here we determine who the attacker is
    ;newAttacker = 0
    int PlayerLevel = Game.GetPlayer().GetLevel()
    if MinCastleAttacker.GetValue() > -1
        newAttacker = MinCastleAttacker.GetValueInt()
    else
        ; if no forced attacker, choose randomly from valid attacker types
        ;Scan the attacker Array to check if each is valid to be an attacker
        while i < AttackerStructCount
            ;Check the conditions set for each attacker type to see if they are valid
            ;If statements not cascaded for ease of clarity
            if PlayerLevel >= AttackerTypes[i].MinPlayerLevel && (AttackerTypes[i].MaxPlayerLevel == -1 || AttackerTypes[i].MaxPlayerLevel > PlayerLevel)
            if AttackerTypes[i].DependantGlobal1 == none || AttackerTypes[i].DependantGlobal1.GetValue() == AttackerTypes[i].DependantGlobal1Setting
            if AttackerTypes[i].DependantGlobal2 == none || AttackerTypes[i].DependantGlobal2.GetValue() == AttackerTypes[i].DependantGlobal2Setting 
                ;all are true, so add this index to the valid attacker array
                ValidAttackers.Add(i)
                ValidAttackerIndex += 1
            endif
            endif
            endif
            i += 1
        endWhile

        debug.Trace(Self + "    has finished scanning AttackerArray > " + ValidAttackerIndex + " < valid attacker types")
        ValidAttackerIndex -= 1
        ;Here we assign the actual new attacker from the array of valid attackers
        if ValidAttackerIndex >= 0
            ;select a random attacker from the valid attackers
            newAttacker = ValidAttackers[utility.randomInt(0, ValidAttackerIndex)]
            ;Check to make sure this isn't the same faction that attacked last
            int previousAttacker = MinCastleAttackerPrevious.getValueInt()
            ;if the new attacker equals the old one AND there is more than one option
            while newAttacker == previousAttacker && ValidAttackerIndex > 0
                ;roll a new attacker and recheck
                newAttacker = ValidAttackers[utility.randomInt(0, ValidAttackerIndex)]
            endWhile
        else
            ;if this failed somehow, just use raiders
            debug.Trace(self + "    ValidActor Failed!!! Defaulting to 0")
            newAttacker = 0
        endif
        ;Track who is now attacking for next time
        MinCastleAttackerPrevious.SetValue(newAttacker)
        debug.Trace(self + "    ValidActor Selected " + newAttacker + " >> " + AttackerTypes[newAttacker].AttackerName + " <<")
    endif

    ;Set the attacker
    MinCastleAttacker.setValue(newAttacker)

    ;Set the AttackerPhases to those of the appropriate type
    MatchAttackerPhases(newAttacker)


;    Attackers.AddRefCollection(AttackerTypes[newAttacker].AttackerCollection)
;    Attackers = AttackerTypes[newAttacker].AttackerCollection
    AttackerTypeActual = newAttacker

    (Attackers as MinDefendCastleRefCollectAliasScript).RegisterAttackerAlias()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;*************** THIS IS WHERE TO PUT THE EXTERNAL FILL
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property MinDefendCastle_Attackers Auto

;This matches the actual AttackerPhases to those of the selected attacker
Function MatchAttackerPhases(int AttackerNumber)
    ;AttackerPhases.Clear()
    ;Also clean up the attackers RefCollectionAlias and add them all
    Attackers.RemoveAll()

    ;Start the castle attackers quest
    ;   this holds all the attacker data so once we have the right data assigned we can dump the rest
    MinDefendCastle_Attackers.SetStage(0)
    ;Now tell it to fill with the attacker we have previously chosen
    (MinDefendCastle_Attackers as MinDefendCastleAttackerFillScript).FillWithAttacker(AttackerNumber)


    ;Add all attacker phases to the Attackers Collection
    ;   This collection has the scripts & packages
    int i = 0
    int count = AttackerPhases.Length
    while i < count
        Attackers.AddRefCollection(AttackerPhases[i].AttackerSquad)
        i += 1
    EndWhile

    ;Assign linkrefs, these are not done through the alias to randomize assignment
    Attackers.LinkCollectionTo(AttackMarkers02N, LinkCustom03, wrapLinks = true)
    Attackers.LinkCollectionTo(AttackMarkers02S, LinkCustom04, wrapLinks = true)

    ResetAttackers()
EndFunction

Function ResetAttackers()
    int i = 0
    int count = Attackers.GetCount()
    ;Check if hard reset takes care of this
    ;/
    while i < count
        ;Reset this Teleport Var just in case
        Attackers.GetAt(i).SetValue(TeleportRefCollOptionalRequired, 0)
        ;Reset the teleport 1st time load var
        Attackers.GetAt(i).SetValue(TeleportRefCollOnLoad, 1)
        ;TODO
        ;Reset Attacker hold position Vars

        i += 1
    endwhile
    /;
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Attacker Data Structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This stores the data we check to see who is a valid attacker
Struct AttackerType
    String AttackerName
    Faction AttackerFaction
    ;RefCollectionAlias AttackerCollection 
    GlobalVariable DependantGlobal1
    bool DependantGlobal1Setting = true
    GlobalVariable DependantGlobal2
    bool DependantGlobal2Setting = true

    int MinPlayerLevel = -1
    int MaxPlayerLevel = -1
endStruct

;This stores the data for a single attacker phase
;       THIS IS DERIVED FROM MinDefendCastleAttackROOT
;   This allows us to use the data structure in the MinDefendCastle_Attackers quest


;/Struct AttackerPhase
    bool useTeleporter = false
    bool VertibirdPhase = false
    bool ApproachFromSouth = false
    {if true this squad will approach from the south, otherwise from the north}
    float SecondsBeforeNextPhase = 30.0
    RefCollectionAlias AttackerSquad
    ReferenceAlias VertibirdStartMarker
    ReferenceAlias VertibirdCircleMarker
    ReferenceAlias VertibirdLandingMarker
    {If this is a vertibird phase, this is where it starts from}
EndStruct/;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Attacker Phase Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Group AttackerProperties
    GlobalVariable Property MinCastleAttacker Auto
    GlobalVariable Property MinCastleAttackerPrevious Auto
    AttackerType[] Property AttackerTypes Auto
    RefCollectionAlias Property Attackers Auto
        { attacker aliases }
EndGroup

;This is set to match the phases of the actual attacker
AttackerPhase[] Property AttackerPhases Auto



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Combat Barks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool wallsBreached


int TimerNumWallsBreached = 200
Function SetWallsBreached()
    if !wallsBreached
        wallsBreached = true
        MinDefendCastleWallsBreachedExpired.SetValue(0)
        MinDefendCastleWallsBreached.SetValue(1)
        startTimer(15, TimerNumWallsBreached); WallsBreached ShutdownTimer
    endif
EndFunction


