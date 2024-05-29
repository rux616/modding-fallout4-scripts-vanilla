Scriptname DLC04:DLC04_AnimatronicControlSSScript extends DLC04:DLC04_AnimatronicControlBaseScript 

DLC04:DLC04GZTrackingQuestScript property DLC04GZTrackingQuest Auto Const Mandatory
Message property DLC04_AnimatronicActivateTextBlank Auto Const Mandatory
RefCollectionAlias property DLC04_AnimatronicNamesRemoved Auto Const Mandatory

Event OnLoad()
    Self.SetNoFavorAllowed()
EndEvent

Auto State Waiting
    Event OnActivate(ObjectReference akActionRef)
        if (akActionRef == Game.GetPlayer())
            GoToState("Done")
            Self.PlayAnimation("ClothesOff")
            DLC04GZTrackingQuest.GiveSpacesuit()
            Self.SetActivateTextOverride(DLC04_AnimatronicActivateTextBlank)
            DLC04_AnimatronicNamesRemoved.AddRef(Self)
        EndIf  
    EndEvent
EndState

State Done
    ;Do nothing.
EndState