Scriptname VendorAspirationContainerScrip extends ObjectReference

Quest Property pAspirationalItems Auto Const Mandatory
ReferenceAlias Property MyReferenceAlias Auto Const
Int Property stage Auto Const

int bHasRun


Event OnInit()
	if !bHasRun
		; Force me into my proper reference alias
		MyReferenceAlias.ForceRefTo(self)

		; Set the proper stage
		pAspirationalItems.SetStage(stage)

		bHasRun = 1
	endif
EndEvent