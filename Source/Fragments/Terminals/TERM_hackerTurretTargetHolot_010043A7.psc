;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_hackerTurretTargetHolot_010043A7 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] ExplosivesArray = akTerminalRef.GetLinkedRef(LinkTerminalTurret).FindAllReferencesOfType(ExplosivesList, 2048)
ObjectReference[] turretsArray = akTerminalRef.GetLinkedRefChain(LinkTerminalTurret)
int i = 0
int t = 0
int e = 0
float iLastClosestDistance = 0

while utility.IsInMenuMode()
endwhile
while i < ExplosivesArray.Length
		terminalHackerTurretTarget.clear()
		t = 0
		iLastClosestDistance = turretsArray[t].GetDistance(ExplosivesArray[i])
	while t < akTerminalRef.CountLinkedRefChain(LinkTerminalTurret)
		if iLastClosestDistance >= turretsArray[t].GetDistance(ExplosivesArray[i])
			terminalHackerTurret.Clear()
			utility.wait(0.1)
			terminalHackerTurret.ForceRefTo(turretsArray[t])
		(turretsArray[t] as Actor).evaluatepackage()
			iLastClosestDistance = turretsArray[t].GetDistance(ExplosivesArray[i])
		endif
	t+= 1
	endwhile
		terminalHackerTurretTarget.ForceRefTo(ExplosivesArray[i])
		utility.wait(0.1)
		while terminalHackerTurret.GetActorRef().GetCurrentPackage() == turretTargetUseWeapon
		endwhile
		turretTargetFireScene.forcestart()
		utility.wait(2.5)
		while terminalHackerTurret.GetActorRef().GetCurrentPackage() == turretTargetUseWeapon
		endwhile
	e = 0
	while e < akTerminalRef.CountLinkedRefChain(LinkTerminalTurret)
		(turretsArray[e] as Actor).evaluatepackage()
		e += 1
	endwhile
i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] DoorBlocksArray = akTerminalRef.GetLinkedRef(LinkTerminalTurret).FindAllReferencesOfType(DoorBlockerList, 2048)
ObjectReference[] turretsArray = akTerminalRef.GetLinkedRefChain(LinkTerminalTurret)
int i = 0
int t = 0
int e = 0
float iLastClosestDistance = 0
while utility.IsInMenuMode()
endwhile
while i < DoorBlocksArray.Length
		terminalHackerTurretTarget.clear()
		t = 0
		iLastClosestDistance = turretsArray[t].GetDistance(DoorBlocksArray[i])
	while t < akTerminalRef.CountLinkedRefChain(LinkTerminalTurret)
		if iLastClosestDistance >= turretsArray[t].GetDistance(DoorBlocksArray[i])
			terminalHackerTurret.Clear()
			utility.wait(0.1)
			terminalHackerTurret.ForceRefTo(turretsArray[t])
		(turretsArray[t] as Actor).evaluatepackage()
			iLastClosestDistance = turretsArray[t].GetDistance(DoorBlocksArray[i])
		endif
	t+= 1
	endwhile
		terminalHackerTurretTarget.ForceRefTo(DoorBlocksArray[i])
		utility.wait(0.1)
		while terminalHackerTurret.GetActorRef().GetCurrentPackage() == turretTargetUseWeapon
		endwhile
		turretTargetFireScene.forcestart()
		utility.wait(2.5)
		while terminalHackerTurret.GetActorRef().GetCurrentPackage() == turretTargetUseWeapon
		endwhile
	e = 0
	while e < akTerminalRef.CountLinkedRefChain(LinkTerminalTurret)
		(turretsArray[e] as Actor).evaluatepackage()
		e += 1
	endwhile
i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DNMasterQuest Auto Const

ReferenceAlias Property terminalHackerTurret Auto Const

ReferenceAlias Property terminalHackerTurretTarget Auto Const

Scene Property turretTargetFireScene Auto Const

Keyword Property LinkTerminalTurret Auto Const

FormList Property ExplosivesList Auto Const

FormList Property DoorBlockerList Auto Const

Package Property turretTargetUseWeapon Auto Const
