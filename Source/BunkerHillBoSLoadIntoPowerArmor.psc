Scriptname BunkerHillBoSLoadIntoPowerArmor extends Actor Const

Keyword Property LinkPowerArmor Auto Const

Event OnCellLoad()
   Self.SwitchToPowerArmor(self.getlinkedref(LinkPowerArmor)) 
EndEvent
