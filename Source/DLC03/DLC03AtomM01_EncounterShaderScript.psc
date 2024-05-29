Scriptname DLC03:DLC03AtomM01_EncounterShaderScript extends ReferenceAlias

Event OnLoad()
	;When this alias loads in, apply shader if has 3d
	ObjectReference myObj = self.GetRef()
	EffectShader myFX = (GetOwningQuest() as DLC03AtomM01EncounterQuestScript).DLC03FogMotherFXS

	if myObj.Is3dLoaded() && !myObj.IsDisabled()
		myFX.Play(myObj)
	endif
EndEvent