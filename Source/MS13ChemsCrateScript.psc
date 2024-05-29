Scriptname MS13ChemsCrateScript extends ObjectReference

Event OnLoad()
	; if ambush hasn't finished, block activation
	BlockActivation(!MS13.GetStageDone(800))
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if !MS13.GetStageDone(800)
    	; message
    	MS13ChemsCrateMessage.Show()
    else
    	; unblock activation
    	BlockActivation(false)
    endif
EndEvent

Quest Property MS13 const auto
Message Property MS13ChemsCrateMessage const auto
