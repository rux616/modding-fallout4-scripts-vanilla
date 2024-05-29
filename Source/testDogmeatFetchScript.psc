Scriptname testDogmeatFetchScript extends ObjectReference

import game

actorBase property testDogmeatBuddy auto
objectREference property DogmeatRef auto

int proxTimer = 1

EVENT onInit()
	; blockActivation()
	startTimer(0.25, proxTimer)
	debug.trace("initialized timer")
endEVENT

EVENT onTimer(int aiTimerID)
	if aiTimerID == proxTimer
		; debug.trace("timer tick")
		if getDistance(dogmeatRef) < 128
			debug.trace("dog is nearby")
			setMotionType(Motion_Dynamic, TRUE)
			;addHavokBallAndSocketConstraint(dogmeatRef,"Dogmeat_Head",self,"CLONE HuntingRifleProto",0,0,0)
			; addHavokBallAndSocketConstraint(self,"CLONE beer01",dogmeatRef,"Dogmeat_Head",0,0,0)
		endif

		startTimer(0.25, proxTimer)
	endif
endEVENT

; EVENT onActivate(ObjectReference actronaut)
; 	if (actronaut as actor).getActorBase() == testDogmeatBuddy
; 		; game.addHavokBallAndSocketConstraint(corpse,"NPC Neck [Neck]",self,"JointHelper01",0,0,16)
; 		addHavokBallAndSocketConstraint(actronaut,"Dogmeat_Jaw",self,"Cylinder152",0,0,0)
; 	endif
; endEVENT