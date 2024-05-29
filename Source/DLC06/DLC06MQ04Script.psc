Scriptname DLC06:DLC06MQ04Script extends Quest Const

ReferenceAlias[] Property BuildAreaActivators Auto Const

int property iCompleteStage=500 auto const 

function CheckForCompletion()
	int i = 0
	bool bAllDone = true
	while i < BuildAreaActivators.Length && bAllDone
		DLC06:VaultWorkshopActivatorScript theActivator = BuildAreaActivators[i].GetRef() as DLC06:VaultWorkshopActivatorScript
		if theActivator.bActive == false
			bAllDone = false 
		endif
		i += 1
	endWhile
	if bAllDone 
		SetStage(iCompleteStage)
	endif
endFunction