;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_Cannibal_0004B259 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; animations
Game.GetPlayer().StartCannibal(akTargetRef as Actor)

;FX
utility.wait(0.6)
pBloodHeavyParticles.Play((akTargetRef as Actor), 1.2)
pBloodSplatterHeavy.Play((akTargetRef as Actor))

Game.GetPlayer().PlayImpactEffect(pBloodBugPopImpactSet, "Head", 0, 0,-1, 256, false, false)

; Effect
PerkCannibalHeal.Cast(Game.GetPlayer(), Game.GetPlayer())

FollowersScript.SendAffinityEvent(self, CA_Event_EatCorpse, akTargetRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property PerkCannibalHeal Auto Const

Keyword Property CA_Event_EatCorpse Auto Const


EffectShader Property pBloodSplatterHeavy Auto Const Mandatory


EffectShader Property pBloodHeavyParticles Auto Const Mandatory

ImpactDataSet Property pBloodBugPopImpactSet Auto Const Mandatory
