Scriptname TestUnderWaterWorldScript extends ObjectReference

ObjectReference Property myPowerArmor Auto
VisualEffect Property pFootStepSiltE Auto Const
Actor myPlayer
SPELL Property pPowerArmorUnderwaterLightSpell Auto Const

Weapon Property pTestHarpoonGun Auto Const

Ammo Property pTestAmmoHarpoon Auto Const

Event OnLoad()
	myPlayer = game.getPlayer()
    if (myPlayer.Is3DLoaded())
    	myPlayer.SwitchToPowerArmor(myPowerArmor)
    	debug.trace("Tried to switch to pa on load")
    	pFootStepSiltE.play(myPlayer)
    	myPlayer.additem(pTestHarpoonGun, 1)
    	myPlayer.equipitem(pTestHarpoonGun)
    	myPlayer.additem(pTestAmmoHarpoon, 1000)
    	utility.wait(2)
    	;pPowerArmorUnderwaterLightSpell.cast(game.getplayer())
	endIf
EndEvent

; Event OnTriggerEnter(ObjectReference akActionRef)
;     	myPlayer.SwitchToPowerArmor(myPowerArmor)
;     	debug.trace("Tried to switch to pa on trigger")
; EndEvent



