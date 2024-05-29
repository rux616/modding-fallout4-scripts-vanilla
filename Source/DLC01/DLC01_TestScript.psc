Scriptname DLC01:DLC01_TestScript extends ObjectReference

ObjectReference property Machine01 Auto Const

ObjectReference property Machine02 Auto Const
Light property defaultLightFire01FlickerGoboWireBarrelLFBright Auto Const
Static property AnchorStatic Auto Const

Event OnActivate(ObjectReference akActivator)
	Machine01.PlayAnimation("Play01")
	Utility.Wait(3)

	ObjectReference Machine02Light = Machine02.PlaceAtMe(defaultLightFire01FlickerGoboWireBarrelLFBright)
	ObjectReference Machine02Anchor = Machine02.PlaceAtMe(AnchorStatic)
	Utility.Wait(2)
	Debug.Trace("Attaching " + Machine02Light + " to " + Machine02)
	Machine02Light.AttachTo(Machine02)
	Debug.Trace("Attaching " + Machine02Anchor + " to " + Machine02)
	Machine02Anchor.AttachTo(Machine02)
	Utility.Wait(2)
	Machine02.PlayAnimation("Play01")
EndEvent
