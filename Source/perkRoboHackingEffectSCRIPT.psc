Scriptname perkRoboHackingEffectSCRIPT extends ActiveMagicEffect

; terminal property RoboShutdownTerminal auto const
; perk property perkRobophobe auto const
; furniture property NPCVaultConsoleActivate auto const
; referencealias property targetedRobot auto const

; Event OnActivate(ObjectReference akActionRef)
; 	; NOTE - Moving this stuff to the perk as an activate entry point
;     if game.getPlayer().hasPerk(perkRobophobe)
;     	; play jack-in animation
;     	game.getPlayer().placeAtMe(NPCVaultConsoleActivate).activate(game.getplayer())
;     	; when done, pull up pip-boy interface
;     	utility.wait(3.5)
; 		targetedRobot.forceRefTo(akActionRef)
;     	RoboShutdownTerminal.showOnPipBoy()
;     endif
; EndEvent