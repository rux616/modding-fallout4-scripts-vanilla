Scriptname CryoCorpseScript extends Actor

EffectShader Property CryoCorpseFXS Auto Const

Event OnLoad()
	gotostate("hasbeentriggered")
	;Self.BlockActivation()
	CryoCorpseFXS.Play(Self)
	;make sure you cannot VATS target
	Self.SetPlayerTeammate(abCanDoFavor=False)
EndEvent

State hasbeentriggered
	;empty state
EndState