Scriptname GlowingSeaPOIJS01Script extends ObjectReference 


Actor property Turret01 auto
Actor property Turret02 auto
Actor property Protectron01 auto
Actor property Protectron02 auto

auto state waiting
Event OnActivate(ObjectReference akActionRef)
    turret01.setUnconscious(false)
    turret02.setUnconscious(false)
    ;Protectron01.setValue(ProtectronPodStatus, 1)
	Protectron01.setUnconscious(FALSE)
	Protectron01.startcombat(game.getplayer())
	Protectron01.evaluatePackage()
	;Protectron02.setValue(ProtectronPodStatus, 1)
	Protectron02.setUnconscious(FALSE)
	Protectron02.startcombat(game.getplayer())
	Protectron02.evaluatePackage()
    gotoState("Done")
EndEvent
endstate

state Done
	;do no thing
endstate