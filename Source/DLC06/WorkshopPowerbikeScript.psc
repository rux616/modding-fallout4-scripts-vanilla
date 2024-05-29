Scriptname DLC06:WorkshopPowerbikeScript extends ObjectReference Const

Event OnLoad()
    if IsFurnitureInUse() == false 
		; stop bike animation
		PlayAnimation("furnitureExitSlave")
    endif
EndEvent