Scriptname DLC03:DLC03MQ06_HarborHotelSwitchScript extends ObjectReference Const

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
Sound Property OBJKeyCardActivateFail Auto Const Mandatory
Sound Property DLC03QSTKeypadMQ06 Auto Const Mandatory

Sound Property DRSWarehouseSlideOpen Auto Const Mandatory
Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property LinkCustom02 Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)

	;If player hasn't already opened secret room in Grand Harbor Hotel...
	;Play sound and open door if player has acquired the secret room code
	if !DLC03MQ06_NukeHandling.GetStageDone(10) && akActionRef == Game.GetPlayer()
		if DLC03MQ06_NukeHandling.GetStageDone(5)
			DLC03QSTKeypadMQ06.PlayandWait(self)

			DLC03MQ06_NukeHandling.SetStage(10)

			; Slide Bookcase
			ObjectReference LRef = GetLinkedRef(LinkCustom01)

			LRef.SetAnimationVariableFloat("fvalue", 1)
    		LRef.SetAnimationVariableFloat("fspeed", 4)
    		LRef.PlayAnimation("Play01")
			DRSWarehouseSlideOpen.Play(GetLinkedRef(LinkCustom01))
			utility.Wait(5)

    		; Open Door
    		GetLinkedRef(LinkCustom02).SetOpen(true)
		else
			OBJKeyCardActivateFail.PlayandWait(self)
		endif
	endif
EndEvent