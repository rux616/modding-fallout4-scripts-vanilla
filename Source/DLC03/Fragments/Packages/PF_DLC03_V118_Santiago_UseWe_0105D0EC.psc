;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Packages:PF_DLC03_V118_Santiago_UseWe_0105D0EC Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
package ThisPackage = self
debug.Trace(Self + ": ThisPackage >>" + ThisPackage)
debug.Trace(Self + ": GetCurrentPackage>>" + akActor.GetCurrentPackage())
 int Count = myWeapons.length - 1
weapon currentWeapon
int NewWeapon

While akActor.GetCurrentPackage() == ThisPackage
	Debug.Trace(self + ": Is In UseWeaponLoop")

	currentWeapon = akActor.GetEquippedWeapon()
	if currentWeapon 
		akActor.RemoveItem(currentWeapon )
	endif

	NewWeapon = utility.RandomInt(0, Count)
	akActor.EquipItem(MyWeapons[NewWeapon], true, true)
	utility.wait(WaitTime)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property myWeapon Auto Const

Weapon[] Property MyWeapons Auto Const

Float Property waitTime = 4.0 Auto Const
