Scriptname DN138PipeRepairScript extends ReferenceAlias Hidden

Sound Property SoundToPlay Const Auto

Keyword Property LinkCustom01 Const Auto

GlobalVariable Property DN138LeakCount Const Auto

GlobalVariable Property DN138LeakCountMax Const Auto

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestA).Increment()
EndFunction

Auto STATE WaitForActivate
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			GoToState("DoneWaiting")
			;int InstanceID = SoundToPlay.Play(self.GetReference())
			GetReference().GetLinkedRef(LinkCustom01).Activate(Game.GetPlayer())
			utility.Wait(0.5)
			GetReference().DisableNoWait()
			utility.Wait(1)
			GetReference().DisableLinkChain()
			;Increment()
			if GetOwningQuest().ModObjectiveGlobal(1, DN138LeakCount, 0, DN138LeakCountMax.value)
				GetOwningQuest().SetStage(500)
			endif

			if !GetOwningQuest().IsStageDone(300)
				GetOwningquest().SetStage(300)
			endif

		endif
	EndEvent
EndSTATE

STATE DoneWaiting
	; Do Nothing
EndSTATE
