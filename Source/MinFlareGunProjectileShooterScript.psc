Scriptname MinFlareGunProjectileShooterScript extends ObjectReference Const
{This script is on the fake projectile}

Weapon Property MinFlareWeapon Auto Const
ReferenceAlias Property MinutemanLeader Auto Const

float startingHeight = 0.0 Const

Event onLoad()
	Debug.Trace(self + ": Has called OnLoad")
	float angleToLeader = GetHeadingAngle(MinutemanLeader.GetRef())
	debug.trace(self + " z angle=" + GetAngleZ())
	debug.trace(self + " angleToLeader=" + angleToLeader + " , setting z angle to " + (angleToLeader + GetAngleZ()))
	Self.SetAngle(0.0, 0.0, GetAngleZ() + angleToLeader)
	Self.SetPosition(afX=GetPositionX(), afY=GetPositionY(), afZ = GetPositionZ() + startingHeight)
	MinFlareWeapon.Fire(self)
	utility.wait(3.0)
	delete()
EndEvent
