Scriptname DLC04:DLC04_AnimatronicControlOutfitScript extends DLC04:DLC04_AnimatronicControlBaseScript 

Form[] property AnimatronicOutfitComponents Auto Const Mandatory
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
            Actor player = Game.GetPlayer()
            int i = 0
            While (i < AnimatronicOutfitComponents.Length)
                player.AddItem(AnimatronicOutfitComponents[i])
                i = i + 1
            EndWhile
            Self.SetActivateTextOverride(DLC04_AnimatronicActivateTextBlank)
            DLC04_AnimatronicNamesRemoved.AddRef(Self)
        EndIf  
    EndEvent
EndState

State Done
    ;Do nothing.
EndState