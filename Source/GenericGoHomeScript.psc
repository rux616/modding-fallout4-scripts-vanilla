Scriptname GenericGoHomeScript extends Quest

float gameTimeHours = 4.0 const

function Initialize()
    StartTimerGameTime(gameTimeHours)
endFunction

function AddRef(ObjectReference newRef)
    GoHomeActors.AddRef(newRef)
endFunction

Event OnTimerGameTime(int aiTimerID)
    ; run through everything in the ref collection, remove if in editor location
    int i = GoHomeActors.GetCount() - 1
    ; count down because we are going to be removing things from the list
    while i > -1
        ObjectReference theRef = GoHomeActors.GetAt(i)
        Actor theActor = theRef as Actor
        ; failsafe - unrestrain anybody in this alias
        if theActor
           theActor.SetRestrained(false)
        endif

        debug.trace(self + " " + i + ": " + theRef + ": currentLocation=" + theRef.GetCurrentLocation() + ", editorLocation=" + theRef.GetEditorLocation())
        if theRef.GetEditorLocation() == theRef.GetCurrentLocation()
            ; remove - ref is now home
            GoHomeActors.RemoveRef(theRef)
            debug.trace(self + " " + theRef + " is HOME - removed from alias")
        ; special case for workshop NPCs
        elseif (theRef is WorkshopNPCScript)
            WorkshopNPCScript workshopNPC = theRef as WorkshopNPCScript
            ; am I in my workshop's location?
            int workshopID = workshopNPC.GetWorkshopID()
            if workshopID > -1
                workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
                if workshopRef
                    debug.trace(self + " " + theRef + " is workshop NPC - check if home at " + workshopRef)
                    if workshopRef.myLocation == theRef.GetCurrentLocation()
                        GoHomeActors.RemoveRef(theRef)
                        debug.trace(self + " " + theRef + " is HOME - removed from alias")
                    endif
                endif
            endif
        endif

        i += -1
    endwhile
    StartTimerGameTime(gameTimeHours)
EndEvent

function TryToSendHome(actor theActor)
    WorkshopNPCScript workshopNPC = theActor as WorkshopNPCScript
    if workshopNPC
        int workshopID = workshopNPC.GetWorkshopID()
        if workshopID > -1
            workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
            if workshopRef
                debug.trace(self + " try to move " + workshopNPC + " home to " + workshopRef)
                ; move home immediately if both me and my home are unloaded
                if workshopRef.myLocation.IsLoaded() == false && workshopNPC.Is3DLoaded() == false
                    workshopNPC.MoveTo(workshopRef.GetLinkedRef(WorkshopParent.WorkshopLinkCenter))
                endif
            endif
        endif
    endif
endFunction

RefCollectionAlias Property GoHomeActors Auto Const

WorkshopParentScript Property WorkshopParent auto const

