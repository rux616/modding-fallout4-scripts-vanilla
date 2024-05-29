Scriptname DLC04:DLC04ScavMagazineTrackerScript extends ObjectReference
Quest Property DLC04Achievements Auto Const Mandatory
GlobalVariable Property DLC04ScavMagazineGlobal Auto Conditional Mandatory

bool PickedUp


Event OnActivate(ObjectReference akActionRef)
    
    if ( !PickedUp )
        DLC04ScavMagazineGlobal.Mod(1)                      ; Increment the tracker variable

            if ( DLC04ScavMagazineGlobal.GetValue() >= 5 )      ; Have you found all 5?
                DLC04Achievements.SetStage(100)
            endif

        PickedUp = 1
    endif

EndEvent
