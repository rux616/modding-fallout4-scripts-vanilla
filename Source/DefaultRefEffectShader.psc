Scriptname DefaultRefEffectShader extends ObjectReference Const
{Default script used for applying an effect shader on the reference when it loads loads into a cell, or when the cell loads around it.}

EffectShader Property pFXS Auto Const
Bool Property ApplyOnLoad Auto Const

Event OnLoad()
	if (ApplyOnLoad)
	pFXS.Play(Self)
	EndIf
EndEvent


