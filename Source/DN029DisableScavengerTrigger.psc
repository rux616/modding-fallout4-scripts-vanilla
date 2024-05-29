Scriptname DN029DisableScavengerTrigger extends ReferenceAlias Hidden Const

ReferenceAlias[] Property AliasesThatCanBeDisabled Auto Const
Quest Property DN029SecondWaveA Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if CommonArrayFunctions.CheckObjectReferenceAgainstReferenceAliasArray(akActionRef, AliasesThatCanBeDisabled)
    	akActionRef.DisableNoWait()
    	DN029SecondWaveA.SetStage(400)
    endif
EndEvent