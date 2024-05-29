Scriptname Inst302CombatBoSLoadArmor extends Actor Conditional


Keyword Property LinkPowerArmor Auto Const

Event OnLoad()
	if !IsDisabled()
		   Self.SwitchToPowerArmor(self.getlinkedref(LinkPowerArmor)) 
	endif
EndEvent