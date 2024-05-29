Scriptname tpThistleShrapnelSCRIPT extends ObjectReference

WEAPON PROPERTY shrapnelWeap AUTO
AMMO PROPERTY shrapnel AUTO

float fragAngle0 = 45.0
float fragAngle1 = 90.0
float fragAngle2 = 135.0
float fragAngle3 = 180.0
float fragAngle4 = 225.0
float fragAngle5 = 270.0
float fragAngle6 = 315.0
float newAngle
float newHeight

;EVENT OnTriggerEnter(ObjectReference akActionRef)
Event OnLoad()
    
    ; //fire the shrapnel
	self.disable()

	; //explode a little higher
	newHeight = self.getPositionZ() + utility.randomInt(30,70) 
	self.setPosition(self.getPositionX(), self.getPositionY(), newHeight)

	; //HORIZONTAL SHOTS //

    ; //shot 0
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(5.0, getAngleY(), fragAngle0)

    ; //shot 1
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(355.0, getAngleY(), fragAngle1)

    ; //shot 2
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(10.0, getAngleY(), fragAngle2)

    ; //shot 3
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(350.0, getAngleY(), fragAngle3)

    ; //shot 4
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(5.0, getAngleY(), fragAngle4)

    ; //shot 5
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(355.0, getAngleY(), fragAngle5)

    ; //shot 6
    shrapnelWeap.Fire(self, shrapnel)
    self.setAngle(10.0, getAngleY(), fragAngle6)    

    

EndEvent 