Scriptname ChainedDoor extends ObjectReference Conditional

bool Property abChained = True auto conditional
bool Property abBusy = False auto
message Property ChainedMSG auto
message Property UnchainMeMSG auto
sound Property ChainedFX auto
sound Property OpenSound auto

Keyword Property PlayerActivateDoorChained Auto
Keyword Property PlayerActivateDoorChainedSameSide Auto

DoorChain ChainScript
ObjectReference myLink
Bool PlayedOpenSound
Bool abInitialized = False

Event OnCellLoad()
  myLink = GetLinkedRef()
  ChainScript = myLink as DoorChain
  abInitialized = True
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if !abInitialized && akActionRef == Game.GetPlayer()
        ;The player has activated the door without it being initialized, so initialize both the door and the chain
    	OnCellLoad()
        ChainScript.OnCellLoad()
    endif
    if abBusy == True
        ;do nothing
    else
    	if abChained == True && akActionRef == Game.GetPlayer()
    		;check to see which side of the door the player is on
    		if akActionRef.GetDistance(Self) < akActionRef.GetDistance(myLink)
    			ChainedMSG.Show()
                Game.GetPlayer().SayCustom(PlayerActivateDoorChained)
    		else
    			;player is closer to chained side
    			UnchainMeMSG.Show()
                Game.GetPlayer().SayCustom(PlayerActivateDoorChainedSameSide)
    		endif
    		;play failed sound effects regardless
    		ChainedFX.play(Self)
    		;play controller bump
    		Game.ShakeController(0.1, 0.1, 0.1)
    	else
    		;redundant check
    		if GetOpenState() == 3 || abBusy == True
    			Debug.Trace("Something is wrong, do nothing" + Self)
    			return
    		else
    			Debug.Trace("Open " + Self)
                if !PlayedOpenSound
                    PlayedOpenSound = True
                    ;play open sound effect
                    OpenSound.play(Self)
                endif
    		endif
    	endif
    endif
EndEvent