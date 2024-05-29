;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_Cannibal03_001D1A63 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; animations
Game.GetPlayer().StartCannibal(akTargetRef as Actor)

;FX
utility.Wait(0.6)
pBloodHeavyParticles.Play((akTargetRef as Actor), 1.9)
pBloodSplatterHeavy.Play((akTargetRef as Actor))

Game.GetPlayer().PlayImpactEffect(pBloodBugPopImpactSet, "Head", 0, 0,-1, 256, false, false)

utility.Wait(0.5)
;(akTargetRef as Actor).equipItem(pCannibalSkeletonBone)


; Effect
PerkCannibalHeal.Cast(Game.GetPlayer(), Game.GetPlayer())

FollowersScript.SendAffinityEvent(self, CA_Event_EatCorpse, akTargetRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property CA_Event_EatCorpse Auto Const


SPELL Property PerkCannibalHeal Auto Const



EffectShader Property pBloodHeavyParticles Auto Const Mandatory

EffectShader Property pBloodSplatterHeavy Auto Const Mandatory

ImpactDataSet Property pBloodBugPopImpactSet Auto Const Mandatory
