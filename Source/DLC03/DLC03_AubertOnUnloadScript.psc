Scriptname DLC03:DLC03_AubertOnUnloadScript extends ReferenceAlias

Quest Property DLC03CoA_FFNucleus02 Auto Const Mandatory
{Used to manage proper state for Aubert's unload}

Event OnUnload()
	;If you informed Aubert you had the note, but didn't resolve that, disable her
	if DLC03CoA_FFNucleus02.GetStageDone(210) && DLC03CoA_FFNucleus02.GetStageDone(500) && !DLC03CoA_FFNucleus02.GetStageDone(220) && !DLC03CoA_FFNucleus02.GetStageDone(240)
		GetOwningQuest().SetStage(210)

	;Or, if you've told her to flee, disable her
	elseif DLC03CoA_FFNucleus02.GetStageDone(240)
		GetOwningQuest().SetStage(200)
	endif	
EndEvent