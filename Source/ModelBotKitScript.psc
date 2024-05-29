Scriptname ModelBotKitScript extends ObjectReference Const

MiscObject Property pBotModelSentry Auto Const
sound Property OBJLunchboxKidsRobotBuild Auto Const

Event OnActivate(ObjectReference akActionRef)
	if OBJLunchboxKidsRobotBuild.PlayAndWait(self)
   		Debug.Trace("Build sound has finished playing!")
   		  ;  modelBuildSound.play(self)
    PlaceAtNode("FacingNode01", pBotModelSentry)
    disable()
    delete()
	endIf

EndEvent