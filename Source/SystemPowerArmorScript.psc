Scriptname SystemPowerArmorScript extends Quest  

Race myPlayerRace
Race Property PowerArmorRace Auto
Int myBatteryLife
Int myMaxBatteryLife
ObjectReference Property myPowerArmorRef Auto

;TEMP Properties to give player Machine Gun
Weapon Property MachineGun01 Auto

;All the battery life data lives on the Power Armor Activator. So we pass the data from the activator into the Power Armor system, and then pass that data back when we're done
Function PowerArmorStartUp (ObjectReference PowerArmorRef, Int CurrentBatteryLife, Int MaxBatteryLife)
	;make sure debug logs are catching relevent data
	debug.trace(self + " Power Armor System Online.")
	debug.trace(self + " Player is in Power Armor Object Reference: " + PowerArmorRef)
	debug.trace(self + " Power Armor Battery Life is: " + CurrentBatteryLife)
	debug.trace(self + " Power Armor Maximum Battery Life is: " + MaxBatteryLife)
	;Store the player's race so we can swap it later
	myPlayerRace = Game.GetPlayer().GetRace()
	Game.GetPlayer().SetRace(PowerArmorRace)
	Debug.MessageBox("You step into the Power Armor")
	;store activator reference
	myPowerArmorRef = PowerArmorRef
	;store power armor battery life
	myBatteryLife = CurrentBatteryLife
	myMaxBatteryLife = MaxBatteryLife
	debug.notification("Current Power Armor Charge: " + myBatteryLife)

	;TEMP -- Give the player the machine gun since we don't have the Pipboy.
	Game.GetPlayer().EquipItem(MachineGun01)

EndFunction

Function PowerArmorRecharge (int RechargeAmount)
	myBatteryLife = myBatteryLife + RechargeAmount
	If myBatteryLife > myMaxBatteryLife
		myBatteryLife = myMaxBatteryLife
	EndIf
	debug.notification("Current Power Armor Charge: " + myBatteryLife)
EndFunction

Function PowerArmorShutdown()
	debug.trace(self + " Power Armor System Offline.")
	;output data back to the Power Armor Activator
	(myPowerArmorRef as PowerArmorActivatorScript).PowerArmorSystemSync(myBatteryLife, myMaxBatteryLife)
	;clear the Power Armor Activator Reference
	myPowerArmorRef = none
	Game.GetPlayer().SetRace(myPlayerRace)
	debug.messagebox("You exit the Power Armor")
EndFunction