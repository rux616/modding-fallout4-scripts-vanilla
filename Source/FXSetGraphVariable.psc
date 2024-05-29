Scriptname FXSetGraphVariable extends ObjectReference Const
{Simple script to set a graph variable on an object when it loads.}

String Property sGraphVariableName Auto Const

Float Property fGraphVariableValue = 0.0 Auto Const


Event OnLoad()
  if !IsDisabled()
      SetAnimationVariableFloat(sGraphVariableName,fGraphVariableValue)
  endif
endEvent

