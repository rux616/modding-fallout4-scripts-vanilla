Scriptname CreationClub:VRWorkshops:VRWorkshopScript extends ObjectReference
{Added directly to VR Workshop workbench instances. Handles misc events and crafting restrictions.}

Group ActorValues
{Used to detect crafting and modify behavior in VR}
	ActorValue Property Food Auto Const Mandatory
	ActorValue Property Water Auto Const Mandatory
	ActorValue Property VendorIncome Auto Const Mandatory
EndGroup

Group FormLists
	FormList Property VRWorkshopShared_DisallowedObjectsList Auto Mandatory
	{Formlist updated at runtime on save load to detect DLC objects player cannot craft in VR.}
EndGroup

Group Messages
	Message Property VRWorkshopShared_Message_ObjectNotCraftable Auto Const Mandatory
	{Message shown when trying to craft}
	Message Property VRWorkshopShared_TutorialMessage_VRResources Auto Const Mandatory
	{One-time tutorial message shown when crafting food and water}
	Message Property VRWorkshopShared_Message_NoScrapOrStore Auto Const Mandatory
	{Tell the player they cannot store or scrap certain items}
EndGroup

Group GlobalVariables
	GlobalVariable Property VRWorkshopShared_TutorialShown_VRResources Auto Mandatory
EndGroup

Group Effects
	EffectShader Property TeleportOutFXS Auto Const Mandatory
	Sound Property TeleportSound Auto Const Mandatory
	Sound Property ErrorSound Auto Const Mandatory
EndGroup

;Internal Vars
;=============
Float AnimationDuration = 1.2 Const ;VFX delay for fading bad objects out

;Events
;=============
Event OnWorkshopMode(bool aStart)
	debug.trace("VR WORKSHOP: " + self + " OnWorkshopMode " + aStart)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	Debug.Trace("VR WORKSHOP: " + akReference + " crafted.")

	;Block blacklisted objects and vendors from being crafted in VR
	If(VRWorkshopShared_DisallowedObjectsList.HasForm(akReference.GetBaseObject() as Form) || akReference.GetValue(VendorIncome))
		debug.trace("VR WORKSHOPS: " + akReference + " is not allowed in VR, removing.")
		VRWorkshopShared_Message_ObjectNotCraftable.Show()
		ErrorSound.Play(akReference)
		TeleportOutFXS.play(akReference, AnimationDuration)
		TeleportSound.Play(akReference)
		Utility.Wait(AnimationDuration)
		akReference.DisableNoWait()
		akReference.Delete()
	;Block activation of water and food objects so they cannot be clicked on to harvest
	ElseIf(akReference.GetValue(Food) || akReference.GetValue(Water))
		debug.trace("VR WORKSHOP: " + akReference + " has food or water AV, block activation.")
		akReference.BlockActivation(true, true) ;effectively turn the item into a static object
		If(VRWorkshopShared_TutorialShown_VRResources.GetValue() == 0)
			VRWorkshopShared_TutorialMessage_VRResources.Show()
			VRWorkshopShared_TutorialShown_VRResources.SetValue(1)
		EndIf
	EndIf
EndEvent