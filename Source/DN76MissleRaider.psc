Scriptname DN76MissleRaider extends ObjectReference Hidden Const

Event OnLoad()
	ObjectReference MySelf = self
    if !(MySelf as Actor).IsDead()
    	MySelf.MoveToMyEditorLocation()
    endif
EndEvent