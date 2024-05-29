Scriptname HostileFactionClutterHandlerScript extends ObjectReference Hidden

GlobalVariable Property HostileGlobalBrotherhoodOfSteel Auto Const Mandatory
GlobalVariable Property HostileGlobalInstitute Auto Const Mandatory
GlobalVariable Property HostileGlobalGunner Auto Const Mandatory

Keyword Property HostileGunnersEnableKeyword Auto Const Mandatory
Keyword Property HostileInstituteEnableKeyword Auto Const Mandatory
Keyword Property HostileBOSEnableKeyword Auto Const Mandatory

Event OnCellLoad()
	Debug.Trace(self + "OnCellLoad()")
    if HostileGlobalGunner.GetValue() == 0
		Debug.Trace(self + "OnCellLoad() GUNNERS are our Hostile Faction, enabling their stuff.")
    	GetLinkedRef(HostileGunnersEnableKeyword).EnableNoWait()
    elseif HostileGlobalInstitute.GetValue() == 0
		Debug.Trace(self + "OnCellLoad() INSITUTE are our Hostile Faction, enabling their stuff.")
    	GetLinkedRef(HostileInstituteEnableKeyword).EnableNoWait()
    elseif HostileGlobalBrotherhoodOfSteel.GetValue() == 0
		Debug.Trace(self + "OnCellLoad() BOS are our Hostile Faction, enabling their stuff.")
    	GetLinkedRef(HostileBOSEnableKeyword).EnableNoWait()
    endif
EndEvent