Scriptname DefaultCrippleOnLoad extends ObjectReference Const
{Cripples both left and right mobility of a reference OnLoad()}

bool property bLeftLeg = TRUE auto const
bool property bRightLeg = TRUE auto const
bool property bLeftArm= FALSE auto const
bool property bRightArm = FALSE auto const

ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const
ActorValue Property LeftAttackCondition Auto Const
ActorValue Property RightAttackCondition Auto Const

Event OnLoad()
	if bLeftLeg
		self.DamageValue(LeftMobilityCondition, 100)
	endif
	if bRightLeg
		self.DamageValue(RightMobilityCondition, 100)
	endif
	if bLeftArm
		self.DamageValue(LeftAttackCondition, 100)
	endif
	if bRightArm
		self.DamageValue(LeftAttackCondition, 100)
	endif
EndEvent