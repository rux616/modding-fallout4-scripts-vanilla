Scriptname COMCurieIntroScript extends ObjectReference Const

Quest Property pCOMCurie Auto Const Mandatory
Quest Property pMS19 Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)

	if ( akActionRef == Game.GetPlayer() )
		; You have effectively completed MS19 and Curie is waiting to ambush talk with you
		if ( pMS19.GetStageDone(900) || pMS19.GetStageDone(30) ) 
			if !pCOMCurie.GetStageDone(85)		; Did Curie already join you?
				pCOMCurie.SetStage(83)    ; Start her intro scene
			endif
			Delete()
		endif
	endif
EndEvent

