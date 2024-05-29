ScriptName DN015SampleActivator Extends ObjectReference


Group MessageProperties
	Message Property DN015_PlaceSampleMessage Auto Const
	Message Property DN015_SampleNeededMessage Auto Const
EndGroup

Sample[] Property Samples Auto Const

ObjectReference Property CurrentSample Auto hidden
ReferenceAlias Property MyContainer Auto Const
GlobalVariable Property myGlobal Auto Const
ReferenceAlias Property NoneName Auto Const

bool Property isLeftSample = true Auto Const
ObjectReference Property DN015_PuzzleTerminalRef Auto Const
DN015PuzzleScript Property DN015Puzzle Auto Const

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event onActivate(objectReference akActivator)
    ObjectReference Player = Game.GetPlayer()
    if akActivator != Player
    else
    	int Count = Samples.Length
    	int i = 0
    	int itemsHeld = 0
    	While i < Count
    		if Player.GetItemCount(Samples[i].myMiscObject.GetReference())
    			itemsHeld += 1
    		endif
    		i += 1
    	EndWhile
        if itemsHeld >= 1
            Int MsgResponse = DN015_PlaceSampleMessage.Show()
        	if MsgResponse != 0
        		PlaceMySample(ParseSampleResponse(MsgResponse))
        	endif
        else
            DN015_SampleNeededMessage.Show()
        endif
    endif
    DN015Puzzle.CheckForAllItemsPlaced()
EndEvent

Function PlaceMySample(int i)
	ObjectReference Player = game.GetPlayer()
	ObjectReference myXmarker = getLinkedRef()
	Player.RemoveItem(Samples[i].myMiscObject.GetReference(), 1, false, myContainer.GetReference())
	Samples[i].myActivator.GetReference().moveTo(myXmarker)
	Samples[i].myActivator.GetReference().Enable()
	RegisterForRemoteEvent(Samples[i].myActivator.GetReference(), "onActivate")
	CurrentSample = Samples[i].myActivator.GetReference()
	Self.Disable()


    DN015Puzzle.CheckScanned(CurrentSample, isLeftSample)
    ;/
    if isLeftSample
        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", CurrentSample.GetBaseObject())
    else
        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", CurrentSample.GetBaseObject())
    endif
    /;
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akSender == CurrentSample
		Self.Enable()
		CurrentSample.UnregisterForRemoteEvent(CurrentSample, "OnActivate")
		CurrentSample = None
		myGlobal.SetValue(0)

        if isLeftSample
            DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", NoneName.GetReference().GetBaseObject())
        else
            DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", NoneName.GetReference().GetBaseObject())
        endif
	endif
    DN015Puzzle.CheckForAllItemsPlaced()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Struct
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Struct Sample
	ReferenceAlias myActivator
	ReferenceAlias myMiscObject
EndStruct

;This takes in the message response number and returns the numbers used by the Sample Array
int Function ParseSampleResponse(int i)
    Debug.Trace(self +": ParseSampleResponse >> " + i)
    if i == 1 || i == 2          ;Fake Sample 1
        myGlobal.SetValue(0)
        Return 0
    elseif i == 3 || i == 4      ;Lithium Hydride
        myGlobal.SetValue(1)
        Return 1
    elseif i == 5 || i == 6
        myGlobal.SetValue(0)
        Return 2
    elseif i == 7 || i == 8      ;Gold
        myGlobal.SetValue(1)
        Return 3
    elseif i == 9 || i == 10
        myGlobal.SetValue(0)
        Return 4
    elseif i == 11 || i == 12
        myGlobal.SetValue(0)
        Return 5
    endif
EndFunction