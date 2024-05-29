Scriptname InstituteOldReactorRefScript extends ObjectReference Conditional

Event OnLoad()

	if MQ302.IsRunning()

;If Reactor was never powered on, remove the ability to do so
		if Inst305ReactorTriggerRef.IsDisabled()==0
			Inst305ReactorTriggerRef.Disable()
			Self.PlayAnimation("StartOn01")
		endif
	endif
EndEvent

ObjectReference Property Inst305ReactorTriggerRef Auto Conditional
Quest Property MQ302 Auto Const