Scriptname DLC04:DLC04_HC_MysteryMeat_CannibalEffect extends activemagiceffect

 Hardcore:HC_ManagerScript Property HC_Manager Auto Const Mandatory

int Property ChanceToCountAsEatingCorpse = 25 Auto Const Mandatory

 Event OnEffectStart(Actor akTarget, Actor akCaster)
     if akTarget == Game.GetPlayer() && Utility.RandomInt(1, 100) <= ChanceToCountAsEatingCorpse
     	HC_Manager.trace(self, "OnEffectStart() Counts as eating corpse: die roll < " + ChanceToCountAsEatingCorpse)

     	HC_Manager.PlayerEatsCorpse()
     endif
 EndEvent