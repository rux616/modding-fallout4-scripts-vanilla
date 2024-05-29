Scriptname DN161PowerLiftButton extends ObjectReference Hidden

ObjectReference Property TopNavCut const auto
ObjectReference Property BotNavCut const auto
ObjectReference Property ActorBlock const auto

ObjectReference LiftPlatform
ObjectReference LiftDoor
ObjectReference EnableMarker
Quest Property MS10 Auto
Int Property StageToSet Auto
Bool Property IsUpperElevator = TRUE Auto
Bool HasLoaded
Int BlockerTimerInstance = 10
Float Property BlockerTimerSeconds = 10.0 const auto

Bool IsLiftMoving = FALSE

auto STATE QuestState
    Event OnLoad()
        if !HasLoaded
            HasLoaded = TRUE
            BlockActivation(TRUE, TRUE)
            LiftPlatform = GetLinkedRef()
            LiftDoor = GetNthLinkedRef(2)
            if GetNthLinkedRef(3)
            	EnableMarker = GetNthLinkedRef(3)
            endif
            WaitFor3DLoad()
        endif
        if !IsLiftMoving
            LiftDoor.PlayAnimation("startdown")
        endif
    EndEvent

    Event OnTimer(int aiTimerID)
        if aiTimerID == BlockerTimerInstance
            if ActorBlock
                ActorBlock.DisableNoWait()
            endif
        endif
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
    	BlockActivation(TRUE, TRUE)
        if IsUpperElevator
            MS10.SetStage(StageToSet)
            if ActorBlock
                ActorBlock.EnableNoWait()
                StartTimer(BlockerTimerSeconds, BlockerTimerInstance)
            endif
        endif

        ;Enable all baddies for finale
        EnableMarker.EnableNoWait()
        TopNavCut.EnableNoWait()

        if IsUpperElevator
            IsLiftMoving = TRUE
            ;extend lift out, and closed door
            MS10.SetStage(415)
            PlayAnimation("play01")
            Liftdoor.PlayAnimation("play01")
            LiftPlatform.PlayAnimationAndWait("play01", "done")
            
            ;move down to first stopping point and wait there for a bit
            MS10.SetStage(420)
            LiftPlatform.PlayAnimationAndWait("QuestMS10A", "done")
            MS10.SetStage(430)
            utility.Wait(5)

            ;move down to finishing point, and open door
            LiftPlatform.PlayAnimationAndWait("QuestMS10A", "done")
            Liftdoor.PlayAnimation("play01")
            MS10.SetStage(440)
            MS10.SetStage(450)
        else
            ;extend lift out, and closed door
            MS10.SetStage(455)
            PlayAnimation("play01")
            Liftdoor.PlayAnimation("play01")
            LiftPlatform.PlayAnimationAndWait("play01", "done")

            ;move down to first stopping point, and wait there a bit
            MS10.SetStage(460)
            LiftPlatform.PlayAnimationAndWait("QuestMS10B", "done")
            utility.Wait(10)
            MS10.SetStage(470)
            
            ;move down to finishing point, and open door
            LiftPlatform.PlayAnimationAndWait("QuestMS10B", "done")
            Liftdoor.PlayAnimation("play01")
            MS10.SetStage(480)
            MS10.SetStage(490)
            IsLiftMoving = FALSE
        endif

        BotNavCut.DisableNoWait()
        ;EnableMarker.DisableNoWait()
        utility.Wait(20)
        BlockActivation("FALSE")
        GoToState("PostQuestState")
    EndEvent
EndSTATE



Bool IsAtBottom = TRUE

STATE PostQuestState

    Event OnLoad()
        if Game.GetPlayer().GetPositionZ() > 7000
            IsAtBottom = FALSE
            LiftPlatform.PlayAnimation("StartUp")
        else
            IsAtBottom = TRUE
            if IsUpperElevator
                LiftPlatform.PlayAnimation("StartTowerDown01")
            else
                LiftPlatform.PlayAnimation("StartTowerDown02")
            endif
        endif
        LiftDoor.PlayAnimation("StartDown")
    EndEvent

    Event OnBeginState(string asOldState)
        BlockActivation("FALSE")
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        GoToState("DoNothing")
        if akActionRef == Game.GetPlayer()
            IsLiftMoving = TRUE
            if IsAtBottom
                    ; Block activation, close the door, and start the elevator going up.
                Liftdoor.PlayAnimation("play01")

                if IsUpperElevator
                    LiftPlatform.PlayAnimationAndWait("TowerUp01","done")
                else
                    LiftPlatform.PlayAnimationAndWait("TowerUp02","done")
                endif
                LiftPlatform.PlayAnimation("Retract")
                Liftdoor.PlayAnimationAndWait("play01","done")
                IsAtBottom = FALSE
            else
                    ; Block activation, close the door, and start the elevator going down.
                Liftdoor.PlayAnimation("play01")
                LiftPlatform.PlayAnimationAndWait("Extend","done")

                if IsUpperElevator
                    LiftPlatform.PlayAnimationAndWait("TowerDown01","done")
                else
                    LiftPlatform.PlayAnimationAndWait("TowerDown02","done")
                endif

                Liftdoor.PlayAnimationAndWait("play01","done")
                IsAtBottom = TRUE
            endif
            IsLiftMoving = FALSE
        endif
        GoToState("PostQuestState")
    EndEvent

EndSTATE


Function ReEnableActivation()
    BlockActivation("FALSE")
EndFunction


STATE DoNothing

EndSTATE