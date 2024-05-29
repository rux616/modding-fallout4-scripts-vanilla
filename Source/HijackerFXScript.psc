Scriptname HijackerFXScript extends ObjectReference 
{Add some scripted fx to the teleporter hijacker}


;Animation to play when 1st person teleporting starts
Idle Property IdleSynthTeleportOut Auto Const
;Imagespace for teleporting
ImageSpaceModifier Property TeleportIn1stPersonImod Auto Const
;camera attach fx for 1st person teleport
VisualEffect Property CameraAttachTeleportFX Auto Const
;dissolve fx for hands
EffectShader Property TeleportOut1stFXS Auto Const
;sound to be played in tandem with the idle
Sound Property OBJHijackerTeleportOut2DA Auto
;Sound fx setup for during teleportation
SoundCategorySnapshot Property CSHijackerTeleportPlayer Auto Const

int stage = 0





;step through cycle
Event OnActivate(ObjectReference akActionRef)	
	if stage == 3
		playAnimation("reset")
		stage = 0
	elseif stage == 1
		playAnimation("stage3")
		stage = 2
	elseif stage == 0
		playAnimation("stage2")
		stage = 1
	endIf
EndEvent

;final teleportation sequence
Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace("in trigger")
    if stage == 2 && akActionRef == game.getPlayer()
    	stage = 3
    	utility.wait(1)
    	;Play sound and idle animation
    	OBJHijackerTeleportOut2DA.play(self)   
    	game.getPlayer().PlayIdle(IdleSynthTeleportOut)
    	;fade in sound mix change
    	CSHijackerTeleportPlayer.Push(4)
    	;wait until teleport moment
    	utility.wait(5.9)
    	;last anim to stop sequences 
    	playAnimation("stage4")
    	utility.wait(0.1)
    	;play 1st person fx on player
    	TeleportOut1stFXS.play(game.getPlayer())
    	CameraAttachTeleportFX.Play(game.getPlayer())
    	;wait a bit
		utility.wait(5)
		;remove sound mix change
		CSHijackerTeleportPlayer.Remove()
		

	endif
EndEvent