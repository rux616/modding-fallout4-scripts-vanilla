Scriptname DLC03:DLC03InvisibleLoadDoorScript extends ObjectReference Const

Event OnInit()
  ;player shouldn't see activate text, but NPCs still need to be able to activate it
  Self.BlockActivation(False, True)
EndEvent