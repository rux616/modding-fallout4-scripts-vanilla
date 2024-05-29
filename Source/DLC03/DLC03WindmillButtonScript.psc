Scriptname DLC03:DLC03WindmillButtonScript extends ObjectReference Hidden

Keyword Property Linkcustom01 const auto
Sound Property TurnOnSound const auto

Event OnActivate(ObjectReference akActionRef)
    (GetLinkedRef(LinkCustom01) as ToggleButtonScript).SetActive(TRUE)
    int instanceID = TurnOnSound.play(self)
	Sound.SetInstanceVolume(instanceID, 1)
EndEvent