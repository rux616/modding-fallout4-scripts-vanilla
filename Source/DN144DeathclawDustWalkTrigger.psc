Scriptname DN144DeathclawDustWalkTrigger extends ObjectReference Hidden

Sound Property NPCDeathclawFootWalk const auto
Sound Property NPCDeathclawIdleHiss const auto
Sound Property StringHit const auto	
Float Property DelayBeforeStartingWalk const auto
Keyword Property LinkCustom01 const auto

auto STATE WaitingForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	GoToState("Done")
	    	int HissSoundInstance = NPCDeathclawIdleHiss.play(GetNthLinkedRef(4))
			int StringHitInstance = StringHit.play(self)
	    	utility.Wait(DelayBeforeStartingWalk)
	    	int count = 0
			int countmax = CountLinkedRefChain()
			;debug.Trace(self + "Counted " + countmax + " lights.")
			while (count < countmax)
				count += 1
				int WalkSoundInstance = NPCDeathclawFootWalk.play(GetNthLinkedRef(count))
				Sound.SetInstanceVolume(WalkSoundInstance, 1)
				GetNthLinkedRef(count).PlayAnimation("Stage2")
				Game.ShakeCamera(GetNthLinkedRef(count),0.2,0.0)
				utility.Wait(utility.RandomFloat(0.6, 0.8))
				if count == 4
					GetLinkedRef(LinkCustom01).EnableNoWait()
				endif
				;debug.Trace(self + "Turning on Klaxon light " + GetNthLinkedRef(count)
			endwhile
			utility.Wait(3)
			GetLinkedRef(LinkCustom01).DisableNoWait()
	    endif
	EndEvent
ENDSTATE

STATE Done
	;Do Nothing
ENDSTATE