Scriptname DLC03:DLC03_TentBedActivatorScript extends ObjectReference Hidden

Furniture Property DLC03_TentBedInvisibleDONTPLACE Auto Const Mandatory

Message Property PowerArmorNoActivate Auto Const Mandatory

ObjectReference Property MyCurrentBedRef Auto 

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if Game.GetPlayer().IsInPowerArmor()
            PowerArmorNoActivate.Show()
        else
        	if !MyCurrentBedRef
        		MyCurrentBedRef = PlaceAtMe(DLC03_TentBedInvisibleDONTPLACE)
        		MyCurrentBedRef.SetAngle(0, 0, 0)
        		MyCurrentBedRef.Activate(Game.GetPlayer())
        	else
        		MyCurrentBedRef.Activate(Game.GetPlayer())
        	endif
        endif
    endif
EndEvent

Event OnUnload()
    MyCurrentBedRef.DisableNoWait()
    MyCurrentBedRef.Delete()
    MyCurrentBedRef = NONE
EndEvent