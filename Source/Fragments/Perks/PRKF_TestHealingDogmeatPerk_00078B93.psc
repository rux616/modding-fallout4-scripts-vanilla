;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_TestHealingDogmeatPerk_00078B93 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;debug.Trace("Dogmeat health at " + (akTargetRef as Actor).GetValue("Health") + " which is %" + ((akTargetRef as Actor).GetValuePercentage("Health") * 100))
TestHealingDogmeatSpell.Cast(akTargetRef, akTargetRef)
debug.Notification("Used a Stimpak on Dogmeat!")
int instanceID = UIModsComponentsRubber.play(akTargetRef)
akActor.RemoveItem(Stimpak,1)
Sound.SetInstanceVolume(instanceID, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
SPELL Property TestHealingDogmeatSpell Auto Const

sound Property UIModsComponentsRubber Auto Const

Potion Property Stimpak Auto Const
