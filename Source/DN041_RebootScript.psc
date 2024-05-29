Scriptname DN041_RebootScript extends ObjectReference Hidden 

Keyword property LinkCustom01 Auto 
Keyword property LinkCustom02 Auto 
Keyword property LinkCustom03 Auto 

ActorValue Property ProtectronPodStatus Auto Const
ActorValue Property Aggression Auto Const

Function DN041_Reboot()
	
	ObjectReference Linker = Self.GetLinkedRef(LinkCustom01)

	Actor RobotA = Linker.GetLinkedRef(LinkCustom01) as Actor
	Actor RobotB = Linker.GetLinkedRef(LinkCustom02) as Actor

     RobotA.setValue(ProtectronPodStatus, 1)
     ;a.Activate(DN084_MassFusionSecurityActivator)
     RobotA.setValue(Aggression,2)
     RobotA.SetUnconscious(False)
     RobotA.EvaluatePackage()

     RobotB.setValue(ProtectronPodStatus, 1)
     ;a.Activate(DN084_MassFusionSecurityActivator)
     RobotB.setValue(Aggression,2)
     RobotB.SetUnconscious(False)
     RobotB.EvaluatePackage()

EndFunction
 
Function DN041_Elevator()

	ObjectReference ElevLinker = Self.GetLinkedRef(LinkCustom03)

	ElevLinker.EnableNoWait()

EndFunction
