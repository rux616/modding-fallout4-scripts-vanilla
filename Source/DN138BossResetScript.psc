Scriptname DN138BossResetScript extends ScriptedResetRef Hidden

Keyword Property LinkCustom01 Auto Const
ActorBase Property DN138SollyAsRaider Auto Const
Quest Property DN138 Auto Const

Event OnCellDetach()
    RegisterForReset()
EndEvent

Function ScriptedReset()
    ;If Solly has been killed when we reset then enable myself as the boss from here on out.
    if DN138SollyAsRaider.GetDeadCount() > 0
    	Self.Enable()
    	GetLinkedRef(LinkCustom01).Disable()
    endif
    	;If Solly is disabled, and the water has been lowered, then enable myself as the boss from here on out.
    if GetLinkedRef(LinkCustom01).IsDisabled() && DN138.IsStageDone(1500)
    	Self.Enable()
    	GetLinkedRef(LinkCustom01).Disable()
    endif
EndFunction