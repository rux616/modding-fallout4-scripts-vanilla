Scriptname DN154_ArlenUnloadScript extends ReferenceAlias Hidden Const
{Script on Arlen that disables him when he 'leaves' or after being killed.}

Quest property DN154 auto const

ObjectReference property DN154_PostquestEnableMarker auto const
ObjectReference property DN154_PostquestDisableMarker auto const

Event OnUnload()
	;If the player has Marlene's Password (5) and Arlen is dead (254), it's safe to shut down.
	if (DN154.GetStageDone(5) && DN154.GetStageDone(254))
		DN154.SetStage(255)
	EndIf

	;If the player has returned the parts to Arlen and given him Marlene's holotape, the quest is finished; it's safe to shut down.
	if (DN154.GetStageDone(50) && DN154.GetStageDone(240))
		DN154.SetStage(255)

		;Since this means the quest has been completed successfully, update enable state in Arlen's workroom.
		DN154_PostquestEnableMarker.Enable()
		DN154_PostquestDisableMarker.Disable()
	EndIf
EndEvent