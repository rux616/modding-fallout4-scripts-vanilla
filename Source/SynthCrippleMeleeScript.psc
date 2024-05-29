Scriptname SynthCrippleMeleeScript extends ActiveMagicEffect
{Adds shock attack to the synth melee when they are crippled}

Weapon Property pSynthMelee Auto Const Mandatory
;invisible shock melee weapon to add once they lose a limb

VisualEffect Property pSynthBodyShockFXVE Auto Const Mandatory
;Vfx to play to show shock damage

Auto state alive

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	actor selfRef = self.GetTargetActor()
   	;debug.trace("cripCripCrip")
   	;add melle weapon so they wont run or cower
    self.GetTargetActor().equipItem(pSynthMelee)
    ;play shock fx to show additional damage
    pSynthBodyShockFXVE.Play(selfRef)
EndEvent

Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
  goToState("dead")
    ;stop shock fx 
    pSynthBodyShockFXVE.Stop(selfRef)
EndEvent

endState

state dead

  ;do nothing

endstate

