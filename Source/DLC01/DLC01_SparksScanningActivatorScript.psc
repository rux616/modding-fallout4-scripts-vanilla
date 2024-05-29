Scriptname DLC01:DLC01_SparksScanningActivatorScript extends ObjectReference
{When activated by Sparks as part of his package, plays Sparks' Scanning Idle VFX toward this object's linked ref.}

VisualEffect property DLC01EyebotInteractVFX Auto Const Mandatory
{Sparks' Scanning Idle VFX.}

Keyword property LinkCustom01 Auto Const Mandatory

ObjectReference myTarget

Event OnLoad()
	myTarget = Self.GetLinkedRef()
EndEvent

Event OnActivate(ObjectReference akActivator)
	akActivator.SetLinkedRef(myTarget, LinkCustom01)
	DLC01EyebotInteractVFX.Play(akActivator, 2, myTarget)
EndEvent