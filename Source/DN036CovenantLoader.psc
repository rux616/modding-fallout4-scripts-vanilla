Scriptname DN036CovenantLoader extends ObjectReference Const

Quest Property DN036 Auto Const

Event OnCellAttach()
	if (DN036 as DN036QuestScript).EndingComplete
		Self.Disable()
	else
		(DN036 as DN036QuestScript).CovenantBaseHasLoaded()
	endif
EndEvent