Scriptname DN143EnableHostileScript extends ObjectReference Hidden Const
{Disables itself if, OnLoad(), the gunners are the current hostile faction.}

GlobalVariable Property HostileGlobalGunner Auto Const


Event OnLoad()

	if HostileGlobalGunner.GetValue() == 0
		self.DisableNoWait()
	endif

EndEvent