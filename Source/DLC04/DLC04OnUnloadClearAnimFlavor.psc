Scriptname DLC04:DLC04OnUnloadClearAnimFlavor extends Actor Const

Event OnUnload()
	;On unload, remove any anim flavor's from this actor 
	;(used to make sure Shank doesn't get stuck in his notebook anim)
	self.ChangeAnimFlavor()
EndEvent