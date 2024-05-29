Scriptname FusionGeneratorPowerPuzzleScript extends WorkshopObjectScript

import utility


Group _GeneratorUserProperties
    int property power = 10 auto const
    {Amount of power this generator generates when powered.}

    bool property startWithFusionCore = False auto const
    {Does this generator begin with a fusion core present?}

    bool property preventRemoval = False auto const
    {Should we prevent the player from removing the fusion core once they insert it?}

    ReferenceAlias property myFusionCoreAlias auto const
    {OPTIONAL: Aliased Fusion Core the generator will prefer to use. If omitted, you can delete the container, too.}

    int  property myStageToSet auto const
    {OPTIONAL: Stage to set when the generator first receives or loses power.}

    Quest property myQuest auto const
    {OPTIONAL: Quest to set a stage on when the generator first receives or loses power.}
EndGroup

Group GeneratorStaticProperties
    ActorValue property PowerGenerated auto const
    Sound property QSTMuseumGeneratorActivateFusionCore auto const
    Sound property QSTMuseumGeneratorTurbineOff auto const
    Sound property QSTMuseumGeneratorBeep auto const

    Ammo property AmmoFusionCore auto const
    {Fusion core object.}

    Keyword property LinkCustom01 auto const
    {Link to the activator representing the Fusion Core.}

    Keyword property LinkCustom02 auto const
    {Link to the trigger present when the Fusion Core is missing.}

    Keyword property LinkCustom03 auto const
    {Link to an inaccessible container we put the current core in if it's an Aliased object, to prevent it from being destroyed. Can omit if no Aliased core.}

    Message property PowerPuzzleRequiresFusionCore auto const
    {Display message that this requires a fusion core to operate.}
EndGroup


bool property hasFusionCore auto hidden                      ;Do we currently have a fusion core?
ObjectReference property myFusionCore auto hidden            ;Fusion core activator.
ObjectReference property myFusionCoreTrigger auto hidden     ;Fusion core trigger.
ObjectReference property myFusionCoreContainer auto hidden   ;Container to put aliased fusion cores in.
ObjectReference property myLight auto hidden                 ;Associated light.
Actor property player auto hidden                            ;Player actor.


Event OnInit()
    Debug.trace("Fusion Generator Power Puzzle: OnLoad")

    ;Store off local properties.
    player = Game.GetPlayer()
    myFusionCore = Self.GetLinkedRef(LinkCustom01)
    myFusionCoreTrigger = Self.GetLinkedRef(LinkCustom02)
    myFusionCoreContainer = Self.GetLinkedRef(LinkCustom03)

    ;Process activations on the fusion core activator and trigger.
    RegisterForRemoteEvent(myFusionCore, "OnActivate")
    RegisterForRemoteEvent(myFusionCoreTrigger, "OnActivate")

    ;Determine initial state.
    if (startWithFusionCore)
        Debug.Trace("Fusion Generator Power Puzzle: Fusion Core PRESENT")
        hasFusionCore = True
        myFusionCore.Enable()
        myFusionCoreTrigger.Disable()
        ;Self.SetValue(PowerGenerated, power)
        Self.playAnimation("reset")
    Else
        Debug.Trace("Fusion Generator Power Puzzle: Fusion Core REMOVED")
        hasFusionCore = False
        myFusionCore.Disable()
        myFusionCoreTrigger.Enable()
        ;Self.SetValue(PowerGenerated, 0)
        Self.playAnimation("autoFade")
    EndIf
EndEvent

Event OnLoad()
    if (hasFusionCore)
        Self.playAnimation("reset")
    Else
        Self.playAnimation("autoFade")
    EndIf
EndEvent


Auto State Ready
    Event OnActivate(ObjectReference akActionRef)
        Debug.Trace("Activate: " + akActionRef)
        if (hasFusionCore)
            parent.OnActivate(akActionRef)
        Else
            PowerPuzzleRequiresFusionCore.Show()
        EndIf
    EndEvent

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        GoToState("Busy")
        Debug.Trace("Reference Activate: " + akSender)
        if ((akSender == myFusionCore) && hasFusionCore)
            if (preventRemoval)
                ;Pass the activation to the generator.
                Self.Activate(akActionRef)
            Else
                RemoveCore()
            EndIf
        ElseIf ((akSender == myFusionCoreTrigger) && !hasFusionCore)
            if (player.GetItemCount(AmmoFusionCore) == 0)
                PowerPuzzleRequiresFusionCore.Show()
            Else
                InsertCore()
            EndIf
        EndIf
        GoToState("Ready")
    EndEvent
EndState

State Busy
    Event OnActivate(ObjectReference akActionRef)
        ;Do nothing.
    EndEvent

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        ;Do nothing.
    EndEvent
EndState

Event OnActivate(ObjectReference akActionRef)
     ;Do nothing.
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;Do nothing.
EndEvent


Function InsertCore()
    Debug.Trace("Inserting Fusion Core.")
    if (myQuest != None)
        myQuest.SetStage(myStageToSet)
    endIf
    if (myFusionCoreAlias != None && player.GetItemCount(myFusionCoreAlias.GetReference()))
        player.RemoveItem(myFusionCoreAlias.GetReference(), 1, False, myFusionCoreContainer)
    Else
        player.RemoveItem(AmmoFusionCore)
    EndIf
    hasFusionCore = True
    myFusionCore.Enable()
    myFusionCoreTrigger.Disable()
    ;Self.SetValue(PowerGenerated, power)
    Self.playAnimation("reset")
    QSTMuseumGeneratorActivateFusionCore.play(self)
EndFunction

Function RemoveCore()
    Debug.Trace("Removing Fusion Core.")
    if (myQuest != None)
        myQuest.SetStage(myStageToSet)
    endIf
    if (myFusionCoreAlias != None && myFusionCoreContainer.GetItemCount(myFusionCoreAlias.GetReference()))
        player.AddItem(myFusionCoreAlias.GetReference())
    Else
        player.AddItem(AmmoFusionCore)
    EndIf
    hasFusionCore = False
    myFusionCore.Disable()
    myFusionCoreTrigger.Enable()
    ;Self.SetValue(PowerGenerated, 0)
    Self.playAnimation("autoFade")
    QSTMuseumGeneratorActivateFusionCore.play(self)
    QSTMuseumGeneratorTurbineOff.play(self)
    wait(0.1)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
    wait(0.2)
    ;myLight.enable()
    wait(0.1)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
    wait(0.1)
    ;myLight.enable()
    wait(0.2)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
    wait(0.1)
    ;myLight.enable()
    wait(0.1)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
    wait(0.1)
    ;myLight.enable()
    wait(0.2)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
    wait(0.4)
    ;myLight.enable()
    wait(0.1)
    ;myLight.disable()
    QSTMuseumGeneratorBeep.play(self)
EndFunction