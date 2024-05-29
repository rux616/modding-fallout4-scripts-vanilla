ScriptName CZRuleBreakerScript Extends Actor Const

Event OnLoad()
	if !isDead()
		Self.SetRestrained(true)
	Endif
EndEvent