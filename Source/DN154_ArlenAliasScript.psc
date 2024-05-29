Scriptname DN154_ArlenAliasScript extends ReferenceAlias Hidden
{Script on Arlen that disables him when he 'leaves' or after being killed.}

Quest property DN154 Auto Const Mandatory
{DN154}

Scene property DN154_Arlen_000_WorkingLoop Auto Const Mandatory
{Arlen's working scene. Force-end this whenever he enters dialogue with the player.}

;Enable markers used by the quest. All of these autofill.
ObjectReference property DN154_ButtercupInPiecesEnableMarker Auto Const Mandatory
ObjectReference property DN154_ButtercupReassembledEnableMarker Auto Const Mandatory
ObjectReference property DN154_ButtercupFinishedEnableMarker Auto Const Mandatory
ObjectReference property DN154_AtomatoysHQButtercupsEnableMarker Auto Const Mandatory

Function StopWorkingScene()
	DN154_Arlen_000_WorkingLoop.Stop()
EndFunction

Event OnUnload()
	;If the player has returned the toy parts to Arlen, but not returned Marlene's holotape (or finished that dialogue):
	if (DN154.GetStageDone(90) && !DN154.GetStageDone(238))
		;Swap the Buttercup Arlen is working on to the Reassembled state.
		DN154_ButtercupInPiecesEnableMarker.DisableNoWait()
		DN154_ButtercupReassembledEnableMarker.EnableNoWait()
	EndIf

	;If the player told Arlen about the toy parts in the Atomatoys Headquarters:
	if (DN154.GetStageDone(95))
		;Disable the Buttercups in Atomatoys Corporate HQ. Arlen took them.
		DN154_AtomatoysHQButtercupsEnableMarker.Disable()
		;Set a flag stage indicating that he got the parts he needed.
		DN154.SetStage(96)
		;Swap the Buttercup Arlen is working on to the Reassembled state.
		DN154_ButtercupInPiecesEnableMarker.DisableNoWait()
		DN154_ButtercupReassembledEnableMarker.EnableNoWait()
	EndIf

	;If the player has completed the Toy Parts quest AND returned Marlene's holotape to Arlen:
	if (DN154.GetStageDone(100) && DN154.GetStageDone(238))
		;Disable the Buttercups in Atomatoys Corporate HQ. Arlen took them.
		DN154_AtomatoysHQButtercupsEnableMarker.Disable()

		;Set Arlen's Buttercup to its final state.
		DN154_ButtercupInPiecesEnableMarker.DisableNoWait()
		DN154_ButtercupReassembledEnableMarker.DisableNoWait()
		DN154_ButtercupFinishedEnableMarker.EnableNoWait()

		;Arlen leaves The Slog.
		Self.TryToDisable()

		;Shut down the quest.
		DN154.SetStage(255)
	EndIf
EndEvent