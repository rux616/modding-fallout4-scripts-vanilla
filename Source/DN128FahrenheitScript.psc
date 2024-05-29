Scriptname DN128FahrenheitScript extends Actor

import game
import debug
import utility

effectshader property fireEffect auto
actorBase property FahrenheitBase auto
explosion property shieldsplosion auto
ActorValue property SpeedMult auto
ActorValue property FahrenheitShield auto
;ActorValue property FahrenheitShieldDamage auto
spell property FahrenheitShieldSpell auto
ImagespaceModifier property flashImod auto
int FahrenheitShieldDamage = 0
int property shieldMaxDamage auto
int property shieldDownTime auto

idle property castShield auto
idle property shieldBreak auto

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

auto State startState
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;FahrenheitShieldDamage = 0
		if (aeCombatState == 1) || (aeCombatState == 2)
			gotoState("shieldOn")
		endif
	EndEvent
EndState

State shieldOn
	Event onBeginState(string asOldState)
			;if self.getValue(FahrenheitShield) == 0
				self.setValue(FahrenheitShield, 1)
				self.evaluatepackage()
			;endif
			if self.isdead() == false
				;fireEffect.play(self)
			endif
			self.playidle(castShield)
			wait(1)
			self.AddSpell(FahrenheitShieldSpell)
			;self.setValue(FahrenheitShield, 1)
			;SetAlpha(1, false)
			self.evaluatepackage()
			StartCombat(Game.GetPlayer())
			RegisterForHitEvent(self) ; get one hit
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		FahrenheitShieldDamage = FahrenheitShieldDamage + 1
		if FahrenheitShieldDamage >= shieldMaxDamage
			akAggressor.placeatme(shieldsplosion)
			FahrenheitShieldDamage = 0
			gotoState("Flash")
		else
			RegisterForHitEvent(self) ; ready for another hit
		endif
	EndEvent
EndState

state Flash 
	Event onBeginState(string asOldState)
		;fireEffect.stop(self)
		self.playidle(shieldBreak)
		wait(1.2)
		self.RemoveSpell(FahrenheitShieldSpell)
		self.setValue(FahrenheitShield, 0)
		evaluatePackage()
		FahrenheitShieldDamage = 0
		self.setValue(SpeedMult, 3000)
		flashImod.ApplyCrossFade(0.25)
		wait(1)
		SetAlpha(0, false)
		disable(0)
		enable(0)
		SetAlpha(0, false)
		utility.wait(1)
		self.setValue(SpeedMult, 100)
		disable(0)
		enable(0)
		SetAlpha(1, false)
		ImagespaceModifier.RemoveCrossFade(2)
		gotoState("Vulnerable")
	EndEvent
endState

state Vulnerable
	Event onBeginState(string asOldState)
		;self.setValue(FahrenheitShield, 1)
		;self.evaluatepackage()
		wait(shieldDownTime)
		gotoState("ShieldOn")
	EndEvent
endState