Scriptname MS16ExplosivesTriggerScript extends ObjectReference 


;message property explodeWallMessage auto
scene property CaseyScene auto



Event onActivate(objectReference akActionRef)

	CaseyScene.start()
	;pgetLinkedRef().disable()
	;self.disable()

EndEvent