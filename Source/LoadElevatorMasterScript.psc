Scriptname LoadElevatorMasterScript extends ObjectReference Hidden

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto

Sound Property ElevatorLoop Auto
Sound Property ElevatorDing Auto

GlobalVariable Property ElevatorMusicGlobal Auto Const

FormList Property ElevatorNonFollowerLocations Auto Const
Package Property CommandMode_Travel Auto Const

scene property elevatorGoingUpDownScene auto const
GlobalVariable Property LoadElevatorDown Auto Const
{Global to check/set that tells this elevator
which irection it should be going.}

GlobalVariable Property LoadElevatorFloorCount Auto Const
{Global to check/set that tells this elevator
how many floors it should go.}

Float Property MaxSpeedManyFloors = 2.0 Auto Const

Float Property MaxSpeedFewFloors = 0.9 Auto Const

Int Property ManyFloors = 10 Auto Const

bool property CameraShakeOn = True auto hidden
int property CurrentFloorCount auto hidden
int property MaxFloorCount auto hidden
int ElevatorLoopInstance

string Direction


Event OnLoad()
 	Debug.Trace(self + " OnLoad()")

 	if ElevatorMusicGlobal.GetValue() == 1
 		GetLinkedRef(LinkCustom06).EnableNoWait()
 	else
 		GetLinkedRef(LinkCustom06).DisableNoWait()
 	endif

 	StartTimer(0.5, 10)

	elevatorGoingUpDownScene.start()
	MaxFloorCount = LoadElevatorFloorCount.GetValueInt()
	CurrentFloorCount = 1
	if LoadElevatorDown.GetValueInt() == 1
   		Direction = "down"
   	else
   		Direction = "up"
   	endif

	ObjectReference DoorBlocker = GetLinkedRef(LinkCustom01)
   	DoorBlocker.EnableNoWait()

	ObjectReference AnimHelper = GetLinkedRef(LinkCustom02)
	AnimHelper.SetAnimationVariableFloat("fspeed", 0.5)

	RegisterForAnimationEvent(AnimHelper, "Done")

   	debug.Trace(self + "Elevator starting to go " + Direction + " " + MaxFloorCount)


	if Direction == "up"
		AnimHelper.PlayAnimation("StartUp")
	elseif Direction == "down"
		AnimHelper.PlayAnimation("StartDown")
	endif

	if CameraShakeOn
		Game.ShakeCamera(Game.GetPlayer(), 0.5, 0.2)
	EndIf
	ElevatorLoopInstance = ElevatorLoop.play(self)  
	Sound.SetInstanceVolume(ElevatorLoopInstance, 1)

	if GetLinkedRef().IsDisabled()
		GetLinkedRef().Enable()
	endif

   	utility.Wait(1)

	if Direction == "up"
		AnimHelper.PlayAnimation("Up")
	elseif Direction == "down"
		AnimHelper.PlayAnimation("Down")
	endif

	debug.Trace(self + "Elevator going " + Direction + " " + CurrentFloorCount + " floors of " + MaxFloorCount)

EndEvent


Event OnTimer(int aiTimerID)
    if aiTimerID == 10
    	if !ElevatorNonFollowerLocations.HasForm(Game.GetPlayer().GetCurrentLocation())
		  	Debug.Trace(self + " OnTimer()| Player is in a location(" + Game.GetPlayer().GetCurrentLocation() + ") that allows followers. Try to move followers to him.")
			   	; If the player's followers aren't already in the elevator, then move them to him.
			Actor[] PlayerFollowers = Game.GetPlayerFollowers()
			int CurrentFollowerIndex = 0
		  	while (CurrentFollowerIndex < PlayerFollowers.Length)
		  		if PlayerFollowers[CurrentFollowerIndex].GetParentCell() != Game.GetPlayer().GetParentCell()
		  			if PlayerFollowers[CurrentFollowerIndex].GetCurrentPackage() != CommandMode_Travel
		  				Debug.Trace(self + " OnTimer()| " + CurrentFollowerIndex + ": " + PlayerFollowers[CurrentFollowerIndex] + " moving to player.")
		    			PlayerFollowers[CurrentFollowerIndex].MoveTo(GetLinkedRef(LinkCustom05))
		    		endif
		    	endif
		    	CurrentFollowerIndex += 1
		   	endWhile
		else
		  	Debug.Trace(self + " OnTimer()| Player is NOT in a location(" + Game.GetPlayer().GetCurrentLocation() + ") that allows followers. Don't try to move them to him.")
		endif	
    endif
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	ObjectReference AnimHelper = GetLinkedRef(LinkCustom02)
	ObjectReference ElevatorDoor = GetLinkedRef()

    if (akSource == AnimHelper) && (asEventName == "Done")
    	if CurrentFloorCount < MaxFloorCount
    		if CameraShakeOn
    			Game.ShakeCamera(Game.GetPlayer(), 0.1, 2)
    		EndIf
	    	CurrentFloorCount = CurrentFloorCount + 1
	    	debug.Trace(self + "Elevator going " + Direction + " " + CurrentFloorCount + " floors of " + MaxFloorCount)
	    elseif CurrentFloorCount == MaxFloorCount
	    	if ElevatorDoor.IsTeleportAreaLoaded()
	    		debug.Trace(self + "Teleport Cell IS loaded, stopping here")
		    	AnimHelper.PlayAnimation("StartDown")
				AnimHelper.PlayAnimation("StartUp")
		    	Sound.StopInstance(ElevatorLoopInstance)
		    	if CameraShakeOn
					Game.ShakeCamera(Game.GetPlayer(), 0.5, 0.2)
				EndIf

				ObjectReference Meter = GetLinkedRef(LinkCustom03)
				if Meter
					Meter.PlayAnimation("Play02")
				endif

				ObjectReference ElevatorPanel = GetLinkedRef(LinkCustom04)

				ElevatorPanel.PlayAnimation("Play01")

				int DingInstanceID = ElevatorDing.play(self)  
				Sound.SetInstanceVolume(DingInstanceID, 1)
				utility.Wait(2)
				ObjectReference DoorBlocker = GetLinkedRef(LinkCustom01)
				DoorBlocker.DisableNoWait()

				if GetLinkedRef().IsDisabled()
					GetLinkedRef().Enable()
				endif

				utility.Wait(0)

				ElevatorDoor.Activate(Game.GetPlayer())

				UnregisterForAnimationEvent(AnimHelper, "Done")
				LoadElevatorDown.SetValueInt(2)
			else
	    		debug.Trace(self + "Teleport Cell is NOT loaded, keep looping.")
				if CameraShakeOn
    				Game.ShakeCamera(Game.GetPlayer(), 0.1, 2)
    			EndIf
			endif
		endif

		if CurrentFloorCount == 2 && MaxFloorCount > 5
			AnimHelper.SetAnimationVariableFloat("fspeed", 0.7)
			debug.Trace(self + "Speeding Up")
		elseif CurrentFloorCount == 3 && MaxFloorCount < ManyFloors
			AnimHelper.SetAnimationVariableFloat("fspeed", MaxSpeedFewFloors)
			debug.Trace(self + "Speeding Up More")
		elseif CurrentFloorCount == 3 && MaxFloorCount >= ManyFloors
			AnimHelper.SetAnimationVariableFloat("fspeed", MaxSpeedManyFloors)
			debug.Trace(self + "Speeding Up ALOT More")
		elseif CurrentFloorcount == MaxFloorCount - 2
			AnimHelper.SetAnimationVariableFloat("fspeed", 0.7)
			debug.Trace(self + "Slowing Down")
		elseif CurrentFloorcount == MaxFloorCount - 1
			AnimHelper.SetAnimationVariableFloat("fspeed", 0.5)
			debug.Trace(self + "Slowing Down More")
		endif

    endif
EndEvent


Event OnUnload()
	ObjectReference AnimHelper = GetLinkedRef(LinkCustom02)
    UnregisterForAnimationEvent(AnimHelper, "Done")
    LoadElevatorDown.SetValueInt(2)
EndEvent