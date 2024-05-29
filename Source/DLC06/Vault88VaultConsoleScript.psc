Scriptname DLC06:Vault88VaultConsoleScript extends ObjectReference Const
{ make sure activation unblocked on load }

Event OnLoad()
	; make sure console can be used
	BlockActivation(False, False)
	PlayAnimation("reset")
endEvent
