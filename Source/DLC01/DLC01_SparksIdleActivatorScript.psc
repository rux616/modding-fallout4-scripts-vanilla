Scriptname DLC01:DLC01_SparksIdleActivatorScript extends ObjectReference
{When activated by Sparks as part of his package, plays Sparks' Scanning Idle VFX toward this object's linked ref.}

VisualEffect property DLC01EyebotInteractVFX Auto Const Mandatory
{Sparks' Scanning Idle VFX.}

Event OnActivate(ObjectReference akActivator)
	DLC01EyebotInteractVFX.Play(akActivator, 2, Self.GetLinkedRef())
EndEvent