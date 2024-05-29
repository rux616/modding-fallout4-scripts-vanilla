Scriptname MS16BobbiUnloadScript extends Actor 

quest property MS16Quest auto mandatory

Event onUnload()
	if MS16Quest.isstagedone(230) 
		self.disable()
	endif
EndEvent