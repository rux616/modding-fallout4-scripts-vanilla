Scriptname UFOActivatorScript extends ObjectReference Hidden

ObjectReference Property UFOCrashPoint const auto
ObjectReference Property AttachHelper const auto
ObjectReference Property UFOSoundHelper const auto
Quest Property UFOCrashQuest const auto
Scene Property UFOCrashQuestFlybyReaction const auto
Scene Property UFOCrashQuestImpactReaction const auto
Sound Property QSTUFOCrashFlyby const Auto
Sound Property QSTUFOCrashExplosion const Auto

Float Property CrashStartDistance = 60000.0 auto
Float Property CrashStartZ = 20000.0 Auto
Float Property SoundStartDistance = 30000.0 auto

Event OnActivate(ObjectReference akActionRef)
    Crash()
EndEvent

Function Crash()

	self.EnableNoWait()
	UFOSoundHelper.EnableNoWait()

	RegisterForRemoteEvent(AttachHelper, "OnTranslationComplete")
	float vectorX = game.GetPlayer().x - UFOCrashPoint.x
	float vectorY = game.GetPlayer().y - UFOCrashPoint.y
	float vectorLength = math.sqrt(vectorX * vectorX + vectorY * vectorY)
	float vectorAngle = math.atan(vectorY / vectorX)

	; ATAN only returns 0 to 180, so if X is negative, add 180 so we always get the angle from a consistent direction
	if (vectorX < 0)
		vectorAngle += 180
	endIf

	float CrashStartX = math.cos(vectorAngle) * (vectorLength + CrashStartDistance)
	float CrashStartY = math.sin(vectorAngle) * (vectorLength + CrashStartDistance)
	
	float SoundStartX = math.cos(vectorAngle) * (vectorLength + SoundStartDistance)
	float SoundStartY = math.sin(vectorAngle) * (vectorLength + SoundStartDistance)

	float SoundStopX = math.cos(vectorAngle) * (vectorLength - SoundStartDistance)
	float SoundStopY = math.sin(vectorAngle) * (vectorLength - SoundStartDistance)

	debug.trace("-------------------")
	debug.trace("X: " + vectorX)
	debug.trace("Y: " + vectorY)
	debug.trace("Length: " + vectorLength)
	debug.trace("Angle: " + vectorAngle)
	debug.trace("CrashX: " + CrashStartX)
	debug.trace("CrashY: " + CrashStartY)

	UFOSoundHelper.SetPosition(SoundStartX + UFOCrashPoint.x, SoundStartY + UFOCrashPoint.y, (CrashStartZ + UFOCrashPoint.z + Game.GetPlayer().z) / 2)
	;UFOSoundHelper.SplineTranslateTo(SoundStopX, SoundStopY, Game.GetPlayer().z, 0.0, 0.0, 0.0, afTangentMagnitude = 10000, afSpeed = 10000)
	;UFOSoundHelper.SplineTranslateTo(UFOCrashPoint.X, UFOCrashPoint.Y, UFOCrashPoint.Z, 0.0, 0.0, 0.0, afTangentMagnitude = 10000, afSpeed = 10000);
	UFOSoundHelper.SplineTranslateToRef(UFOCrashPoint, 10000, 10000)

	AttachHelper.SetPosition(CrashStartX + UFOCrashPoint.x, CrashStartY + UFOCrashPoint.y, CrashStartZ + UFOCrashPoint.z + Game.GetPlayer().z)
	AttachHelper.SplineTranslateToRef(UFOCrashPoint, 10000, 20000)
	int UFOFlyBySoundInstance = QSTUFOCrashFlyby.play(UFOSoundHelper)  
	Sound.SetInstanceVolume(UFOFlyBySoundInstance, 1)
	utility.Wait(1)
	UFOCrashQuestFlybyReaction.Start()
	utility.Wait(3)
	UFOSoundHelper.StopTranslation()

EndFunction


Event ObjectReference.OnTranslationComplete(ObjectReference akSender)
	;int UFOImpactSoundInstance = 
	UFOCrashQuest.SetStage(5)
	QSTUFOCrashExplosion.PlayAndWait(UFOSoundHelper)  
	;Sound.SetInstanceVolume(UFOImpactSoundInstance, 1)
	self.DisableNoWait()
	UFOSoundHelper.DisableNoWait()
	UFOCrashQuest.SetStage(10)
	;UFOCrashQuestImpactReaction.Start()
	;utility.Wait(10)
	;UFOCrashQuest.Stop()
EndEvent