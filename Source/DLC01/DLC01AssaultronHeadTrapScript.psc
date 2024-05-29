Scriptname DLC01:DLC01AssaultronHeadTrapScript extends ObjectReference 

spell property DLC01AssaultronHeadTrapSpell auto mandatory
sound Property LaserFireSound Auto mandatory
sound property disarmSound auto mandatory
ImageSpaceModifier Property laserImod Auto mandatory
int LaserFireSoundID = 0 
ObjectReference spellCaster
ObjectReference mylight
ObjectReference mylightslight
int property firetime auto
keyword property LinkCustom01 auto mandatory const


auto State waiting
	event OnBeginState(string asOldState)
		mylight = self.getlinkedRef(LinkCustom01)
		mylightslight = mylight.getlinkedRef()
	endEvent
	Event onActivate(ObjectReference akActionRef)
		if akActionRef as Actor
			GoToState("Disarm")
		else 
		goToState("Inactive")
		spellCaster = self.getlinkedRef() 
		mylight = self.getlinkedRef(linkcustom01)
		mylightslight = mylight.getlinkedRef()
		LaserFireSoundID = LaserFireSound.play(self)
		DLC01AssaultronHeadTrapSpell.cast(spellCaster, spellCaster.getlinkedRef())
		if akActionRef == game.getPlayer()
			laserImod.ApplyCrossFade(0.2)
		endif
		utility.wait(firetime)
		self.getlinkedRef().InterruptCast()
		laserImod.remove()
		mylight.disable()
		mylightslight.disable()
		self.setDestroyed()
		self.damageObject(1)
		endif
	endEvent
endState

state Disarm
	event OnBeginState(string asOldState)
		mylight = self.getlinkedRef(LinkCustom01)
		mylightslight = mylight.getlinkedRef()
		LaserFireSoundID = LaserFireSound.play(self)
		DisarmSound.Play(self)
		mylight.disable()
		mylightslight.disable()
		self.setDestroyed()
		self.damageObject(1)
	endEvent
endState

state Inactive
Event onReset()
	self.setDestroyed(false)
	goToState("waiting")
endEvent
endstate








