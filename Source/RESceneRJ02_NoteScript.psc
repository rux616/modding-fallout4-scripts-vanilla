Scriptname RESceneRJ02_NoteScript extends ObjectReference Const

FormList Property RESceneRJ02_FormList Auto Const

ReferenceAlias Property Postman Auto Const

GlobalVariable Property RESceneRJ02Global Auto Const

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if (akOldContainer == Postman.GetReference())
    	RESceneRJ02_FormList.RemoveAddedForm(Self.GetBaseObject())
    	if (RESceneRJ02_FormList.GetSize() == 0)
    		RESceneRJ02Global.SetValue(1)
    	endif
    endif	
EndEvent
